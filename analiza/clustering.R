#===============================================================================
#                       Clustering
#     https://www.r-bloggers.com/2021/04/cluster-analysis-in-r/
#===============================================================================


delovna <- fatal_state
delovna <- as.data.frame(delovna)
delovna <- delovna[, -c(2,5:8)]

#delovna <- delovna[,-1]
#rownames(delovna) <- delovna[,1]
#princ <- prcomp(delovna)
#delovna <- na.omit(delovna)  #Removing the missing values
#delovna <- scale(delovna)


########################################################### vizualcizacija

# grozna rešitev ... TOO BAD

jpeg(file="saving_plot1.jpeg")
plot(delovna$Nesmrtne ~ delovna$SmrtneNesrece, data = delovna, xlab = "Smrtne nesrece",ylab = "Nesrece brez smrti")
with(delovna,text(delovna$Nesmrtne ~ delovna$SmrtneNesrece, labels=delovna$state,pos=4))
dev.off()

########################################################### normalizacija

z <- delovna[,-c(1,1)]
means <- apply(z,2,mean)
sds <- apply(z,2,sd)
nor <- scale(z,center=means,scale=sds)

########################################################### dist matrika
distance = dist(nor)

########################################################### HAC

delovna.hclust = hclust(distance)
#plot(delovna.hclust)
#plot(delovna.hclust,labels=delovna$state,main=NULL,ylab = "višina")
plot(delovna.hclust,hang=-1, labels=delovna$state,main=NULL,ylab = "višina")
#rect.hclust(delovna.hclust, k=5, border="red") #test da poveze klusterje ampak nima pravih?

#################
k2 <- kmeans(nor, centers = 3, nstart = 25)
clustervisual <- fviz_cluster(k2, data = nor)

#===============================================================================
#                       Clustering
#                   Sledimo predavanjem
#===============================================================================Nevem zakaj zadna vrstica ne dela
dendrogram <- delovna.hclust

tibble(
  k = 49:1,
  visina = dendrogram$height
) %>%
  ggplot() +
  geom_line(
    mapping = aes(x = k, y = visina),
    color = "red"
  ) +
  geom_point(
    mapping = aes(x = k, y = visina),
    color = "red"
  ) +
  scale_x_continuous(
    breaks = 49:1
  ) +
  labs(
    x = "število skupin (k)",
    y = "višina združevanja"
  ) +
  theme_classic()

################################################################################

hc.kolena = function(dendrogram, od = 1, do = NULL, eps = 0.5) {
  # število primerov in nastavitev parametra do
  n = length(dendrogram$height) + 1
  if (is.null(do)) {
    do = n - 1
  }
  # k.visina je tabela s štirimi stolpci
  # (1) k, število skupin
  # (2) višina združevanja
  # (3) sprememba višine pri združevanju
  # (4) koleno: ali je točka koleno?
  k.visina = tibble(
    k = as.ordered(od:do),
    visina = dendrogram$height[do:od]
  ) %>%
    # sprememba višine
    mutate(
      dvisina = visina - lag(visina)
    ) %>%
    # ali se je intenziteta spremembe dovolj spremenila?
    mutate(
      koleno = lead(dvisina) - dvisina > eps
    )
  k.visina
}

# iz tabele k.visina vrne seznam vrednosti k,
# pri katerih opazujemo koleno
hc.kolena.k = function(k.visina) {
  k.visina %>%
    filter(koleno) %>%
    select(k) %>%
    unlist() %>%
    as.character() %>%
    as.integer()
}

# izračunamo tabelo s koleni za dendrogram
r = hc.kolena(dendrogram)

# narišemo diagram višin združevanja
diagram.kolena = function(k.visina) {
  k.visina %>% ggplot() +
    geom_point(
      mapping = aes(x = k, y = visina),
      color = "red"
    ) +
    geom_line(
      mapping = aes(x = as.integer(k), y = visina),
      color = "red"
    ) +
    geom_point(
      data = k.visina %>% filter(koleno),
      mapping = aes(x = k, y = visina),
      color = "blue", size = 2
    ) +
    ggtitle(paste("Kolena:", paste(hc.kolena.k(k.visina), collapse = ", "))) +
    xlab("število skupin (k)") +
    ylab("razdalja pri združevanju skupin") +
    theme_classic()
}

diagram.kolena(r)

library(ggalt)
library(sp)
library(rgdal) # funkcija readOGR
library(raster) # funkcija crop
library(rgeos) # funkcija gBuffer
library(cluster)

################################################################################
primeri <- delovna
skupine.2 = dendrogram %>% cutree(k = 2) %>% as.ordered()
skupine.3 = dendrogram %>% cutree(k = 3) %>% as.ordered()
skupine.4 = dendrogram %>% cutree(k = 4) %>% as.ordered()


diagram.skupine = function(podatki, oznake, skupine, k) {
  podatki = podatki %>%
    bind_cols(skupine) %>%
    rename(skupina = ...4)
  
  d = podatki %>%
    ggplot(
      mapping = aes(
        x = x, y = y, color = skupina
      )
    ) +
    geom_point() +
    geom_label(label = oznake, size = 2) +
    scale_color_hue() +
    theme_classic()
  
  for (i in 1:k) {
    d = d + geom_encircle(
      data = podatki %>%
        filter(skupina == i)
    )
  }
  d
}

diagram.skupine(primeri, primeri$state, skupine.3, 3)
