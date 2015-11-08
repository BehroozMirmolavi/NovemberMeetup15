
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(ggplot2)

shinyUI(fluidPage(
                   
# Application title
titlePanel("November Meetup 2015"),    

    # Show the generated plot
    mainPanel(
      tabsetPanel(
        tabPanel("Graph", 
                 sliderInput("decade", "Decade released", 1890, 2000,step = 10, value = c(1890),sep = "",animate = T),
                 plotOutput('plot1')
                 ),
        
        
        tabPanel("Table", dataTableOutput("table1"))
        
      ))
  )
  
  
  
)
