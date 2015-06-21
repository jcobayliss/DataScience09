library(shiny)
library(reshape2)

predictCost <- function(heuristic, p1, p2) {
  data <- read.csv(file = 'data.csv', header = TRUE, sep = ',')  
  checks <- data[data$SET == 'coloring', c(3, 4, 11, 13, 15)]
  names(checks) <- c('P1', 'P2', 'DOM', 'DEG', 'K')
  checks <- melt(data = checks, id.vars = c('P1', 'P2'), variable.name = 'HEURISTIC', value.name = 'COST')
  checks = checks[checks$HEURISTIC == heuristic, ]
  model <- lm(COST ~ P1 + P2, data = checks)
  newData <- data.frame(P1 = c(p1), P2 = c(p2))
  return(predict(model, newData))
}

shinyServer(
  function(input, output) {
    output$heuristic <- renderPrint({input$heuristic})
    output$p1 <- renderPrint({input$p1})    
    output$p2 <- renderPrint({input$p2})    
    output$cost <- renderPrint(predictCost(input$heuristic, input$p1, input$p2))
  }
  
)