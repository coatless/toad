#!/usr/bin/Rscript

################################################################################
# install-r-packages.R
# Installs a list of predetermined R packages from CRAN
################################################################################

# Note: Some packages are listed here even though they are already
# included in another package's dependency.

pkg_list = c('RcppArmadillo',
             'RcppEigen',
             'data.table',
             'rbenchmark',
             'microbenchmark', 
             'bookdown',
             'blogdown',
             'rmarkdown',
             'knitr',     
             'shiny',
             'forecast',
             'maps', 
             'maptools',
             'mapproj', 
             'mapdata',
             'ggmap',
             'devtools',
             'tidyverse',
             'searcher')

# Install the packages
install.packages(pkg_list, repos = "https://cran.rstudio.com")
