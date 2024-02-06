
library(dplyr)
library(rvest)
library(polite)

polite::use_manners(save_as = 'polite_scrape.R')


url <- 'https://www.imdb.com/title/tt0111161/reviews?ref_=tt_urv'
sesh<- bow(url,
           user_agent = "Educational")
sesh



username <- character(0)
reviewerDate<- character(0)
revContent <- character (0)
stars<- character(0)


page <- read_html(url)


revContent<- scrape (sesh) %>%
  html_nodes('div.text.show-more__control')%>%
  html_text

revContent

username <- scrape (sesh)%>%
  html_nodes('span.display-name-link')%>%
  html_text
username

reviewerDate <- scrape(sesh)%>%
  html_nodes('span.review-date')%>%
  html_text
reviewerDate

stars<- scrape (sesh)%>%
  html_nodes('span.rating-other-user-rating')%>%
  html_text 
stars  

DF<- data.frame(Username = username,
                Reviewer_Date= reviewerDate,
                Reviewer_Content = revContent,
)
