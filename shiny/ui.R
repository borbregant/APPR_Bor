ui <- fluidPage(
  navbarPage("Analiza vzrokov nesrec",
              
             tabPanel("Operacija plovila",
                      titlePanel("Število nesreč, smrtnih žrtev ali poškodb"),
                      actionButton("nesrece", "Nesrece"),
                      actionButton("smrti", "Smrti"),
                      actionButton("poskodbe", "Poskodbe"),
                      hr(),
                      plotOutput("vrsta1")),

             tabPanel("Nalaganje potnikov in opreme",
                      titlePanel("Število nesreč, smrtnih žrtev ali poškodb"),
                      actionButton("nesreceloading", "Nesrece"),
                      actionButton("smrtiloading", "Smrti"),
                      actionButton("poskodbeloading", "Poskodbe"),
                      hr(),
                      plotOutput("vrsta2")),
             
             tabPanel("Okvara plovila in opreme",
                      titlePanel("Število nesreč, smrtnih žrtev ali poškodb"),
                      actionButton("nesrecefailure", "Nesrece"),
                      actionButton("smrtifailure", "Smrti"),
                      actionButton("poskodbefailure", "Poskodbe"),
                      hr(),
                      plotOutput("vrsta3")),
             
             tabPanel("Okoliščine",
                      titlePanel("Število nesreč, smrtnih žrtev ali poškodb"),
                      actionButton("nesreceokoliscine", "Nesrece"),
                      actionButton("smrtiokoliscine", "Smrti"),
                      actionButton("poskodbeokoliscine", "Poskodbe"),
                      hr(),
                      plotOutput("vrsta4")),
             
             tabPanel("Razno",
                      titlePanel("Število nesreč, smrtnih žrtev ali poškodb"),
                      actionButton("nesrecedrugo", "Nesrece"),
                      actionButton("smrtidrugo", "Smrti"),
                      actionButton("poskodbedrugo", "Poskodbe"),
                      hr(),
                      plotOutput("vrsta5"))
  ))