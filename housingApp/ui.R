library(shiny)
library(MASS)
library(ggplot2)
shinyUI(fluidPage(
    titlePanel("Predict Housing Prices based on Average Number of Rooms"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderRM", "What is the Average Number of Rooms?", 4, 9, value = 5, step=0.1),
            checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
            checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE),
            checkboxInput("showModel3", "Show/Hide Model 3", value = TRUE)
        ),
        mainPanel(
            tabsetPanel(type="tabs",
                tabPanel("Main", br(),
                    plotOutput("plot1"),
                    h3("Predicted Housing Price from Model 1:"),
                    textOutput("pred1"),
                    h3("Predicted Housing Price from Model 2:"),
                    textOutput("pred2"),
                    h3("Predicted Housing Price from Model 3:"),
                    textOutput("pred3"),
                ),
                tabPanel("Description",br(),
                    h3("Overview"),
                    h5("This application aims to predict housing prices based on
                       the average number of rooms."),
                    h3("Data"),
                    h5("The data is taken from the Boston housing dataset from 
                       the MASS package. The average number of rooms,'rm', 
                       will be used to predict the housing price,'medv'."),
                    h3("Models"),
                    h5("3 different regression models will be used to fit 
                       the data. The models are as follows:"),
                    h5("Model 1: medv ~ rm"),
                    h5("Model 2: medv ~ poly(rm,2)"),
                    h5("Model 3: medv ~ poly(rm,3)"),
                    h3("Usage"),
                    h5("Slide the slider on the left to set a particular value
                       for the 3 models to predict. The predicted housing price
                       for the 3 different models will be printed.")
  
                )
            )
        )
    )
))
