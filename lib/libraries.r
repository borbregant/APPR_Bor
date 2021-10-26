library(knitr)
library(rvest)
library(gsubfn)
library(tidyr)
library(tmap)
library(shiny)

options(gsubfn.engine="R")

# Uvozimo funkcije za pobiranje in uvoz zemljevida.
#source("lib/uvozi.zemljevid.r", encoding="UTF-8")

#Če bi hoteli brati PDF in iz njega extractali tabele
#library(tabulizer) #ta mi žal ne dela, zato uporabim naiven pristop
library(readxl) #za branje excela

library(usmap)
library(ggplot2)

library(rgdal)
library(rgeos)
library(rmarkdown)
library(viridis)

library(tidyverse)
library(dplyr)
library(mosaic)
library(readr)
library(broom)
library(ggpubr)

library(prettydoc)#za lepsi markdown
