# Reproducability --------------------------------------------------------------

# fix random numbers
set.seed(1014)


# knitr chunk options ----------------------------------------------------------

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  cache = TRUE,
  out.width = "98%",
  fig.align = 'center',
  fig.width = 7,
  fig.asp = 0.5,  # was: 0.618 (1 / phi)
  fig.show = "hold",
  message = FALSE,
  warning = FALSE
)

options(width = 120)


# standard libraries -----------------------------------------------------------
library(ggplot2)
library(emaph)


# theming ----------------------------------------------------------------------

# avoid long pint-out of numeric variables
options(digits = 3)

# avoid long print-outs of tables
options(dplyr.print_min = 6, dplyr.print_max = 6)

# common theme of all ggplot images
theme_set(theme_bw(12))


