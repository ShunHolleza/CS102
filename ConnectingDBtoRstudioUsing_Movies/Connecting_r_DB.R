library(dplyr)
library(dbplyr)
library(RMariaDB)

connection <- dbConnect(RMariaDB::MariaDB(), 
                        dsn="mysql",
                        Server = "localhost",
                        dbname = "hollezadb", 
                        user = "root", 
                        password = '')
dbListTables(connection)

dbListFields(connection,"movie_rev")


posts_dta <- dbGetQuery(connection, "SELECT * FROM hollezadb.movie_rev")
glimpse(posts_dta)

empi_data <- dbGetQuery(connection, "SELECT * FROM hollezadb.movie_rev")
glimpse(empi_data)

empi_data[c(1:10),]

empi_data <- dbGetQuery(connection, "SELECT * FROM samplecs102.info")
tail(empi_data)

posts_data <- dbGetQuery(connection, "SELECT title,description FROM hollezadb.movie_rev")
posts_data[c(1:2),]

query <- "INSERT INTO movie_rev (movie_title, reviewer, date_of_review, rating, title_of_the_review,review) VALUES ('SPIDERMAN', 'classicsoncall', '2012-07-09', ' 8/10', 'Why the sudden interest in cold blood', 'There was no way I was going to miss this film, but after reading a number of reviews by fans here I began to have some reservations.' )"
query1<- "INSERT INTO movie_rev (movie_title, reviewer, date_of_review, rating, title_of_the_review,review) VALUES ('SPIDERMAN', 'AmbushBug26', '15 July 2012', '8/10', 'The Spider-man Film That The Comic Fans Will Love But Sam Raimi Fans Will Hate', 'Being a Spider-man comic book fan I can say that a lot of the stuff that happens in this story is true to the comic book Spider-man. Spider-man has web shooters, Spider-man likes to joke a lot, Gwen Stacy was Spider-mans first love, etc.')"
query3 <- "INSERT INTO movie_rev (movie_title, reviewer, date_of_review, rating, title_of_the_review,review) VALUES ('SPIDERMAN', 'Hellmant', '6 July 2012', '10/10', 'The BATMAN BEGINS of Spider-Man films, Id go as far as to say its amazing!', 'This film focuses entirely on Peters high school years while he learns to first develop his powers as well as cope with the disappearance of his parents and who his father really was (unlike the original Sam Raimi film). Its also a little more faithful to the comic, in some ways, by having Parker develop artificial web-shooters that he uses to swing around on, rather than being able to produce them physically as part of his super powers')"
query4 <- "INSERT INTO movie_rev (movie_title, reviewer, date_of_review, rating, title_of_the_review,review) VALUES ('SPIDERMAN', 'Robert_duder', '3 May 2014', ' 8/10', 'Completely unnecessary but still entertaining enough', 'This movie  The Amazing Spiderman,  has been way over-due. Ever since its initial creation by Stan Lee (who makes his usual Cameo appearance), audiences have been hungrily awaiting this new addition. This time, Peter Parker (Andrew Garfield) confronts a new and incredibly powerful super villain called, The Lizard. Self created by a one armed scientist, named ( Rhys Ifans ) or Dr. Curt Connors, Spiderman unknowingly gives the fantastic formula to a desperate man who has been trying to invent a way for a human to re-generate a missing limb, without realizing the unfortunate side effects' )"
query5 <- "INSERT INTO movie_rev (movie_title, reviewer, date_of_review, rating, title_of_the_review,review) VALUES ('Avengers: Endgame','MoistMovies', '29 April 2019', ' 7/10', 'Not as good as infinity war..', 'But its a pretty good film. A bit of a mess in some parts, lacking the cohesive and effortless feel infinity war somehow managed to accomplish. Some silly plot holes and characters that could've been cut (Ahem, captain marvel and thanos).')"
query6 <- "INSERT INTO movie_rev (movie_title, reviewer, date_of_review, rating, title_of_the_review,review) VALUES ('Avengers: Endgame','ACollegeStudent', '13 December 2021', '8/10', 'Not as good as infinity war but a great movie', 'Not as good as Infinity war pacing-wise, but is a satisfying ending to the saga. High production quality, and a great soundtrack like its predecessor.')"
query7 <- "INSERT INTO movie_rev (movie_title, reviewer, date_of_review, rating, title_of_the_review,review) VALUES ('Thor', '0U', '24 February 2020', '8/10', 'Thor', 'Thor is a film that takes risks - and they pay off wonderfully. The movie grounds itself in reality while keeping a mythological and fantasy-esqe tone, and it never loses sight of the humanity within the characters, with elevates this above standard superhero fare.')"
query8 <- "INSERT INTO movie_rev (movie_title, reviewer, date_of_review, rating, title_of_the_review,review) VALUES ('Thor', 'rparham', '3 June 2011', '8/10', 'Thor proves a strong contender', '')"
query9 <- "INSERT INTO movie_rev (movie_title, reviewer, date_of_review, rating, title_of_the_review,review) VALUES ('Avengers: Infinity War ', 'RJBrez', '24 January 2021', '10/10', 'Best movie of the MCU, incredible from start to finish.', 'Infinity War is remembered mostly for how it ends, with good reason. But for me, the entire movie is incredible. Action, humor, cinematography, heartbreak, etc.')"
query10 <- "INSERT INTO movie_rev (movie_title, reviewer, date_of_review, rating, title_of_the_review,review) VALUES ('Avengers: Infinity War ', 'Alex_Lo', '5 February 2021', '10/10', 'Best Cliffhanger of all Time', 'This movie portrays a villain that by far has been the best out of all the other Marvel antagonists.')"

query_result1 <- dbSendQuery(connection, query)
query_result2 <- dbSendQuery(connection, query2)
query_result3 <- dbSendQuery(connection, query3)
query_result4 <- dbSendQuery(connection, query4)
query_result5 <- dbSendQuery(connection, query5)
query_result6 <- dbSendQuery(connection, query6)
query_result7 <- dbSendQuery(connection, query7)
query_result8 <- dbSendQuery(connection, query8)
query_result9 <- dbSendQuery(connection, query9)
query_result10 <- dbSendQuery(connection, query10)
glimpse(empi_data)
dbClearResult(query_result)

dbDisconnect(connection)

