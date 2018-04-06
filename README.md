# Best Practices in Ecological Momentary Assessment

This is code and text behind the [Best Practices in Ecological Momentary Assessment](http://www.amsterdamresearch.org/web/public-health/home.htm) book. 

The R packages used in this book can be installed via

```{r}
install.packages(
  c(
    "bookdown",
    "tidyverse",
    "adehabitatHR",
    "data.tree",
    "ecp",
    "GPArotation",
    "ggmap",
    "graphicalVAR",
    "kableExtra",
    "lme4",
    "lomb",
    "nlme",
    "mlVAR",
    "psych",
    "PhysicalActivity",
    "qgraph",
    "simstudy"
  )
)
'''

In addition, you need to build and install the emaph package (from package sources, which can be requested from jruwaard@me.com).

The book is built using [bookdown package](https://github.com/rstudio/bookdown).

To create the site, you also need:
* RStudio (which has built-in [pandoc](http://johnmacfarlane.net/pandoc/)
* Miktex (>= version 2.9); make sure xelatex can be found if you want to build pdf version of the book.

