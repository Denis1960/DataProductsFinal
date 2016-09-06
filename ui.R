### ui.R
### Denis Edwards - Author


library(shiny)
library(dplyr)
library(ggplot2)

shinyUI(pageWithSidebar(
  headerPanel('Compare Airline On-Time records between destinations. Simply select where you wish to fly from and where you wish to fly to and the month you wish
              to travel. You can then see which flights have the best records based on delays, which days are best to fly to avoid delays, which carriers have the 
              best ontime records, and what time to depart to avoid delays'),
  
  sidebarPanel(
    selectInput('origin_select', label = 'Departure City', choices = levels(flights$Origin), 
                selected = "Dallas/Fort Worth, TX"),
    
    selectInput('dest_select', label = 'Destination City',choices = levels(flights$Destination),
                selected = "Seattle, WA"),
    
    selectInput('month_select',label= 'Month',choices = levels(flights$Month),selected='January'),
    
    submitButton('Update View')
    
  ),
  
  # output plots to main panel with tabs to select type
    mainPanel(
      tabsetPanel(type = 'tabs',
                  
                  tabPanel('Best Flight Options', tableOutput('delayPct')),
                  tabPanel('Avergae Carrier Delays',plotOutput('delayHist')),
                  tabPanel('Best Time To Depart',plotOutput('bestFlyTime')),
                  tabPanel('Best Weekday To Depart',tableOutput('bestDay'))
      )
    )
)
)
