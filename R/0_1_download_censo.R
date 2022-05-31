
# description -------------------------------------------------------------
# this file downloads and saves demographic census 2000-2010 microdata to
#..be used at this paper

# setup -------------------------------------------------------------------
source("R/setup.R")

# download data -----------------------------------------------------------
# via microdadosBrasil
microdadosBrasil::download_sourceData(
  "CENSO", 2000, unzip = F, replace = T
  )
# ERROR to unzip "1_Documentacao_20170908.zip"
unzip()

zipfiles <- list.files(
  path = "data-raw/Microdados", pattern = "*.zip", full.names = T
)

zipfiles <- grep(zipfiles, pattern = "Documentacao", invert = T, value = T)

outputdir <- file.path("data-raw/outputdir")

walk(zipfiles, ~unzip(zipfile = .x, exdir = outputdir))


dom <- microdadosBrasil::read_CENSO(
  ft = "domicilios", i = 2000
  )


# * basedosdados ----------------------------------------------------------
# https://github.com/basedosdados/mais#usando-em-r
# https://www.youtube.com/watch?v=5_Ir8neyFf4&list=PLu5pyM8QY6hg3GpNCyCtSS3sUi4Jo8Pir&index=3&ab_channel=BasedosDados

# via basedosdados
basedosdados::set_billing_id("conflitos-agrarios-2022")

# listar tables censo
#basedosdados::list_dataset_tables("br_ibge_censo_demografico")

query <- bdplyr("br_ibge_censo_demografico.microdados_domicilio_2000")
df <- bd_collect(query)



# select vars -------------------------------------------------------------


