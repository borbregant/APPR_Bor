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
