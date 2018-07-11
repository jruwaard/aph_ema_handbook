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
    "ggmap",
    "graphicalVAR",
    "kableExtra",
    "lme4",
    "lomb",
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
