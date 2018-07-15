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
    "ecp",
    "emaph",
    "tidyverse",
    "adehabitatHR",
    "data.tree",
    "GPArotation",
    "GENEAread",
    "GGIR",
    "ggmap",
    "graphicalVAR",
    "kableExtra",
    "haven",
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
    "rgl",
    "simstudy",
    "simr"
  )
)
