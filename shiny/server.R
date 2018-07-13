library(shiny)
library(shinydashboard)


shinyServer(function(input, output, session) {
  
  output$plot1_home <- renderPlot({
    plot(cars$dist, cars$speed)
  })
  
  output$plot2_home <- renderPlot({
    plot(cars$speed, cars$dist)
  })
  
})
