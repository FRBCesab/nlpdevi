#' nlpdevi: A Research Compendium
#' 
#' @description 
#' A paragraph providing a full description of the project and describing each 
#' step of the workflow.
#' 
#' @author Nicolas Casajus \email{nicolas.casajus@fondationbiodiversite.fr}
#' 
#' @date 2022/11/04



## Install remotes package (if required) ----

if (!("remotes" %in% installed.packages())) {
  install.packages("remotes") 
}


## Install Dependencies (listed in DESCRIPTION) ----

remotes::install_deps(upgrade = "never")


## Load Project Addins (R Functions and Packages) ----

pkgload::load_all(here::here())


## Run Project ----

# List all R scripts in a sequential order and using the following form:
source(here::here("analyses", "script-nlp.R"))
