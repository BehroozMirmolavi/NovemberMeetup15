
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(dplyr)
library(ggvis)
data(movies)
data <- movies

shinyServer(function(input, output) {
   
  movies <- reactive({
    
    year <- input$year
    
    subset <- data[data$year == year,]
    
  })
  
  # A reactive expression with the ggplot2 plot
  output$plot1 <- renderPlot({
    
    p <- ggplot(movies(), aes(length,rating)) + geom_point()

    print(p)
    
  }, height=700)

  
  output$table1 <- renderTable({
  
    movies()
    
  })
  
})
