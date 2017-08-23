#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(datasets)
data(Orange)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  mylm <- reactive({
    SelectedTree <- input$Tree
    OrangeSub <- Orange[Orange$Tree==SelectedTree,]
    model <- lm(circumference~age,OrangeSub)
    mycoef <- as.vector(model$coefficient)
    myform <-paste('circumference = ', mycoef[1], ' + ' , mycoef[2] , ' * age')
    myform
  })
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- Orange$age 
    SelectedTree <- input$Tree
    # draw the histogram with the specified number of bins
    OrangeSub <- Orange[Orange$Tree==SelectedTree,]
    mymodel <- mylm()
    p11 <- ggplot(OrangeSub, aes(x=age, y=circumference)) + geom_point(shape=1) + geom_smooth(method=lm)
    p11 <- p11 + ggtitle(mymodel) +xlab("Age") + ylab("Circumference")
    p11
  })
 
})
