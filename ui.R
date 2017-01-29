#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("Simple house monthly payment Calculator"),
  sidebarLayout(
    sidebarPanel(
      helpText("This shiny app calculates the monthly payment 
               you would have to pay based on house value."),            
      br(),            
      numericInput("downpayment",
                   label = h6("1. What's your downpayment for the house?"),
                   value = 1000),
      br(),
      sliderInput("slider_intrate",
                  label = h6("2. Choose the yearly interest rate (in %)"),
                  min = 0, max = 20, value = 4),
      
      br(),            
      sliderInput("slider_num",
                  label = h6("3. Choose the number of time periods you want to pay your debt"),
                  min = 0, max = 50, value = 10),
      selectInput("select_time",
                  label = h6(""),
                  choices = list("Years" = 1,
                                 "Quarters" = 2,
                                 "Months" =3),
                  selected = 3 
      ), 
      br(),
      numericInput("house_price",
                   label = h6("4. What's the price of the house?"),
                   value = 1000),
      br(),
      br(),            
      actionButton("action_Calc", label = "Refresh & Calculate")        
      ),
    mainPanel(
      tabsetPanel(
        tabPanel("Output",
                 p(h5("Your entered values:")),
                 textOutput("text_principal"),
                 textOutput("text_intrate"),
                 textOutput("text_num"),
                 textOutput("text_time"),
                 br(),
                 p(h5("Calculated values:")),
                 textOutput("text_int"),
                 textOutput("text_amt")
        ),
        tabPanel("Documentation",
                 p(h4("Simple house monthly payment Calculator:")),
                 br(),
                 helpText("This application calculates the monthly payment
                          of a house you buy with a bank loan considering downpayment."),
                 HTML("<u><b>Equation for calculation: </b></u>
                      <br> <br>
                      <b> P = (Pv*R) / [1 - (1 + R)^(-n)] </b>
                      <br>
                      where: <br>
                      P = Monthly amount to pay <br>
                      Pv = Value of the loan <br>
                      R = Monthly interest rate <br>
                      n = Total number of periods for paying back debt
                      ")                
                 )
                 )
                 )
                 )
                 ))
