
# Corona Tracker and Predictor

This project was created with an objective of my B.Tech final year project submission. 
It is a webiste which has helps people stay up-todate with the latest state of the virus.
This idea had helped to analyze the situation by acting as a forewarning to those in dangerous regions, as the number of regions began growing at an exponential rate.





## What the application does

- **Getting the information of each country through the rest api services and web scrapping**

- **Visualization of the real time data using different charts as charts helps to understand the data**

- **Predicting the statistics' of affected people for the coutries all over the world for next 7 days. Applied Machine Learning Algorithm for that.**

- **For India, the application is able to show stats for each states**

- **Provided some of our own api services for processed data**





# How the Application looks like

**The Home page is loaded with the details of three section:**

World's Total Confirmed Cases on the latest date

World's Total Death Cases on the latest date

World's Total Recovered Cases on the latest date

<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/hello_page.png">
This screenshot was taken on 26/05/2020


You can get to the see the month wise bar charts as how the Covid-19 virus is affecting the worlds in 
a month wise comparative view.

<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/month_wise_chart.jpg">

We can get the details of each and every country by searching in the Country Details section and 
clicking on the Info button, that will redirect to another page with loading the details of the country


<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/stats_for_world.jpg">

This is also the continuation of the same home page. This section has the three pie charts with country 
name and some records.
    
The three pie charts depicts the details of top 7 countries and others.
    
These pie charts are very useful to show the how much the top country is getting affected from the total 
data. 


<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/confirmed_leading_curve.jpg">

<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/other_leading_curve_world.jpg">

The data has been taken from 1st February till the date. The image above you all can see that the graph is 
getting an increased slope hence we can say that the people are still getting affected due to corona.
    
The graph only shows the latest and cumulative results of the affected people. If we hover on the line we can see the 
date and the result of people got affected till that day.
    
The graphs are showing for Confirmed cases , then Dead peopls and then the Recovered people simultaneously


<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/Rate_daily_cases.jpg">
<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/other_rate_daily_cases.jpg">

These three graphs are for daily cases. It shows the rate at which the cases are increasing or decreasing.
    
These rate graphs majorly used for descison making.


<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/prediction_img.jpg">
<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/prediction_model_img.jpg">
<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/prediction_date_img.jpg">

In Simple Linear Regression, we tried to find the relationship between a single independent variable (input) and 
a corresponding dependent variable (output). This can be expressed in the form of a straight line.

Since it is Linear Regression model the graph linear has been a linear increased slope. In that situation linear model 
was the most accurate model that had been shown in the Mathematical formulation part.

The predicted confirmed cases are shown for next 7 days consecutively.  From the above screenshot, we can see the 
Predicted result for world.


### Country Info
<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/Us_home_stats.jpg">
    
In the above screenshot, confirmed, death, and recovery statistics till now are shown in significantly colored container , 
we have selected US from the table to get the details of Covid situation thoroughly for that country.
    
The percentage of affected people are calculated with respect to the population of total people affected and recovered 
from corona.


<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/Us_monthly_stats.jpg">
    
Now the daily confirmed, death, and recovery cases are shown in container under newly added record. It basically shows 
the present day statistics.

On the right side, the month wise bar chart is shown to study comparatively. 



<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/Us_some_more_stats.jpg">

A brief details about the country is shown

Rate of people getting affected, dying and recovery rate per day are also shown in these part. All of these 
information creates a clear picture of current Covid scenario in that country for the users.

We are getting the result through web scrapping.

<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/Us_last_days.jpg">
 
Here, we have fetched the corresponding statistics regarding the covid-19 confirmed, death and recovery cases for the last 30 days, through REST-API for analyzing the trend of increasing spread of corona positive people. 


### India Info

<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/India_home_stats.jpg">

By clicking on the India button from home page, we are redirected to the India???s detail page.

In the above screenshot, confirmed, death, and recovery statistics till now are shown in significantly colored container .we have selected India to get the details of Covid situation thoroughly.


<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/India_states.jpg">

The state wise record consisting of corona confirmed people, dead people and the people recovered from corona. In the image shown above the list of states with the corona affected, dead and recovered are shown in a box format to get the details in one page.

<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/India_confirmed_states.jpg">

<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/India_dead_state.jpg">


The images show the comparative study of confirmed, dead and recovered cases in different states. This is a bar chart for analyzing the statistics. This list of the corona affected state are placed according to the decreasing order of number of people has affected in that particular state.


### West Bengal

<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/Westbengal_home.jpg">

By clicking on the state info button from India details page, we are redirected to the corresponding state details page.

In the above screenshot, confirmed, death, and recovery statistics till now are shown in significantly colored container.

The percentage of affected people are calculated with respect to the population of total people in India affected and recovered from corona.


<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/Westbengal_home_daily_new.jpg">

<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/Westbengal_last.jpg">

Here, confirmed, dead cases and corona recovered cases are represented in a single graph. The graphs are indicating the increasing trends of covid-19 for confirmed, death tolls well as recoveries.


<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/Westbengal_prediction_curve.jpg">

<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/Westbengal_prediction_data.jpg">

Here, the predicted confirmed cases are shown for next 7 days consecutively.  From the above screenshot, we can see the Predicted result for the particular state.


<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/Westbengal_zones.jpg">

State Government and central government have classified the zones dividing the area based on the rates of spreading covid-19 on that area. This list can also indicate the current hotspot areas as Red zone, apparently moderate spreading zone ???yellow Zone and Green zone where the outbreak is still less in number. 

<img src="https://github.com/Logan2406/Corona_Tracker_and_Predictor/blob/main/Corona_Pics/westbengal_testing_centers.jpg">

This section gives the detail of the hospitals and testing centers for corona. The testing centers are of two types Government and Private. Here the users will get all the details of the testing centers for the particular state.











## Tech Stack

**Client:** HTML, CSS, Vanilla Javascript, Canvas Js

**Server:** Java Spring Boot

**ML Engine:** Tensorflow js

## Authors


- [Jyoti Pravo Pal](linkdin)

- [Basundhara Saha](linkdin)
