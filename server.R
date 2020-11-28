#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Load data
mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c('Automatic', 'Manual'))

# Define server logic required to draw a chart
shinyServer(function(input, output) {
    
    # Create reactive function
    formulaText <- reactive({paste('mpg ~', input$variable)})
    formulaTextPoint <- reactive({paste('mpg ~', 'as.integer(', input$variable, ')')})
    fit <- reactive({lm(as.formula(formulaTextPoint()), data = mpgData)})
    
    # Create chart
    output$caption <- renderText({formulaText()})
    output$fit <- renderPrint({summary(fit())})
    output$mpgPlot <- renderPlot({with(mpgData, 
                                       {plot(as.formula(formulaTextPoint()))
                                           abline(fit(), col = 2)})
    })

})
