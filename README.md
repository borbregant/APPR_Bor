# Analiza ladijskih nesrec

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2020/21

* [![Shiny](http://mybinder.org/badge.svg)](https://nbviewer.org/github/borbregant/APPR_Bor/blob/b5df6d8364f335901a954d020d7c097b5fe82045/projekt.html) Notebook
* [![RStudio](http://mybinder.org/badge.svg)](http://mybinder.org/v2/gh/borbregant/APPR_Bor/master?urlpath=rstudio) RStudio

## Tematika

V projektu je analiza nesrec rekreativnih plovil. Glavni podatki so pridobljeni iz ameriške obalne straže leta 2020 [https://uscgboating.org/library/accident-statistics/Recreational-Boating-Statistics-2020.pdf]. Iz slednjega vira so izluščene tabele, ki so se mi zdele pomembnejše in morda zahtevajo podrobnejšo analizo.

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

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `rgdal` - za uvoz zemljevidov
* `rgeos` - za podporo zemljevidom
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `tidyr` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `mosaic` - za pretvorbo zemljevidov v obliko za risanje z `ggplot2`
* `maptools` - za delo z zemljevidi
* `tmap` - za izrisovanje zemljevidov
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)
<!--- Dodaj moje knjiznice-->

## Shiny

Za prikaz aplikacije shiny:
<ol>
  <li>Odpremo zgornji link do binder -> Rstudio </li>
  <li>V mapi lib in podmapi libraries pozenemo library("ggplot2") in library("readxl)</li>
  <li>V mapi shiny in kliknemo datoteko server. V tej datoteki kliknemo RunApp</li>
</ol>
