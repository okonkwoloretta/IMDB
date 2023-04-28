#Loading the rvest package
library('rvest')
library('ggplot2')

#Specifying the url for desired website to be scraped
url <- 'https://www.imdb.com/search/title/?count=100&release_date=2023,2023&title_type=feature'

#Reading the HTML code from the website
webpage <- read_html(url)

#Using CSS selectors to scrape the rankings section
rank_data_html <- html_nodes(webpage,'.text-primary')

#Converting the ranking data to text
rank_data <- html_text(rank_data_html)

#Let's have a look at the rankings
head(rank_data)

#Data-Preprocessing: Converting rankings to numerical
rank_data<-as.numeric(rank_data)

#Let's have another look at the rankings
head(rank_data)
length(rank_data)

#Using CSS selectors to scrape the title section
title_data_html <- html_nodes(webpage,'.lister-item-header a')

#Converting the title data to text
title_data <- html_text(title_data_html)

#Let's have a look at the title
head(title_data)
length(title_data)

#Using CSS selectors to scrape the description section
description_data_html <- html_nodes(webpage,'.ratings-bar+ .text-muted , .text-muted+ .text-muted')

#Converting the description data to text
description_data <- html_text(description_data_html)

#Let's have a look at the description data
head(description_data)

#Data-Preprocessing: removing '\n'
description_data<-gsub("\n","",description_data)

#Let's have another look at the description data 
head(description_data)
length(description_data)

#Using CSS selectors to scrape the Movie runtime section
runtime_data_html <- html_nodes(webpage,'.runtime')

#Converting the runtime data to text
runtime_data <- html_text(runtime_data_html)

#Let's have a look at the runtime
head(runtime_data)
#Data-Preprocessing: removing mins and converting it to numerical
runtime_data<-gsub(" min","",runtime_data)
runtime_data<-as.numeric(runtime_data)

#Let's have another look at the runtime data
head(runtime_data)
length(runtime_data)

#filling missing data with NA
for (i in c(13,16,27,31,34,35,36,50,59,61,64,66,68,69,73,75,77,78,84,86,94,97,98)){
  
  a<-runtime_data[1:(i-1)]
  
  b<-runtime_data[i:length(runtime_data)]
  
  runtime_data<-append(a,list("NA"))
  
  runtime_data<-append(runtime_data,b)
  
}
#Data-Preprocessing: converting runtime to numerical
runtime_data<-as.numeric(runtime_data)

#Let's have another look at length of the runtime data
length(runtime_data)

#Let's look at summary statistics
summary(runtime_data)

#Using CSS selectors to scrape the Movie genre section
genre_data_html <- html_nodes(webpage,'.genre')

#Converting the genre data to text
genre_data <- html_text(genre_data_html)

#Let's have a look at the runtime
head(genre_data)

#Data-Preprocessing: removing \n
genre_data<-gsub("\n","",genre_data)

#Data-Preprocessing: removing excess spaces
genre_data<-gsub(" ","",genre_data)

#taking only the first genre of each movie
genre_data<-gsub(",.*","",genre_data)

#Converting each genre from text to factor
genre_data<-as.factor(genre_data)

#Let's have another look at the genre data
head(genre_data)
length(genre_data)

#Using CSS selectors to scrape the IMDB rating section
rating_data_html <- html_nodes(webpage,'.ratings-imdb-rating strong')

#Converting the ratings data to text
rating_data <- html_text(rating_data_html)

#Let's have a look at the ratings
head(rating_data)

#Data-Preprocessing: converting ratings to numerical
rating_data<-as.numeric(rating_data)

#Let's have another look at the ratings data
head(rating_data)

#filling missing data with NA
for (i in c(13,16,19,24,26,
            28,30,31,34,35,
            36,48,50,59,61,
            64,65,66,67,68,
            69,73,75,77,78,
            83,84,86,92,94,
            97,98)){
  
  a<-rating_data[1:(i-1)]
  
  b<-rating_data[i:length(rating_data)]
  
  rating_data<-append(a,list("NA"))
  
  rating_data<-append(rating_data,b)
  
}
#Data-Preprocessing: converting rating to numerical
rating_data<-as.numeric(rating_data)

#Let's have another look at length of the rating data
length(rating_data)
rating_data

# rating_data variable
rating_data <- c(7.3, 7.2, 7.0, 5.8, 8.2, 7.3, 6.7, 7.6, 6.2, 7.7, 6.3, 6.0, NA, 5.9, 6.3, NA, 6.1, 7.4, NA, 8.1, 6.6, 5.5, 6.3, NA, 7.0, NA, 5.3, NA, 5.6, NA, NA, 7.0, 6.9, NA, NA, NA, 7.2, 7.1, 6.1, 5.5, 5.3, 6.1, 5.6, 3.1, 7.2, 6.0, 5.6, NA, 7.7, NA, 7.1, 5.1, 5.3, 5.3, 5.8, 6.5, 6.5, 4.7, NA, 7.7, NA, 6.4, 6.6, NA, NA, NA, NA, NA, NA, 5.5, 7.1, 6.7, NA, 4.5, NA, 7.2, NA, NA, 7.7, 6.9, 6.6, 6.6, NA, NA, 7.8, NA, 7.9, 5.5, 5.7, 7.6, 6.1, NA, 6.9, NA, 4.8, 5.9, NA, NA, 6.6, 7.3, 5.7, 4.2)

# determine the length of rating_data
length(rating_data)

# exclude the last two ratings from rating_data
rating_data <- rating_data[-c(length(rating_data), length(rating_data)-1)]

