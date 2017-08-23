require(plotly)
require(datasets)
data(Orange)
plot_ly(Orange,x=~age,y=~circumference,type = "scatter",mode='markers',color = ~Tree, size = ~circumference)
