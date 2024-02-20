install.packages("dplyr")
install.packages("dbplyr")
library(dplyr)
library(dbplyr)
install.packages("RMySQL")
library(RMySQL)
install.packages("RMariaDB")
library(RMariaDB)

connection <- dbConnect(RMariaDB::MariaDB(), 
                        dsn="mysql",
                        Server = "localhost",
                        dbname = "samplecs102", 
                        user = "root", 
                        password = '')


