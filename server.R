# server.R

library(shiny); library(quantmod); 

source("helpers.R")

shinyServer(
  function(input, output) {

    getInputSet1 <- reactive({  
      getSymbols(input$symb, src = "yahoo", from = input$dates[1], to = input$dates[2], auto.assign = FALSE)
    })
  
    StockChart <- reactive({
    if (!input$cpi) return(getInputSet1())
    cpi(getInputSet1())
    })
    
    output$plot <- renderPlot({
    chartSeries(StockChart (), theme = chartTheme("black"),name = "Hi-Low Stock Chart",
                line.type = "l", log.scale = (input$dist == "lnorm"), TA = NULL)
    })
})
