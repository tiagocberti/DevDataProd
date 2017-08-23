#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Orange Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      radioButtons("Tree", label = h3("Tree Identification"),
                   choices = list("Tree 1" = 1, "Tree 2" = 2,
                                  "Tree 3" = 3,"Tree 4" = 4, "Tree 5" = 5),selected = 1
                   )),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Linear Model:"),
      plotOutput("distPlot"))
  )))
