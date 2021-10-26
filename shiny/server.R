server <- function(input, output){
  
  
  v <- reactiveValues(data = NULL)
  
  observeEvent(input$nesrece, {
    v$data <- tabela1nova$Nesrece
  })
  
  observeEvent(input$smrti, {
    v$data <- tabela1nova$Smrti
  })
  
  observeEvent(input$poskodbe, {
    v$data <- tabela1nova$Poskodbe
  })  
  
  output$vrsta1 <- renderPlot({
    if (is.null(v$data)) return()
    ggplot(data=tabela1nova, aes(x=Vzrok, y=v$data)) +
      geom_bar(stat="identity")
  })
  
  
  b <- reactiveValues(data = NULL)
  
  observeEvent(input$nesreceloading, {
    b$data <- tabela2nova$Nesrece
  })
  
  observeEvent(input$smrtiloading, {
    b$data <- tabela2nova$Smrti
  })
  
  observeEvent(input$poskodbeloading, {
    b$data <- tabela2nova$Poskodbe
  })  
  
  output$vrsta2 <- renderPlot({
    if (is.null(b$data)) return()
    ggplot(data=tabela2nova, aes(x=Vzrok, y=b$data)) +
      geom_bar(stat="identity")
  })
  
  c <- reactiveValues(data = NULL)
  
  observeEvent(input$nesrecefailure, {
    c$data <- tabela3nova$Nesrece
  })
  
  observeEvent(input$smrtifailure, {
    c$data <- tabela3nova$Smrti
  })
  
  observeEvent(input$poskodbefailure, {
    c$data <- tabela3nova$Poskodbe
  })  
  
  output$vrsta3 <- renderPlot({
    if (is.null(c$data)) return()
    ggplot(data=tabela3nova, aes(x=Vzrok, y=c$data)) +
      geom_bar(stat="identity")
  })
  
  d <- reactiveValues(data = NULL)
  
  observeEvent(input$nesreceokoliscine, {
    d$data <- tabela4nova$Nesrece
  })
  
  observeEvent(input$smrtiokoliscine, {
    d$data <- tabela4nova$Smrti
  })
  
  observeEvent(input$poskodbeokoliscine, {
    d$data <- tabela4nova$Poskodbe
  })  
  
  output$vrsta4 <- renderPlot({
    if (is.null(d$data)) return()
    ggplot(data=tabela4nova, aes(x=Vzrok, y=d$data)) +
      geom_bar(stat="identity")
  })
  
  e <- reactiveValues(data = NULL)
  
  observeEvent(input$nesrecedrugo, {
    e$data <- tabela5nova$Nesrece
  })
  
  observeEvent(input$smrtidrugo, {
    e$data <- tabela5nova$Smrti
  })
  
  observeEvent(input$poskodbedrugo, {
    e$data <- tabela5nova$Poskodbe
  })  
  
  output$vrsta5 <- renderPlot({
    if (is.null(e$data)) return()
    ggplot(data=tabela5nova, aes(x=Vzrok, y=e$data)) +
      geom_bar(stat="identity")
  })
}