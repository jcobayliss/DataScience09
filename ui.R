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
      "This application is very simple. When solving constraint satisfaction problems (CSPs) by using search, many heuristics can be used. These heuristics show different performances according to the features of the instance being solved. In this simple application we solved a small set of 22 CSPs and registered the performance of thre heuristics: DOM, DEG and K. The values of the features of the instances include the constraint density (p1) and the constraint tightness (p2). This application tries to predict the cost of using one of these three heuristics on a new instance, based only on the constraint density and tightness of the instance. Please be note that this is only a sample application and that, in order to produce more accurate results, a larger sample of instances is required. For this reason, the prediction at some point may produce negative results, which is incorrect as the cost cannot be negative in this problem.",
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