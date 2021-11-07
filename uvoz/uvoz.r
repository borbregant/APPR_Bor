# 2. faza: Uvoz podatkov

#=======================================================================================================

#1. tabela
meseci <- read_excel("podatki/meseci.xlsx",col_names = c("Mesec",'SmrtneNesrece', 'Nesmrtne', 'Vse', 'Procent', 'Smrti'))
meseci <- meseci[-c(1,2,3,16), ]
meseci$Mesec[meseci$Mesec %in% "January"] <- "Januar"
meseci$Mesec[meseci$Mesec %in% "February"] <- "Februar"
meseci$Mesec[meseci$Mesec %in% "March"] <- "Marec"
meseci$Mesec[meseci$Mesec %in% "May"] <- "Maj"
meseci$Mesec[meseci$Mesec %in% "June"] <- "Junij"
meseci$Mesec[meseci$Mesec %in% "July"] <- "Julij"
meseci$Mesec[meseci$Mesec %in% "August"] <- "Avgust"
meseci$Mesec[meseci$Mesec %in% "October"] <- "Oktober"
meseci$Smrti <- as.numeric(meseci$Smrti)
meseci$Mesec <- factor(meseci$Mesec, levels=unique(meseci$Mesec))#Da ne bo leksikografkso na diagramih
#=======================================================================================================

#2. tabela
smrti_leto <- read_excel("podatki/smrti_leto.xlsx",col_names = c("Leto",'Smrti', 'Poskodbe', 'Nesrece'))
smrti_leto <- smrti_leto[-c(1,2), ]
smrti_leto$Smrti <- as.numeric(smrti_leto$Smrti)
smrti_leto$Poskodbe[smrti_leto$Poskodbe %in% "251 1"] <- "2511"
smrti_leto$Poskodbe <- as.numeric(smrti_leto$Poskodbe)
smrti_leto$Leto[smrti_leto$Leto %in% "2001*"] <- "2001"
smrti_leto$Leto <- as.numeric(smrti_leto$Leto)
smrti_leto[, c(2:4)] <- sapply(smrti_leto[, c(2:4)], as.numeric)#sapply pretvori vse v dolocen tip

#=======================================================================================================

#3. tabela
fatal_state <- read_excel("podatki/fatal_state.xlsx",col_names = c("state","Vse",'SmrtneNesrece', 'Nesmrtne', 'Oskodovani',"Smrti","Ponesrecenci","brezveze"))
#State stolpec mora biti nujno "state", da ga knjiznica usmap razbere
fatal_state <- fatal_state[-c(1,2,3,4,5,6), ]#pobrise zacetne smeti
fatal_state <- fatal_state[-c(8,52,53,54,55,56,57,58,59,60,61), ]#pobrise ne-state
class(fatal_state$Smrti)
fatal_state$Smrti <- as.numeric(fatal_state$Smrti)
fatal_state[, c(2:8)] <- sapply(fatal_state[, c(2:8)], as.numeric)

#=======================================================================================================

#4. tabela
registracije <- read_excel("podatki/registracije.xlsx",col_names = c("Leto",'Smrti', 'Registrirane', 'Nerelevantno',"Nerelevantno","Nerelevantno","Nerelevantno"))
registracije <- registracije[-c(1), ]
registracije$Registrirane <- as.numeric(registracije$Registrirane)
registracije$Leto <- as.numeric(registracije$Leto)
registracije$Smrti <- as.numeric(registracije$Smrti)
registracije[, c(4:7)] <- sapply(registracije[, c(4:7)], as.numeric)#Par slabo OCR prebranih podatkov da Na, a te ne motijo

#=======================================================================================================

#5. tabela

prihodek <- read.csv2(file = "podatki/prihodek.csv", sep = ',', header = TRUE,col.names = c('Leto', "Prihodek"))
prihodek$Leto <- format(as.Date(prihodek$Leto, format="%Y-%d-%m"),"%Y")
prihodek$Prihodek <- as.numeric(prihodek$Prihodek)
prihodek$Leto <- as.numeric(prihodek$Leto)

#=======================================================================================================

#6. tabela za shiny

vzroki <- read_excel("podatki/vzroki.xlsx",col_names = c("Vzrok",'Nesrece', 'Smrti', "Poskodbe"))
vzroki$Smrti <- as.numeric(vzroki$Smrti)
vzroki$Poskodbe <- as.numeric(vzroki$Poskodbe)
vzroki$Tip <- "Operacija"
vzroki$Tip[13:16] <- "Loading"
vzroki$Tip[17:19] <- "Failure"
vzroki$Tip[20:25] <- "Enviroment"
vzroki$Tip[26:30] <- "Razno"

vzroki.vektor <- c("Alkohol", "Droge","Hitrost","Ventilacija","Nepozornost","Navigacijske luči","Navtična pravila","Nepozornost","Pomanjkanje izkušenj","Vidljivost","Oster ovinek","Štart v prestavi",
                   "Sidranje","Nalaganje tovora","Prekomerna teža","Ljudje na premcu, krmi",
                   "Okvara opreme","Okvara trupa","Okvara motorja",
                   "Veliko prometa","Jez","Valovi","Stanje vode","Pomanjkanje navigacije","Vreme",
                   "Ogljikov monoksid","Vžig","Akutni medicinski razlogi","Ostalo","Neznano")
vzroki$Vzrok <- vzroki.vektor
vzroki$Vzrok <- factor(vzroki$Vzrok, levels=unique(vzroki$Vzrok))#Da ne bo leksikografkso na diagramih
#pomozne tabele za shiny

tabela1nova <- vzroki
tabela2nova <- vzroki
tabela3nova <- vzroki
tabela4nova <- vzroki
tabela5nova <- vzroki

tabela1nova <- tabela1nova[-c(13:30), ]#pobrise ne prave tipe
tabela2nova <- tabela2nova[-c(1:12,17:30), ]#pobrise ne prave tipe
tabela3nova <- tabela3nova[-c(1:16,20:30), ]#pobrise ne prave tipe
tabela4nova <- tabela4nova[-c(1:19,26:30), ]#pobrise ne prave tipe
tabela5nova <- tabela5nova[-c(1:25), ]#pobrise ne prave tipe

#===============================================================================
#                       Uvoz iz wikipedie
#===============================================================================
link <- "https://en.wikipedia.org/wiki/The_Ocean_Race"

vmesna <- link %>% 
  read_html %>% 
  html_nodes(xpath = '//*[@id="mw-content-text"]/div[1]/table[2]') %>% 
  html_table

volvorace <- as.data.frame(vmesna)