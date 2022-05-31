Sys.setenv(TZ='UTC') # Fuso horario local

# carregar bibliotecas
list.of.packages <- c(
  "data.table"
  , "tidyverse"
  , "devtools"
  , "janitor"
  , "survey"
  , "srvyr"
  , "future"
  , "furrr"
  #, "mapview"
  #, "mapdeck"
  , "archive"
  , "here"
  , "basedosdados"
)


# install packages----
new_packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]

if(length(new_packages)>1){install.packages(new_packages) }

# load libraries ----
lapply(list.of.packages, require, character.only = TRUE)

# ceramic
devtools::install_github("lucasmation/microdadosBrasil",force = FALSE)
library(microdadosBrasil)

# options
#mapviewOptions(platform = 'mapdeck')

# disable scientific notation
options(scipen=10000)


# Use GForce Optimisations in data.table operations
# details > https://jangorecki.gitlab.io/data.cube/library/data.table/html/datatable-optimize.html
options(datatable.optimize=Inf)

# set number of threads used in data.table
data.table::setDTthreads(percent = 100)


## usefull support functions

`%nin%` = Negate(`%in%`)
`%nlike%` = Negate(`%like%`)


# remove vectors
rm(list.of.packages)
rm(new_packages)

# Clean environment and memory

gc(reset = TRUE)
