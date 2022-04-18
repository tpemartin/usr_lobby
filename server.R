# makecondition -----------

library(shiny)
library(ggplot2)



# server --------

server <- function(input, output){
output$uiBins <- shiny::renderUI(sliderInput("bins", "Number of bins:", 
    min = 1, max = 50, value = 30))
output$distPlot <- shiny::renderPlot(ggplot(data = faithful) + 
    geom_histogram(aes(x = eruptions), bins = as.numeric(input$bins)))
}
