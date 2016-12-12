
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Depression Score"),
  
  fluidRow(
    
    mainPanel(
      
      p("The probability our model think this post is from the Depression SubReddit.  (Higher values are more likely to be depressed)"),
      em(textOutput("dScore")),
      h4("Post"),
      verbatimTextOutput("rpv")

    )
    
  ),
  
  hr(),
  
  fluidRow(
    mainPanel(
 
    textAreaInput("rp", label = h3("Enter Post"), value = ""),
    radioButtons("Age", "Age of Poster:",
                 c("Under 21" = "norm",
                   "21 +" = "unif")),

    submitButton("Submit"))
)
  
))
