# 4. faza: Analiza podatkov

#=======================================================================================================

#Regresijska analiza: Ali prihodek ali registracije vplivata na st. smrti

registracije$Prihodek <- prihodek$Prihodek #dodamo se en stolpec kar na df registracij kjer je zbrana vecina
#======================================================================================================= model
model <- lm(Smrti ~ Prihodek+Registrirane, data = registracije)
povzetek <- summary(model)
confint(model)
par(mfrow = c(2, 2))
#plot(model)
#======================================================================================================= logaritemski model
logmodel <- lm(log(Smrti) ~ log(Prihodek)+log(Registrirane), data = registracije)
summary(logmodel)
confint(logmodel)
par(mfrow = c(2, 2))
#plot(logmodel)
#======================================================================================================= model grafi
scaleFactor <- max(registracije$Registrirane) / max(registracije$Prihodek)

grafa <- ggplot(registracije, aes(x=Leto)) +
  geom_smooth(aes(y=Registrirane), method="loess", col="darkolivegreen") +
  geom_smooth(aes(y=Prihodek * scaleFactor), method="loess", col="darkorchid4") +
  scale_y_continuous(name="Stevilo registriranih plovil", sec.axis=sec_axis(~./scaleFactor, name="Prihodek na prebivalca")) +
  theme(
    axis.title.y.left=element_text(color="darkolivegreen"),
    axis.text.y.left=element_text(color="darkolivegreen"),
    axis.title.y.right=element_text(color="darkorchid4"),
    axis.text.y.right=element_text(color="darkorchid4")
  )

#=======================================================================================================
#Drug nacin za dvojni graf
# coeff <- 10
# 
# ggplot(registracije, aes(x=Leto)) +
#   
#   geom_line( aes(y=Registrirane)) + 
#   geom_line( aes(y=Prihodek)) +
#   
#   scale_y_log10(
#     
#     # Features of the first axis
#     name = "Stevilo registriranih plovil",
#     
#     # Add a second axis and specify its features
#     sec.axis = sec_axis(~.*coeff, name="Prihodek na prebivalca")
#   )
#======================================================================================================= poskus grafa s tremi y osmi, a ne deluje popolnoma ok
# scaleFactor <- max(registracije$Registrirane) / max(registracije$Smrti)
# scaleFactor2 <- max(registracije$Registrirane) / max(registracije$Smrti)
# 
# ggplot(registracije, aes(x=Leto)) +
#   geom_smooth(aes(y=Registrirane), method="loess", col="blue") +
#   geom_smooth(aes(y=Prihodek * scaleFactor), method="loess", col="red") +
#   geom_smooth(aes(y=Smrti * scaleFactor2), method="loess", col="green") +
#   scale_y_continuous(name="Stevilo registriranih plovil", sec.axis=sec_axis(~./scaleFactor, name="Prihodek na prebivalca")) +
#   theme(
#     axis.title.y.left=element_text(color="blue"),
#     axis.text.y.left=element_text(color="blue"),
#     axis.title.y.right=element_text(color="red"),
#     axis.text.y.right=element_text(color="red")
#   )