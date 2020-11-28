#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

# Define UI for application that draws a chart
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Relationship between mpg & other automobile aspects"),
    
    # Sidebar with a slider input 
    sidebarLayout(
        sidebarPanel(
            h3('Dataset'),
            p('Motor Trend Car Road Tests'),
            h3('About the Data'),
            p('The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).'),
            h3("Data Source"),
            p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411."),
            HTML('<br>'),
            selectInput("variable", "Select variable for comparison:",
                        c("Number of cylinders" = "cyl",
                          "Displacement (cu.in.)" = "disp",
                          "Gross horsepower" = "hp",
                          "Rear axle ratio" = "drat",
                          "Weight (lb/1000)" = "wt",
                          "1/4 mile time" = "qsec",
                          "V/S" = "vs",
                          "Transmission" = "am",
                          "Number of forward gears" = "gear",
                          "Number of carburetors" = "carb"))
        ),

        
        mainPanel(
            h3("Linear model:",textOutput("caption")),
            plotOutput("mpgPlot"),
            verbatimTextOutput("fit")
        )
    )
))
