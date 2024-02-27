movie1 <- read.csv("/cloud/project/MovieReviews/CSVfiles/1stmovie.csv")
movie2 <- read.csv("/cloud/project/MovieReviews/CSVfiles/2ndmovie.csv")
movie3 <- read.csv("/cloud/project/MovieReviews/CSVfiles/3rdmovie.csv")
movie4 <- read.csv("/cloud/project/MovieReviews/CSVfiles/4rthmovie.csv")
movie5 <- read.csv("/cloud/project/MovieReviews/CSVfiles/5thmovie.csv")
movie6 <- read.csv("/cloud/project/MovieReviews/CSVfiles/6thmovie.csv")
movie7 <- read.csv("/cloud/project/MovieReviews/CSVfiles/7thmovie.csv")
movie8 <- read.csv("/cloud/project/MovieReviews/CSVfiles/8thmovie.csv")
movie9 <- read.csv("/cloud/project/MovieReviews/CSVfiles/9thmovie.csv")
movie10 <- read.csv("/cloud/project/MovieReviews/CSVfiles/10thmovie.csv")


MergedMovies <- rbind(movie1, movie2, movie3, movie4, movie5, movie6, movie7, movie8, movie9, movie10)


write.csv(MergedMovies, "MergedMovie.csv", row.names = FALSE)
