library(shiny); library(quantmod); 

shinyUI(
  fluidPage (
    titlePanel("How can we escape from Rat Race?", windowTitle = "How can we escape from Rat Race?"),
    
    sidebarLayout(
      position = c("right"),
      fluid = TRUE,
      sidebarPanel(
        textInput("symb", "Enter Symbol", "BHP.AX"),
        helpText("Eg:GOOG, AAPL or GS"),
        br(),
        dateRangeInput("dates", format = "yyyy-mm-dd", startview = "year",
                       "Pick Date Range", start = "2015-07-01", end = as.character(Sys.Date()) ),
        br(),
        #checkboxInput("log", "Do you want Log graph?", value = TRUE),
        radioButtons("dist", "Distribution type:",
                     c("Normal" = "norm",
                       "Log" = "lnorm")),
        checkboxInput("cpi", "Do you want to adjust prices CPI?", value = TRUE),
        img(src="http://mrhasbean.com/-images/index/header-bean.png"),
        br(),
        code("* Stock prices are obtained from Yahoo Finance"),
        br(),
        code("* CPI is obtained from the Federal Reserve of St. Louis")
        
        ),
      
      mainPanel(
        helpText("Your chosen stock has been trending like..."),
        plotOutput("plot"),
        br(),
        h4("Documentation (steps)"),
        helpText("This Apps plots Hi-Low Stock Chart based on your selections."),
        helpText("Step 1: Type in the Stock code you like to graph"),
        helpText("Step 2: Pick the date range you like to cover"),
        helpText("Step 3: Select what type of distribution you want to plot"),
        helpText("Step 4: Tick if you want to adjust prices to CPI"),
        helpText("Step 5: Follow Mr Bean! Stock Plot is automatically updated")
      )
    )
  )
)
