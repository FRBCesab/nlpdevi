screen <- function(x, pattern) {
  
  unlist(lapply(strsplit(x, " "), function(i) {
    ifelse(sum(grepl(pattern, i)) > 0, 1, 0)
  }))
}


tokenization <- function(x, from, to) {
  for (i in 1:length(from)) {
    x <- gsub(from[i], to[i], x)  
  }
  x
}


clean_string <- function(x) {
  
  x <- gsub("\n", " ", x)
  x <- gsub("- ", "-", x)
  x <- gsub("[[:punct:]]", "", x) # Remove punctuations
  x <- gsub("[0-9]", "", x)       # Remove numbers
  x <- gsub("\\s+", " ", x)       # Remove whitespaces
  x <- gsub("^\\s|\\s$", "", x)       # Remove whitespaces
  
  x <- tolower(x)
  x 
}
