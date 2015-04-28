# Install shinydashboard
devtools::install_github("rstudio/shinydashboard")

library(shiny)
runApp("activity-dashboard/")

# Make sure a package is at least some version (only installs from CRAN)
ensure_version <- function(pkg, ver = "0.0") {
  if (system.file(package = pkg)  == "" || packageVersion(pkg) < ver)
    install.packages(pkg)
}

ensure_version("devtools", "1.7.0")
ensure_version("jsonlite", "0.9.16")

# Need latest devel versions of various packages
devtools::install_github("rstudio/shiny@interact-ggplot") # For ggplot2 interaction
devtools::install_github("rstudio/shinydashboard")
devtools::install_github("rstudio/leaflet")

# PiLR API package
devtools::install_github("pilrhealth/pilr.api.r")

library(shiny)
runApp("activity-dashboard/")
