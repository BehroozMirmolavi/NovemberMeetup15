
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(dplyr)
library(ggplot2)
data(movies)
data <- movies
data <- mutate(data, decade = floor(year/10)*10)

shinyServer(function(input, output) {
   
  movies <- reactive({
    
    decade <- input$decade
    
    subset <- data[data$decade == decade,]
    
  })
  
  # A reactive expression with the ggplot2 plot
  output$plot1 <- renderPlot({
    
    p <- ggplot(movies(), aes(length,rating)) + geom_point(position = "jitter",alpha = 0.5) + xlim(0,300) + ylim(0,10) +
      xlab("Length") + ylab("Rating") + ggtitle("Length and Rating of Movies") + 
      theme_minimal(base_size = 18, base_family = "")

    print(p)
    
  }, height=700)

  
  output$table1 <- renderDataTable({
  
    movies()
    
  })
  
})
