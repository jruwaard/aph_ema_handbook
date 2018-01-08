
sim_p <- function(id = 1, intercept = 0, x_start = 0){
  x = (0:9)
  y = intercept + x * .7 + rnorm(10, 0, 1)
  data.frame(id = id, x = x + x_start, y = y)
}

intercept = 100
x = seq(1, 100, 10)
y = 100 - .7 * x 
dt = NULL

for(i in 1:10) {
  p = sim_p(i, y[i], x[i])
  dt = rbind(dt, p)
}

ggplot(dt, aes(x = x, y = y, group = id)) + 
  geom_point(size = 1) + 
  stat_ellipse(color = "black", level = .99, type = "t") + 
  stat_ellipse(color = "black", level = .99, aes(group = NULL)) +
  theme_bw(12) + 
  theme(axis.text=element_blank(),
        axis.ticks=element_blank())
