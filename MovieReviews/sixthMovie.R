library(rvest)
library(httr)
library(polite)



polite::use_manners(save_as = 'polite_scrape.R')

url3 <- 'https://www.imdb.com/title/tt10648342/reviews/_ajax?ref_=undefined&paginationKey=%s'


scrapePage <- function(url3, PaginationKey) {
  session <- bow(sprintf(url3, PaginationKey), user_agent = "Educational")
  
  usernames <- scrape(session) %>% html_nodes('span.display-name-link') %>% html_text()
  revDates <- scrape(session) %>% html_nodes('span.review-date') %>% html_text()
  revContents <- scrape(session) %>% html_nodes('div.text.show-more__control') %>% html_text()
  stars <- scrape(session) %>% html_nodes('span.rating-other-user-rating') %>% html_text()
  PaginationKey <- scrape(session) %>% html_nodes("div.load-more-data") %>% html_attr("data-key")
  
  return(list(usernames = usernames, revDates = revDates, revContents = revContents, stars = stars, PaginationKey = PaginationKey))
}

usernames <- character(0)
revDates <- character(0)
revContents <- character(0)
stars <- character(0)
PaginationKey <- ""


reviewsToscrape <- 300
perPage <- 25
pagesToscrape <- ceiling(reviewsToscrape / perPage)

for (page in 1:pagesToscrape) {
  scrapedData <- scrapePage(url3, PaginationKey)
  
  usernames <- c(usernames, scrapedData$usernames)
  revDates <- c(revDates, scrapedData$revDates)
  revContents <- c(revContents, scrapedData$revContents)
  stars <- c(stars, scrapedData$stars)
  PaginationKey <- scrapedData$PaginationKey
  
  if (length(usernames) >= reviewsToscrape) {
    break
  }
}



DF <- data.frame(
  Usernames = usernames[1:300],
  Reviewer_Date = revDates[1:300],
  Reviewer_Content = revContents[1:300],
  Rating = stars[1:300]
)



write.csv(DF, file = "2ndmovie.csv", row.names = FALSE)
print(DF)
