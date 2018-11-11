# # Reproducability --------------------------------------------------------------
# 
# # fix random numbers
# set.seed(1014)
# 
# 
# # knitr chunk options ----------------------------------------------------------
# 
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  cache = FALSE,
  out.width = "100%",
  fig.align = 'center',
  fig.width = 7,
  fig.asp = 0.5,  # was: 0.618 (1 / phi)
  fig.show = "hold",
  message = FALSE,
  warning = FALSE
)
# 
# options(width = 120)
# 
# 
# # standard libraries -----------------------------------------------------------
library(ggplot2)
library(emaph)
# 
# 
# # theming ----------------------------------------------------------------------
#
# common theme of all ggplot images
theme_set(theme_classic(12))

