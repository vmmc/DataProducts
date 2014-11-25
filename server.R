library(shiny)
library(ggplot2)
data(mtcars)

mtcars$cyl  <- factor(mtcars$cyl)
mtcars$vs   <- factor(mtcars$vs)
mtcars$am   <- factor(mtcars$am, labels=c("automatic", "manual"))
mtcars$gear <- factor(mtcars$gear)
mtcars$carb <- factor(mtcars$carb)

fit <- lm(formula = mpg ~ cyl + hp + wt + am, data = mtcars)
prediction <- function(ncyl, nhp, nwt, nam) predict(fit, data.frame(cyl=factor(ncyl), hp=nhp, wt=nwt, am=factor(nam)), interval = "prediction")


shinyServer(
        function(input, output) {

                output$inputVals <- renderPrint({data.frame(cyl=input$ncyl, hp=input$nhp, wt=input$nwt, am=ifelse(input$nam, "manual", "automatic"))})
                output$prediction <- renderPrint({prediction(input$ncyl, input$nhp, input$nwt, ifelse(input$nam, "manual", "automatic"))})
                
                output$newHist <- renderPlot({
                        ncyl <- input$ncyl
                        data <- subset(mtcars, cyl==ncyl)
                        ggplot(data , aes(x = am, y = mpg)) + geom_boxplot(aes(fill = am))
                        })

        }
)
