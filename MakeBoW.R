# 
# library(readr)
# library(stringr)
# 
# #compile data
# 
# #depression
# dep_f <- paste0("depress_corpus/", list.files("depress_corpus/"))
# corp1 <- as.data.frame(unlist(lapply(dep_f, read_file)))
# names(corp1)[1] <- "post"
# corp1$class <- "depression"
# corp1$corpus <- dep_f
# 
# #good
# dep_f <- paste0("good/", list.files("good/"))
# corp2 <- as.data.frame(unlist(lapply(dep_f, read_file)))
# names(corp2)[1] <- "post"
# corp2$class <- "good"
# corp2$corpus <- dep_f
# 
# #other
# dep_f <- paste0("other_corpus/", list.files("other_corpus/"))
# corp3 <- as.data.frame(unlist(lapply(dep_f, read_file)))
# names(corp3)[1] <- "post"
# corp3$class <- "other"
# corp3$corpus <- dep_f
# 
# #compine
# corpus <- rbind(corp1, corp2, corp3)




library(tm)

control <- Corpus(DirSource("other_corpus/"))
names(control) <- paste0("other_",names(control))
depressed <- Corpus(DirSource("depress_corpus/"))
names(depressed) <- paste0("dep_",names(depressed))
motivate <- Corpus(DirSource("good/"))
names(motivate) <- paste0("good_",names(motivate))

p_corp <- c(control, depressed, motivate)

tdm <- TermDocumentMatrix(p_corp, control=list(removePunctuation = TRUE, removeNumbers=TRUE, tolower=FALSE, stopwords = TRUE))
tdm$dimnames$Terms
inspect(tdm)

dtm <- DocumentTermMatrix(p_corp, control=list(removePunctuation = TRUE, removeNumbers=TRUE, tolower=TRUE, stopwords = TRUE))
dtm$dimnames$Terms

dtms <- removeSparseTerms(dtm, 0.99)
dtms$dimnames$Terms

bow <- (as.matrix(dtms)) 

#Classes
bow_metadata <- as.data.frame(row.names(bow))
names(bow_metadata)[1]<- "corpus"
bow_metadata$subreddit_class <- "Control" 
bow_metadata[which(bow_metadata$corpus %like% "dep"),]$subreddit_class <- "DepressionSubreddit" 

#ages
ages <- read.csv("Age_tagged_corpora.csv")
bow_metadata<- as.data.table(merge(bow_metadata, ages, by="corpus", all.x=TRUE))

saveRDS( "RandomForestR/dictionary.RDS", list(dictionary= dtms$dimnames$Terms, controlList=list(removePunctuation = TRUE, removeNumbers=TRUE, tolower=FALSE, stopwords = TRUE)))
