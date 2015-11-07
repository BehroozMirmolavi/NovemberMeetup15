
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(ggvis)

shinyUI(fluidPage(
                   
# Application title
titlePanel("November Meetup 2015"),    

    # Show the generated plot
    mainPanel(
      tabsetPanel(
        tabPanel("Graph", 
                 sliderInput("year", "Year released", 1893, 2005, value = c(1893)),
                 plotOutput('plot1')
                 ),
        
        
        tabPanel("Table", tableOutput("table1"))
        
      ))
  )
  
  
  
)
