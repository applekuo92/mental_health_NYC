
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  # Because
  output$rpv <- renderPrint({ input$rp })
  
  #BoW
  BagOfWords <- reactive({
    if(nchar(input$rp) > 0){
      DocumentTermMatrix( Corpus(VectorSource(input$rp)), control=params )
    } 
  })
  
  #PCA
  dScroeraw <- reactive({
    predict(regmod, as.data.frame(predict(pcamod, as.matrix(BagOfWords())))[,1:300], type="response")
  })
  
  #relevant words
  relWords <- reactive({
    colSums(as.matrix( BagOfWords() ))
  })
  
  # This should not stay around
  randOutput <- reactive({
    round(sample(1:nchar(input$rp), 1)/nchar(input$rp),2)
    
  })
  
  output$dScore <- renderText({ 1 - dScroeraw() })
  

})
