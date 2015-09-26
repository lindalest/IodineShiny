

library(shiny)

shinyServer(function(input, output) {
  
  # You can access the values of the widget (as a vector)
  # with input$radio, e.g.
  output$value <- renderText({ input$radio1})
  output$value2 <- renderText({ input$radio2})
  output$value3 <- renderText({ input$radio3})
  output$value4 <- renderText({ input$radio4})
  output$value5 <- renderText({ input$radio5})
 ## The following adds the numeric inputs from the five radiobuttons
  ds <- reactive(
            as.numeric(input$radio1) + 
            as.numeric(input$radio2) +
            as.numeric(input$radio3) + 
            as.numeric(input$radio4) +
            as.numeric(input$radio5))
 ## The numeric sum is divided into three ranges; low, medium and high that correlate with your risk for having iodine deficiency 
  output$risk <- renderText(ds())
  output$advice <- renderText(
    advice <- if(ds() < 0) {
        "You are at Low Risk"
         } else if (ds() > 3) {
        "You are at High Risk"
        } else
       "You are at Some Risk")
    })




  


