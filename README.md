# Scraping-IMDB Movie-website using R

![imdb-logo](https://user-images.githubusercontent.com/116097143/235150298-e25bc53e-f535-4608-b5b1-d9cc31a12f0f.png)

Now, let’s get started with scraping the IMDb website for the 100 most popular feature films released in 2023. You can access them [here](https://www.imdb.com/search/title/?count=100&release_date=2023,2023&title_type=feature)

This project extracts information on the top 100 movies on IMDB scheduled for release in 2023. The scraper collects data on the movie's title, genre, release date, runtime, IMDB rating, and description.

## Getting Started

To get started with the project, you will need to have R installed on your machine. 
You will also need to install the following packages:

- rvest
- ggplot2

## How it Works

The scraper uses R's rvest package to scrape data from the IMDB website. It reads the HTML code of the webpage using the read_html() function and extracts specific elements from the webpage using CSS selectors.

Now, we’ll be scraping the following data from this website.

•	Rank: The rank of the film from 1 to 100 on the list of 100 most popular feature films released in 2016.

•	Title: The title of the feature film.

•	Description: The description of the feature film.

•	Runtime: The duration of the feature film.

•	Genre: The genre of the feature film.

•	Rating: The IMDb rating of the feature film.

•	Metascore: The metascore on IMDb website for the feature film.

•	Votes: Votes cast in favor of the feature film.

•	Director: The main director of the feature film. Note, in case of multiple directors, I’ll take only the first.

•	Actor: The main actor in the feature film. Note, in case of multiple actors, I’ll take only the first.

Here’s a screenshot that contains how all these fields are arranged

![preview](https://user-images.githubusercontent.com/116097143/235150185-58876b0e-6146-4239-b560-5eaf7328551c.png)

- Step 1: Now, I will start by scraping the Rank field. 

![rank data](https://user-images.githubusercontent.com/116097143/235151362-f55ea218-2e3a-427d-9edd-93f1d4b937d3.png)

Data-Preprocessing: I preprocessed my data to convert it to numerical format

![numeric rank data](https://user-images.githubusercontent.com/116097143/235151358-63a9f792-469f-4032-93d4-2b76fb3849d7.png)

- Step 2: Scraping all the Titles

![title](https://user-images.githubusercontent.com/116097143/235151320-d1b8ab07-1ba3-4811-9cdd-8cb91bfe48e4.png)

- Step 3: Scraping the Description field

![description data](https://user-images.githubusercontent.com/116097143/235151342-bdd13274-0e14-40c8-810c-7f569ad2fde5.png)

Data-Preprocessing: I preprocessed my data to remove '\n'

![cleaned description](https://user-images.githubusercontent.com/116097143/235151339-f90783c6-f85c-48ea-b5cd-24e9cb6d9b91.png)

- Step 4: Scraping the Runtime field

![runtime data](https://user-images.githubusercontent.com/116097143/235151372-98284626-3c58-497d-9fdd-04cc302ce304.png)

Data-Preprocessing: removed mins, replace missing fields with NA and converted it to numerical

![cleaned runtime](https://user-images.githubusercontent.com/116097143/235159232-36f92ba6-7534-4044-9b4e-0ab51b7ca2b5.png)

- Step 5: Scraping the Genre field

![genre](https://user-images.githubusercontent.com/116097143/235151355-ffe8793e-367e-455e-a873-4c5ba7c2b0a7.png)

Data-Preprocessing: removed \n, excess spaces, converting each genre to factor

![genre clean](https://user-images.githubusercontent.com/116097143/235151351-6a002691-73a9-4466-9eea-d772b2bd7b5e.png)

- Step 6: Scraping the Rating  field

![rating](https://user-images.githubusercontent.com/116097143/235151370-8204e365-e9f7-4da8-8df3-929016d8174e.png)

Data-Preprocessing: converted ratings to numerical and filled missing with NA

![rating cleaned](https://user-images.githubusercontent.com/116097143/235159386-793eb022-b404-4a42-be16-7399c15de9e2.png)

- Step 7: Scraping the Votes field

![vote](https://user-images.githubusercontent.com/116097143/235151329-755971fb-5818-4a1e-82fd-7e8da474f3e2.png)

Data-Preprocessing: removing commas, converted to numerical, filled missing with NA

![vote cleaned](https://user-images.githubusercontent.com/116097143/235160508-09842ac0-b94c-4117-b8c3-646a44382796.png)

- Step 8: Scraping the Directors field

![director](https://user-images.githubusercontent.com/116097143/235151347-67f19bb1-c468-4a78-b09e-1f287fe3ab3a.png)

Data-Preprocessing: converting directors data into factors

![director cleaned](https://user-images.githubusercontent.com/116097143/235151344-f95c75f3-54e8-4f51-8ec7-115ee703b59b.png)

- Step 9: Scraping the Actors field

![actors](https://user-images.githubusercontent.com/116097143/235151337-4b9b0480-9101-4fd5-b8d3-e91f7fb908fa.png)

Data-Preprocessing: converting actors data into factors

![actors cleaned](https://user-images.githubusercontent.com/116097143/235151334-fcd466d1-2e6a-4a20-b36f-8a872e0f9168.png)

- Step 10: Scraping the Metascore field

![metascore](https://user-images.githubusercontent.com/116097143/235151356-639d132c-3833-46d7-ad58-3aefec05556a.png)

Data-Preprocessing: removing extra space, filled missing with NA, and converted to numerical

![metascore cleaned](https://user-images.githubusercontent.com/116097143/235162823-b2e435e2-ec39-4785-a307-91f26679cd18.png)

- Step 11: We have successfully scraped all the 10 features for the 100 most popular feature films released in 2023. 
Let’s combine them to create a dataframe and inspect its structure

![structure](https://user-images.githubusercontent.com/116097143/235164002-a187ea73-bd42-4c37-9334-9f206b5545b3.png)


Time to Analyze my scraped data from the web using PowerBI

![dashboard 1](https://user-images.githubusercontent.com/116097143/235258313-ba52e841-792c-44e2-92dc-ff4b69ffa8e5.png)
![dashboard 2](https://user-images.githubusercontent.com/116097143/235258382-f2e90e72-1b60-4bf4-ac8e-359b224a22ee.png)

From my analysis, 
## KPI 
- total movies 100, 
- avg rating 6.44, -
- avg runtime movie  116, 
- avg metascore 55.15

Avg rating movie topping our chart is John Wick with a rating score of 8.20
The genre with the most votes is Action movies, most people are lovers of action movies 
The actor with the top avg rating is Keanu Reeves, who was the main character in John Wick.
Director with top avg rating is Chad Stahelski, who directed the John Wick movie.
Movie with highest runtime is Transformers: Rise of the Beast
