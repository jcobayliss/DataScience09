shinyUI(
  pageWithSidebar(
    headerPanel("Heuristic cost predictor"),            
    
    sidebarPanel(
      h2('Inputs'),
      selectInput("heuristic", "Heuristic:", choices = c('DOM' = 'DOM','DEG' = 'DEG', 'K' = 'K')),
      numericInput('p1', 'Constraint density (p1): ', 0, min = 0, max = 1.0, step = 0.05),
      numericInput('p2', 'Constraint tightness (p2): ', 0, min = 0, max = 1.0, step = 0.05),
      submitButton('Submit')
    ),
    
    mainPanel(
      # Description
      "When solving constraint satisfaction problems (CSPs) by using search, many heuristics can be used. These heuristics show different performances according to the features of the instance being solved. In this simple application we try to predict the cost of using one of heuristic on a new instance, based only on the constraint density and tightness of such instance. Please select one heuristic and the values of the constraint density and tightness and observe the predicted cost.",
      h2('Prediction'),
      h3('Heuristic: '),
      verbatimTextOutput("heuristic"),
      h3('Constraint density (p1): '),
      verbatimTextOutput("p1"),
      h3('Constraint tightness (p2): '),
      verbatimTextOutput("p2"),      
      h3('Predicted cost for selected heuristic:'),
      verbatimTextOutput("cost")
    )
  )
  
)