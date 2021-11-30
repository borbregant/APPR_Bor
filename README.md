# Analiza ladijskih nesrec

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2021/22

* [![Shiny](https://github.com/borbregant/APPR_Bor/blob/master/slike/presentationSVG.svg)](https://nbviewer.org/github/borbregant/APPR_Bor/blob/master/predstavitev1.html) Predstavitev
* [![Shiny](http://mybinder.org/badge.svg)](https://nbviewer.org/github/borbregant/APPR_Bor/blob/master/projektnotebook.html) Notebook (za hiter ogled z manjkajočimi deli)
* [![Shiny](http://mybinder.org/badge.svg)](http://mybinder.org/v2/gh/borbregant/APPR_Bor/master?urlpath=shiny/APPR_Bor/projekt.Rmd) Shiny (celoten projekt)
* [![RStudio](http://mybinder.org/badge.svg)](http://mybinder.org/v2/gh/borbregant/APPR_Bor/master?urlpath=rstudio) RStudio

## Tematika

V projektu je analiza nesrec rekreativnih plovil. Glavni podatki so pridobljeni iz ameriške obalne straže leta 2020 [https://uscgboating.org/library/accident-statistics/Recreational-Boating-Statistics-2020.pdf]. Iz slednjega vira so izluščene tabele, ki so se mi zdele pomembnejše in morda zahtevajo podrobnejšo analizo. Za podkrepitev demonstracije znanja R je dodana še analiza podatkov regate "Volvo ocean race".

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`.
Ko ga prevedemo, se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`.
Podatkovni viri so v mapi `podatki/`.
<!--- Zemljevidi v obliki SHP, ki jih program pobere,
se shranijo v mapo `../zemljevidi/` (torej izven mape projekta).-->

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr`
* `rvest`
* `gsubfn`
* `tidyr`
* `tmap`
* `shiny`
* `readxl`
* `usmap`
* `ggplot2`
* `rgdal`
* `rgeos`
* `rmarkdown`
* `tidyverse`
* `dplyr`
* `mosaic`
* `readr`
* `broom`
* `ggpubr`
* `prettydoc`
* `rvest`
* `plotly`


## Shiny

Za prikaz aplikacije shiny:
<ol>
  <li>Odpremo zgornji link do binder -> Rstudio </li>
  <li>V mapi lib in podmapi libraries pozenemo library("ggplot2") in library("readxl")</li>
  <li>V mapi uvoz pozenemo vse vrstice (ctrl+A -> Run)</li>
  <li>V mapi shiny kliknemo datoteko server. V tej datoteki kliknemo RunApp</li>
</ol>
