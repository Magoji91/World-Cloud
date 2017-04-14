### server.R
server <- shinyServer(function(input, output, session) {
# Define a reactive expression for the document term matrix
terms <- reactive({
 # Change when the "update" button is pressed...    
    input$update
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getTermMatrix(phrases[[input$selection]])
      })
    })
  })
# Make the wordcloud drawing predictable during a session 
wordcloud_rep <- repeatable(wordcloud)

#Create the wordcloud
output$plot <- renderPlot({
v <- terms()
wordcloud_rep(names(v), v, scale=c(5,0.5),
              min.freq = input$freq, max.words=input$max,
              colors=brewer.pal(11, "Set3"))
})
})
