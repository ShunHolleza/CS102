install.packages("rvest")
install.packages("polite")

library(rvest)
library(polite)

URL <- "https://www.amazon.com/s?k=jordan+4+retro+for+men&crid=107XQDLSS9PQR&sprefix=jordan+4+retro+for+m%2Caps%2C326&ref=nb_sb_noss_2"

session <- bow(url,
               user_agent = "Educational")
session

sessionPage <- scrape(session)

divElements <- html_nodes(sessionPage, 'div.sg-col-4-of-24 sg-col-4-of-12 s-result-item s-asin sg-col-4-of-16 sg-col s-widget-spacing-small sg-col-4-of-20')

brandDes <- character()
prices <- character()
revCounts <- character()
ratings <- character()

productDount <- 0

for (divElement in divElements) {
  brandElement <- html_node(divElement, 'span.a-size-base-plus.a-color-secondary.a-text-normal')
  brand <- ifelse(!is.na(brandElement), html_text(brandElement), '')
  
  desElement <- html_node(divElement, 'div.a-section.a-spacing-small')
  description <- ifelse(!is.na(desElement), html_text(desElement), '')
  
  priceElement <- html_node(divElement, 'span.a-price-whole')
  price <- ifelse(!is.na(priceElement), html_text(priceElement), '')
  
  revCountElement <- html_node(divElement, 'span.a-size-base')
  revCount <- ifelse(!is.na(revCountElement), html_text(revCountElement), '')
  
  ratingElement <- html_node(divElement, 'span.a-icon-alt')
  rating <- ifelse(!is.na(ratingElement), html_text(ratingElement), '')
  
  brandDes <- paste(brand, description)
  brandDescriptions <- c(brandDescriptions, brandDes)
  prices <- c(prices, price)
  revCounts <- c(revCounts, revCount)
  ratings <- c(ratings, rating)
  
  
}

DF <- data.frame(Brand_Description = brand_descriptions,
                 Price = prices,
                 Review_Count = review_counts,
                 Rating = ratings)

write.csv(DF, "product.csv")

DF$Category <- "Jshoes"

DF <- DF[, c("Category", names(DF)[-which(names(DF) == "Category")])]

write.csv(DF, "product2.csv", row.names = FALSE)

View(SecondProduct)
