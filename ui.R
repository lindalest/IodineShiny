

library(shiny)
library(shinythemes)
shinyUI(fluidPage(theme = shinytheme("united"),
  titlePanel("Are you at risk for Iodine Deficiency?"),
  ## I have developed a series of questions that would predict your risk for being deficient in iodine
  ## My initial step was to develop the questions using radiobuttons
  sidebarLayout(
   sidebarPanel(width=7,helpText("Answer the following questions to determine if you might be deficienct in iodine"),
          radioButtons("radio5", label = h3("Where do you live on this map?"),
            choices = list("Dark Green Area" = 3, "Light Green Area" = 2, "Yellow Area" = 1, "White Area" = -1), selected = 1),
            img(src= "goitercolor.png", height = 400, width = 400),
            hr(),
           fluidRow(column(9, verbatimTextOutput("value5"))),
   
          radioButtons("radio1", label = h3("Do you use iodized salt?"),
           choices = list("Yes" = -1, "No" = 1, "I don't know" = 0), selected = 1),
          hr(),
          fluidRow(column(9, verbatimTextOutput("value"))),
        
          radioButtons("radio2", label = h3("Do you have milk everyday?"),
                       choices = list("Yes" = -1, "No" = 1, "I don't know" = 0), selected = 1),
          hr(),
          fluidRow(column(9, verbatimTextOutput("value2"))),

           radioButtons("radio3", label = h3("Do you a multivitamin that contains iodine?"),
            choices = list("Yes" = -1, "No" = 1, "I don't know" = 0),  selected = 1),
             hr(),
            fluidRow(column(9, verbatimTextOutput("value3"))),

          radioButtons("radio4", label = h3("Do you eat seaweed (sushi)?"),
            choices = list("Yes" = -2, "No" = 1, "I don't know" = 0), selected = 1),
        hr(),
        fluidRow(column(9, verbatimTextOutput("value4")))),
        ## the input from the radiobuttons was summarized in the server and the output is displayed as a therotical risk for iodine deficiency
        mainPanel(width = 4, 
              verbatimTextOutput("advice"),
              helpText("Check out this link if you would like to learn more about iodine deficiency http://www.thyroid.org/iodine-deficiency/"
        ))
       )
)      
)




