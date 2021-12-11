library(knitr)
library(rvest)
library(gsubfn)
library(tidyr)
library(tmap)
library(shiny)
library(readxl) #za branje excela
library(usmap)
library(ggplot2)
library(rgdal)
library(rgeos)
library(rmarkdown)
library(tidyverse)
library(dplyr)
library(mosaic)#za regresijo
library(readr)
library(broom)
library(ggpubr)
library(prettydoc)#za lepsi markdown
library(rvest)#za tabelo iz wikipedie
library(plotly)
library(cluster)
library(factoextra)
library(gridExtra)

options(gsubfn.engine="R")

# Uvozimo funkcije za pobiranje in uvoz zemljevida.
#source("lib/uvozi.zemljevid.r", encoding="UTF-8")

#Če bi hoteli brati PDF in iz njega extractali tabele
#library(tabulizer) #ta mi žal ne dela, zato uporabim naiven pristop
