
# Corona Tracker and Predictor

This project was created with an objective of my B.Tech final year project submission. 
It is a webiste which has helps people stay up-todate with the latest state of the virus.
This idea had helped to analyze the situation by acting as a forewarning to those in dangerous regions, as the number of regions began growing at an exponential rate.





## What the application does

- Getting the information of each country through the rest api services and web scrapping

- Visualization of the real time data using different charts as charts helps to understand the data

- Predicting the statistics' of affected people for the coutries all over the world for next 7 days. Applied Machine Learning Algorithm for that.

- For India, the application is able to show stats for each states

- Provided some of our own api services for processed data





# How the Application looks like

**The Home page is loaded with the details of three section:**

1.World's Total Confirmed Cases on the latest date

2.World's Total Death Cases on the latest date

3.World's Total Recovered Cases on the latest date

<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/hello_page.png">
This screenshot was taken on 26/05/2020


You can get to the see the month wise bar charts as how the Covid-19 virus is affecting the worlds in a month wise comparative view.

<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/month_wise_chart.jpg">

We can get the details of each and every country by searching in the Country Details section and clicking on the Info button, that will redirect to another page with loading the details of the country


<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/stats_for_world.jpg">

This is also the continuation of the same home page. This section has the three pie charts with country name and some records.
The three pie charts depicts the details of top 7 countries and others.
These pie charts are very useful to show the how much the top country is getting affected from the total data. 


<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/confirmed_leading_curve.jpg">

<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/other_leading_curve_world.jpg">

The data has been taken from 1st February till the date. The image above you all can see that the graph is getting an increased slope hence we can say that the people are still getting affected due to corona.
The graph only shows the latest and cumulative results of the affected people. If we hover on the line we can see the date and the result of people got affected till that day.
The graphs are showing for Confirmed cases , then Dead peopls and then the Recovered people simultaneously


<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/Rate_daily_cases.jpg">
<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/other_rate_daily_cases.jpg">

These three graphs are for daily cases. It shows the rate at which the cases are increasing or decreasing.
These rate graphs majorly used for descison making


<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/prediction_img.jpg">
<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/prediction_model_img.jpg">
<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/prediction_date_img.jpg">

In Simple Linear Regression, we tried to find the relationship between a single independent variable (input) and a corresponding dependent variable (output). This can be expressed in the form of a straight line.

Since it is Linear Regression model the graph linear has been a linear increased slope. In that situation linear model was the most accurate model that had been shown in the Mathematical formulation part.

The predicted confirmed cases are shown for next 7 days consecutively.  From the above screenshot, we can see the Predicted result for world.



## Tech Stack

**Client:** HTML, CSS, Vanilla Javascript, Canvas Js

**Server:** Java Spring Boot

**ML Engine:** Tensorflow js
