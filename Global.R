
library(tm) # for text mining
library(wordcloud) #word-cloud generator
library(memoise) #Cache the results of a function so that when you call it again with the same arguments it returns the pre-computed value
library(shiny) #build interactive web applications with Rstringr
library(stringr) #A consistent, simple and easy to use set of wrappers


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
