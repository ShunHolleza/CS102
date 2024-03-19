library(dplyr)
library(readr)
library(stringr)

movieReviews <- read.csv("/cloud/project/MovieReviews/CSVfiles/MergedMovie.csv", stringsAsFactors = FALSE)

str(movieReviews)

clean <- movieReviews %>%
  na.omit() %>%
  mutate_all(str_trim)

str(clean)

write.csv(cleaned_data, "cleanedReviews.csv", row.names = FALSE)
