## ui.R
ui <- shinyUI(fluidPage(
titlePanel("Word Cloud"),
  
sidebarLayout(
    sidebarPanel(
      selectInput("selection", "Choose a Phrase:",
                  choices = c("Seuss","Wilde")),
      actionButton("update", "Change"),
      hr(),
      sliderInput("freq",
                  "Minimum Frequency:",
                  min = 1,  max = 1000, value = 1),
      sliderInput("max",
                  "Maximum Number of Words:",
                  min = 1,  max = 20,  value = 100)
    ),
    # Show Word Cloud    
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Plot", plotOutput("plot"))
                  
      )
    )
)
))

