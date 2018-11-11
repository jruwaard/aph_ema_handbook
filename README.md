# Best Practices in Ecological Momentary Assessment

This is code and text behind the research manual [Ecological Momentary Assessment in Mental Health Research: A Practical Introduction, With Examples in R](https://github.com/jruwaard/aph_ema_handbook). 

The manual is built using [bookdown package](https://github.com/rstudio/bookdown).

## R packages required 

The R packages that are used in the manual can be installed via:

```{r}
ensurePackage <- function (pkgs) {
  installed_packages <- rownames(installed.packages()) 
  for (pkg in pkgs) {
    if (!(pkg %in% installed_packages)) {
      install.packages(pkg, dependencies = TRUE)
    }
  }
}

ensurePackage(
  c(
    "autovarCore",
    "bookdown",
    "bootnet",
    "digest",
    "DiagrammeRsvg",
    "ecp",
    "emaph",
    "tidyverse",
    "adehabitatHR",
    "data.tree",
    "ggplot2",
    "GPArotation",
    "GENEAread",
    "GGIR",
    "ggmap",
    "graphicalVAR",
    "grid",
    "gridExtra",
    "kableExtra",
    "haven",
    "iterators",
    "jpeg",
    "lme4",
    "lomb",
    "lubridate",
    "nlme",
    "mlVAR",
    "nonlinearTseries", 
    "powerlmm",
    "psych",
    "pwr",
    "PhysicalActivity",
    "qgraph",
    "png",
    "rlang",
    "rgl",
    "rsvg",
    "scales",
    "simstudy",
    "simr",
    "zoo"
  )
)
'''

In addition, you need to install the accompanying R-package 'emaph' (from github package sources):

```{r}
devtools::install_github("jruwaard/emaph")
```

## How to building the PDF

To build the PDF of the manual, you need:

* RStudio (which has built-in [pandoc](http://johnmacfarlane.net/pandoc/)
* Miktex (>= version 2.9); make sure xelatex can be found in your path.

