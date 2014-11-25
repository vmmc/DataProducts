library(shiny)
shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Diabetes prediction"),
                sidebarPanel(
                        p('Looking at a data set of a collection of cars, we explore the relationship
                           between a set of variables and the miles per gallon (MPG) they consume.'),
                        p('To use this aplication, all you are gonna need are the following variables
                          (of your car) to get the prediction:'),
                        sliderInput('ncyl', 'Number of cylinders', value = 6, min = 4, max = 8, step = 2,),
                        numericInput('nhp', 'Gross horsepower', 145, min = 50, max = 400, step = 5),
                        numericInput('nwt', 'Weight (lb/1000)', 3, min = 1, max = 8, step = 0.5),
                        checkboxInput("nam", "Manual Transmission", FALSE)
                ),
                mainPanel(
                        h3('Results of prediction'),
                        h4('You entered'),
                        verbatimTextOutput("inputVals"),
                        h4('Which resulted in a prediction of '),
                        verbatimTextOutput("prediction"),
                        p('In which "fit" is the expected value of MPG with an upper and lower limit.'),
                        h4('Transmission/MPG Boxplot according to number of cylinders'),
                        p('This boxplot allows you to inspect the MPG in relation to the transmissions
                          for your number of cylinders.'),
                        plotOutput('newHist')
                        
                )
        )
)