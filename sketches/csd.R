library(emaph)
library(tidyverse)

library(zoo)
library(factoextra) # to plot pca


data(csd)

# t ----------------------------------------------------------------------------

csd$t <- as.numeric(difftime(csd$date, csd$date[1], units = "days")) + 1


# rmeove rows with lots of missing values --------------------------------------

csd$nna <- csd %>% 
   select(matches("mood_|pat_worry")) %>%
   is.na(.) %>% rowSums 
csd <- csd %>% filter(nna == 0)

# Simple sum scores ------------------------------------------------------------

#irritated, content, lonely, anxious, enthusiastic, cheerful, 
#guilty, indecisive, strong, restless and agitated. 

# pa
csd$pa <- csd %>%
  select(mood_enthus, mood_cheerf, mood_strong, mood_satisfi) %>%
  scale(.) %>%
  rowMeans(., na.rm = TRUE)


# na
csd$na <- csd %>%
  select(mood_lonely, mood_anxious, mood_guilty, mood_doubt) %>%
  scale(.) %>%
  rowMeans(., na.rm = TRUE)

# mu
csd$mu <- csd %>%
  select(mood_irritat, pat_restl, pat_agitate) %>%
  scale(.) %>%
  rowMeans(., na.rm = TRUE)


csd$su <- scale(csd$mood_suspic)
csd$wo <- scale(csd$pat_worry)


ggplot(data = csd, aes(x = t, y = wo)) +
  geom_line() + geom_smooth() +
  scale_x_continuous(
    breaks = seq(from = 1, to = 239, by = 9))


csd$ms = select(csd, pa, na, mu, su, wo) %>%
  rowSums(na.rm = TRUE)




#csd$ms = select(csd, pa, na, mu, su, wo) %>%
#  scale(.) %>% 
#  rowSums(na.rm = TRUE)

# csd$nna <- csd %>% 
#   select(matches("mood_|pat_worry")) %>%
#   is.na(.) %>% rowSums 
# 
# csd <- csd %>% filter(nna == 0)
# csd$ms <- csd %>% 
#   select(matches("mood_|pat_worry")) %>% 
#   rowSums(., na.rm = TRUE)

# csd$ms = scale(csd$ms)

# PCA --------------------------------------------------------------------------

items = as.data.frame(
    select(csd, c(
      "mood_enthus", 
      "mood_cheerf", 
      "mood_strong", 
      "mood_satisfi",
      "mood_lonely", 
      "mood_anxious", 
      "mood_guilty", 
      "mood_doubt", 
      "mood_irritat", 
      "pat_restl", 
      "pat_agitate",
      "mood_suspic",
      "pat_worry"
      ))
  )

#csd$ms = items %>%
#  scale(.) %>%
#  rowSums(na.rm = TRUE)


pca <- prcomp(na.omit(items),
              center  = TRUE,
              scale.  = TRUE,
              retx = TRUE) 

fviz_eig(pca)
fviz_pca_var(pca, axes = c(1, 2),
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE)

# pa
pca_p <- pca$x[, 1:5]
csd$p.pa <- scale(pca_p[, 1])
csd$p.na <- scale(pca_p[, 3])
csd$p.mu <- scale(pca_p[, 2])
csd$p.su <- scale(pca_p[, 4])
csd$p.wo <- scale(pca_p[, 5])

# Mean mood state
csd$p.ms = select(csd, p.pa, p.na, p.mu, p.su, p.wo) %>%
  rowMeans(na.rm = TRUE)

csd$p.ms = select(csd, p.pa, p.na, p.mu, p.su, p.wo) %>%
  rowSums(na.rm = TRUE)

csd$ms = csd$p.ms

# detrend ----------------------------------------------------------------------

# csd$ms = csd$p.ms
ggplot(data = csd, aes(x = t, y = ms)) +
  geom_smooth() + geom_line()

csd$ms_dt <- residuals(lm(ms ~ poly(t, 4), data = csd))
#csd$ms_dt <- c(NA, diff(csd$ms))

library(mgcv)
csd$ms_dt <- residuals(
  gam(I(scale(ms, scale = FALSE)) ~ 
        s(t) + s(I(t^2)) + s(I(t^3)) + s(I(t^4)), 
      data = csd))

csd$ms_dt <- residuals(
  gam(I(scale(ms, scale = FALSE)) ~ 
        s(t) + s(I(t^2)), 
      data = csd))

ggplot(data = csd, aes(x = t, y = ms_dt)) +
  geom_smooth() + geom_line() + geom_line()


# Rolling variance, autocorrelation --------------------------------------------

#csd <- csd %>% 
#  group_by(t) %>% 
#  summarise(
#    ms_dt = mean(ms_dt))

csd$ms_rv = NA
csd$ms_rac = NA
for(i in 1:nrow(csd)){
  t_ = csd$t[i]
  
  if(t_ < 30) next

  d <- subset(csd[1:i, ], t > (t_ - 30) & t <= t_ )
  
  csd[i, ]$ms_rv <- var(d$ms_dt, na.rm = TRUE)
  csd[i, ]$ms_rac <- acf(d$ms_dt, 
                         lag.max = 1,
                         type = "correlation",
                         plot = FALSE)$acf[2]
}

  

# plot -------------------------------------------------------------------------

d <- csd %>% filter(!is.na(dep))
ggplot(data = d, aes(x = t, y = dep)) +
  geom_step()

d <- csd %>% 
  group_by(t) %>% 
  summarise(
    ms_rac = mean(ms_rac), 
    ms_rv = mean(ms_rv))

ggplot(data = d, aes(x = t, y = ms_rac)) +
  geom_line(size = 1.2, color = "blue") + #geom_smooth(span = .1) + 
  scale_x_continuous(
    breaks = seq(from = 1, to = 239, by = 9)) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggplot(data = d, aes(x = t, y = ms_rv)) +
  geom_line(size = 1.2, color = "blue") + 
  scale_x_continuous(
    breaks = seq(from = 1, to = 239, by = 9)) + 
  #scale_y_continuous(breaks = seq(0, 3.5, .5)) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))




                    