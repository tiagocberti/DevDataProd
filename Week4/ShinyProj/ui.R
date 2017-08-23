library(shiny)

# Define UI for application that draws a scatterplot with the regression line subset by Tree
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Orange Data"),
  
  # Sidebar with a radio button input for Tree
  sidebarLayout(
    sidebarPanel(
      radioButtons("Tree", label = h3("Tree Identification"),
                   choices = list("Tree 1" = 1, "Tree 2" = 2,
                                  "Tree 3" = 3,"Tree 4" = 4, "Tree 5" = 5),selected = 1
                   )),
    
    # Show a plot of the data and linear regression
    mainPanel(
      h3("Linear Model:"),
      plotOutput("distPlot"))
  )))