# check the updated rating_data variable
rating_data

#Let's look at summary statistics
summary(rating_data)

#Using CSS selectors to scrape the votes section
votes_data_html <- html_nodes(webpage,'.text-muted+ span')

#Converting the votes data to text
votes_data <- html_text(votes_data_html)

#Let's have a look at the votes data
head(votes_data)

#Data-Preprocessing: removing commas
votes_data<-gsub(",","",votes_data)

#Data-Preprocessing: converting votes to numerical
votes_data<-as.numeric(votes_data)

#filling missing data with NA
for (i in c(13,16,19,24,26,28,30,31,34,35,36,48,50,59,61,64,65,66,67,68,69,73,75,77,78,83,84,86,92,94,97,98)){
  
  a<-votes_data[1:(i-1)]
  
  b<-votes_data[i:length(votes_data)]
  
  votes_data<-append(a,list("NA"))
  
  votes_data<-append(votes_data,b)
  
}
#Data-Preprocessing: converting votes to numerical
votes_data<-as.numeric(votes_data)

# delete the last two votes
votes_data <- votes_data[-c(length(votes_data), length(votes_data)-1)]

#Let's have another look at length of the votes data
length(votes_data)
#Let's look at summary statistics
summary(votes_data)

#Using CSS selectors to scrape the directors section
directors_data_html <- html_nodes(webpage,'.text-muted~ .text-muted+ p a:nth-child(1)')

#Converting the directors data to text
directors_data <- html_text(directors_data_html)

#Let's have a look at the directors data
head(directors_data)

#Data-Preprocessing: converting directors data into factors
directors_data<-as.factor(directors_data)

#Let's have a look at the directors data
head(directors_data)

#Using CSS selectors to scrape the actors section
actors_data_html <- html_nodes(webpage,'.lister-item-content .ghost+ a')

#Converting the gross actors data to text
actors_data <- html_text(actors_data_html)

#Let's have a look at the actors data
head(actors_data)

#Data-Preprocessing: converting actors data into factors
actors_data<-as.factor(actors_data)

#Let's have a look at the actors data
head(actors_data)

#Using CSS selectors to scrape the metascore section
metascore_data_html <- html_nodes(webpage,'.metascore')

#Converting the metascore data to text
metascore_data <- html_text(metascore_data_html)

#Let's have a look at the metascore 
head(metascore_data)

#Data-Preprocessing: removing extra space in metascore
metascore_data<-gsub(" ","",metascore_data)

#convert to numeric
metascore_data<-as.numeric(metascore_data)

#Lets check the length of metascore data
length(metascore_data)
metascore_data

#Lets check the length of metascore data
length(metascore_data)
metascore_data

#Replacing missing data with NA
for (i in c(13,15,16,19,21,24,26,
            28,30,31,34,35,36,37,
            38,41,46,48,50,52,53,
            54,58,59,61,62,64,65,
            66,67,68,69,72,73,74,
            75,76,77,78,80,81,83,
            84,86,87,91,92,94,95,
            96,97,98,99,100)){
  
a<-metascore_data[1:(i-1)]

b<-metascore_data[i:length(metascore_data)]

metascore_data<-append(a,list("NA"))

metascore_data<-append(metascore_data,b)

}
#Data-Preprocessing: converting metascore to numerical
metascore_data<-as.numeric(metascore_data)

#Lets check the length of metascore data
length(metascore_data)
metascore_data

#delete the last number metadata
metascore_data <- c(46,68,48,35,78,62,53,72,45,73,48,54,NA,61,NA,NA,47,
                    61,NA,63,NA,40,51,NA,50,NA,51,NA,44,NA,NA,61,73,NA,
                    NA,NA,NA,NA,72,48,NA,63,43,16,46,NA,19,NA,85,NA,81,
                    NA,NA,NA,52,58,62,NA,NA,53,NA,NA,53,NA,NA,NA,NA,NA,
                    NA,66,50,NA,NA,NA,NA,NA,NA,NA,67,NA,NA,50,NA,NA,49,
                    NA,NA,53,44,58,NA,NA,65,NA,NA,NA,NA,NA,NA,NA,50)

# Remove the last element from the vector
metascore_data <- head(metascore_data, length(metascore_data) - 1)

#Let's have another look at length of the metascore data
length(metascore_data)
#Let's look at summary statistics
summary(metascore_data)
metascore_data

#Combining all the lists to form a data frame
movies_df<-data.frame(Rank = rank_data, Title = title_data,
                      
                      Description = description_data, Runtime = runtime_data,
                      
                      Genre = genre_data, Rating = rating_data,
                      
                      Metascore = metascore_data, Votes = votes_data,
                      
                      Director = directors_data, Actor = actors_data)

#Structure of the data frame
str(movies_df)

#saving data file as csv
fwrite(movies_df, paste0("C:/Users/LORA/Desktop/imdb post/movies_df.csv"))

#Analyzing scraped data from the web
#which movie from which Genre had the longest runtime?

ggplot(movies_df, aes(x = Runtime, fill = Genre)) +
  geom_histogram(bins = 30, color = "black") +
  labs(x = "Runtime", y = "Count", fill = "Genre", title = "Genre with the longest runtime") +
  theme_bw()

#In the Runtime of 130-160 mins, which genre has the highest votes?
ggplot(movies_df,aes(x=Runtime,y=Rating))+
  geom_point(aes(size=Votes,col=Genre)) +
  labs(x = "Runtime", y = "Count", fill = "Genre", title = "Genre with the highest votes")

