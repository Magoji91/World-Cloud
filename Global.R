library(tm)
library(wordcloud)
library(memoise)
library(shiny)
library(stringr)

phrases <- list(Seuss = c("Do","not","cry","because","it","is","over","smile","because","it","happened"),
                Wilde = c("Be","yourself","everyone","else", "is", "already", "taken”))

getTermMatrix <- memoise(function(text) {
  myCorpus = Corpus(VectorSource(text))
  myCorpus = tm_map(myCorpus, content_transformer(tolower))
  
  myDTM = TermDocumentMatrix(myCorpus,
                             control = list(minWordLength = 1))
  
  m = as.matrix(myDTM)
  
  sort(rowSums(m), decreasing = TRUE)
})
