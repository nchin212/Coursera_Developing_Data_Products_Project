library(shiny)
library(MASS)
library(ggplot2)
shinyServer(function(input, output) {
    model1 <- lm(medv ~ rm, data = Boston)
    model2 <- lm(medv ~ poly(rm,2), data = Boston)
    model3 <- lm(medv ~ poly(rm,3), data = Boston)
    
    model1pred <- reactive({
        rmInput <- input$sliderRM
        predict(model1, newdata = data.frame(rm = rmInput))
    })
    
    model2pred <- reactive({
        rmInput <- input$sliderRM
        predict(model2, newdata = data.frame(rm = rmInput))
    })
    
    model3pred <- reactive({
        rmInput <- input$sliderRM
        predict(model3, newdata = data.frame(rm = rmInput))
    })
    
    output$plot1 <- renderPlot({
        rmInput <- input$sliderRM
        
        g <- ggplot(Boston, aes(x=rm,y=medv)) + 
            labs(x="Average Number of Rooms", y="Housing Price (in $1000s)") + 
            xlim(3.5,9) + 
            ylim(0,55) + 
            geom_point()
        if(input$showModel1){
            g <- g + geom_smooth(method="lm",se=F,formula=y~x,
                                 aes(colour="A"),na.rm=TRUE)
        }
        if(input$showModel2){
            g <- g + geom_smooth(method="lm",se=F,formula=y~poly(x,2),
                                 aes(colour="B"),na.rm=TRUE)
        }
        if(input$showModel3){
            g <- g + geom_smooth(method="lm",se=F,formula=y~poly(x,3),
                                 aes(colour="C"),na.rm=TRUE)
        }
        g + scale_colour_manual(name="Legend", values=c("blue", "red", "green"), 
                                labels=c("Model 1","Model 2","Model 3")) +
            geom_point(aes(x=rmInput,y=model1pred()), size=8, colour="blue") +
            geom_point(aes(x=rmInput,y=model2pred()), size=8, colour="red") +
            geom_point(aes(x=rmInput,y=model3pred()), size=8, colour="green")
        
    })
    
    output$pred1 <- renderText({
        model1pred()
    })
    
    output$pred2 <- renderText({
        model2pred()
    })
    
    output$pred3 <- renderText({
        model3pred()
    })
})