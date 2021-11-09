# 3. faza: Vizualizacija podatkov

#=======================================================================================================
# Zemljevid

zemljevid <- plot_usmap(data = fatal_state, values = "Smrti", color = "red") + 
  scale_fill_continuous(
    low="white",high="darkred",name = "Število smrtnih nesrec (2020)")+
  theme(legend.position = "right")

#=======================================================================================================
# smrti(mesec)

mesecnesmrti <- ggplot(data=meseci, aes(x=Mesec, y=Smrti)) +
  geom_bar(stat="identity",color = "darkred",fill="darkred")

#=======================================================================================================
# smrti(leto)

letnesmrti <- ggplot(data=smrti_leto, aes(x=Leto, y=Smrti)) +
  geom_line(color = "darkred") #dodaj stacked nesrece

#=======================================================================================================
# registrirane (bdp)

ggplot(data=registracije, aes(x=Leto, y=Registrirane)) +
  geom_bar(stat="identity") #dodaj stacked nesrece+

ggplot(data=registracije, aes(x=Leto, y=Smrti)) +
  geom_bar(stat="identity") #dodaj stacked nesrece

ggplot(data=prihodek, aes(x=Leto, y=Prihodek)) +
  geom_bar(stat="identity") #dodaj stacked nesrece

#===============================================================================
#                       Volvo race
#===============================================================================

brezvezengraf <- ggplotly(ggplot(volvorace) + aes(start=Start, finish=Finish,
                            x = Legs, y =Entries, colour = Class) + geom_point() + 
                            ylab("stevilo prijav") +
                            xlab("stevilo kolov"))
################################################################################
geo <- list(
  scope = 'world',
  projection_type="orthographic",
  showland = TRUE,
  landcolor = toRGB("gray95"),
  countrycolor = toRGB("gray80"),
  height=800)

fig <- plot_geo(locationmode = 'ISO-3', color = I("red"))
fig <- fig %>% add_markers(
  data = tabelamest, x = ~startlon, y = ~startlat, text = ~Start,
  size = ~prebivalci, hoverinfo = "text", alpha = 0.5)

fig <- fig %>% add_segments(
  data = volvorace1,
  x = ~startlon, xend = ~endlon,
  y = ~startlat, yend = ~endlat,
  alpha = 0.5, size = I(1), hoverinfo = "none")
##########################################      Ne dela dobro zaradi ortografske projekcije... drugace koda na sredini izpise dist()
# volvorace1$vmesnalon[1] <- 	(volvorace1$startlon[1] + volvorace1$startlat[2])/2
# volvorace1$vmesnalon[2] <- 	(volvorace1$startlon[2] + volvorace1$startlat[3])/2
# volvorace1$vmesnalon[3] <- 	(volvorace1$startlon[3] + volvorace1$startlat[4])/2
# volvorace1$vmesnalon[4] <- 	(volvorace1$startlon[4] + volvorace1$startlat[1])/2
# 
# volvorace1$vmesnalat[1] <- 	(volvorace1$startlat[1] + volvorace1$startlat[2])/2
# volvorace1$vmesnalat[2] <- 	(volvorace1$startlat[2] + volvorace1$startlat[3])/2
# volvorace1$vmesnalat[3] <- 	(volvorace1$startlat[3] + volvorace1$startlat[4])/2
# volvorace1$vmesnalat[4] <- 	(volvorace1$startlat[4] + volvorace1$startlat[1])/2
# 
# fig <- fig %>% add_markers(
#   data = volvorace1, x = ~vmesnalon, y = ~vmesnalat, text = ~Razdalja,
#   size = 0.01, hoverinfo = "text", alpha = 0.5)
##################################
fig <- fig %>% layout(
  title = 'Kje se je regata zacela in koncala <br>(Hover za ime mesta)',
  geo = geo, showlegend = FALSE)

grafregate <- fig