# works, but how to compare the true model from the estimated model?
d <- NULL
for(i in 1:20) {
 di <- cbind(ID = rep(i, 50), 
             as.data.frame(graphicalVARsim(50,
                                           mean = c(rnorm(5, 0, 2)),
                                           Mod$beta, 
                                           Mod$kappa)))
 d <- rbind(d, di)
}
d$ID = factor(d$ID)

fit1 <- mlVAR(d,        vars = names(d)[2:6], 
              idvar = "ID", verbose = TRUE,
              lags = 1,     temporal = "correlated")