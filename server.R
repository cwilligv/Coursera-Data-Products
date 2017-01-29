#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(car)    # Import library to use recode() function

shinyServer(function(input, output) {
  
  values <- reactiveValues()
  # Calculate the interest and amount    
  observe({
    input$action_Calc
    values$int <- isolate({
      ((input$house_price - input$downpayment) * (input$slider_intrate/100/12)) /
        (1-((1+(input$slider_intrate/100/12)) ^ (-1*input$slider_num*12)))
    })
    values$amt <- values$int
    })
  
  # Display values entered
  output$text_principal <- renderText({
    input$action_Calc
    paste("Downpayment amount: [$]", isolate(input$downpayment))
  })
  
  output$text_intrate <- renderText({
    input$action_Calc
    paste("Interest rate: ", isolate(input$slider_intrate), 
          " % per year")
  })
  
  output$text_intrate <- renderText({
    input$action_Calc
    paste("House Value: $", isolate(input$house_price), 
          ".")
  })
  
  output$text_num <- renderText({
    input$action_Calc
    paste("Time period ", isolate(input$slider_num),
          recode(isolate(input$select_time),
                 "1 = 'Years'; 2 = 'Quarters';3 = 'Months'")
    )
  })
  
  # Display calculated values
  
  output$text_int <- renderText({
    if(input$action_Calc == 0) ""
    else
      paste("Simple Interest [$]:", values$int)
  })
  
  output$text_amt <- renderText({
    if(input$action_Calc == 0) ""
    else 
      paste("Monthly Amount you will have to pay [$]:", values$amt)
  })
  
})