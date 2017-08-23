
library(shiny)
library(ggplot2)
library(datasets)
data(Orange)

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
    
    x    <- Orange$age 
    SelectedTree <- input$Tree
    OrangeSub <- Orange[Orange$Tree==SelectedTree,]
    mymodel <- mylm()
    p11 <- ggplot(OrangeSub, aes(x=age, y=circumference)) + geom_point(shape=1) + geom_smooth(method=lm)
    p11 <- p11 + ggtitle(mymodel) +xlab("Age") + ylab("Circumference")
    p11
  })
 
})
