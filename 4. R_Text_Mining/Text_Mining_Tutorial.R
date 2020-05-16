## Text mining of English

# Set work directory
## setwd("my_work_directory")

# Install Packages
install.packages("wordcloud")
install.packages("tm")
library("wordcloud")
library("tm")

# load and Explore datasets
mydata1 <- readLines("drinks.txt")
mydata1

# Convert 'data1' to 'Corpus' form
corp1 <- VCorpus(VectorSource(mydata1))
corp1

# Explore corpus
inspect(corp1)

# Convert 'Corpus' form to 'Term-Document' form
tdm <- TermDocumentMatrix(corp1)
tdm

# Convert 'tdm' to matrix form
m <- as.matrix(tdm)
m

# Eliminate Stopword, Punctuation and Blank
corp2 <- tm_map(corp1, stripWhitespace)
corp2 <- tm_map(corp2, tolower)
corp2 <- tm_map(corp2, removePunctuation)
corp2 <- tm_map(corp2, PlainTextDocument)
# add stopword(and, but, not)
stopword1 <- c(stopwords('en'), "and", "but", "not") 
corp2 <- tm_map(corp2, removeWords, stopword1)

# re-generate Term-Document_matrix and Convert to matrix
tdm2 <- TermDocumentMatrix(corp2)
m2 <- as.matrix(tdm2)
colnames(m2) <- c(1:4)
m2

# Eliminate more stopwords
stopword2 <- c(stopwords('en'),"drink","hate","like","love","want")
corp3 <- tm_map(corp2, removeWords, stopword2)
tdm3 <- TermDocumentMatrix(corp3)
m3 <- as.matrix(tdm3)
colnames(m3) <- c(1:4)
m3

# Count words
count1 <- sort(rowSums(m3), decreasing = T)
head(count1, 10)
count2 <- sort(colSums(m3), decreasing = T)
head(count2, 10)

# Find Correlation
findAssocs(tdm3, "coffee", 0.5)
findAssocs(tdm3, "coffee", 0.6)

# Expression with WordCloud
library(RColorBrewer)
pic <- brewer.pal(7, "Set3")
wordcloud(names(count1), freq = count1,
          scale=c(5,1), min.freq=1, rot.per=0.5, 
          color=pic, random.order=F, random.color=T)

