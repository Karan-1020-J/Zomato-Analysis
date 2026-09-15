create database zomato_sale_Analysis;
use zomato_sale_Analysis;
select * from main2;
select * from country;
select * FROM CURRRENCY;
--               ------------------------------KPI---------------


-- TOTAL RESTAURANT 
SELECT count(RESTAURANTID) As Total_Restaurant FROM MAIN2;


--   TOTAL CITY
SELECT   count(distinct(CITY)) AS Total_city from main2;


-- TOTAL COUNTRY 
SELECT count(distinct(COUNTRYname)) AS Total_country from country;

-- AVERAGE RATING
select cast(avg(RATING) as decimal(10,2))  AS Average_Rating from main2;


-- Total Votes
select sum(votes) as Total_vote from main2;

-- TOTAL CUSINES
SELECT count(distinct(CUISINES)) AS Total_Cusines from main2;


--  TOTAL SALE IN USD
 select cast(sum(Average_cost_for_two * usd_rate)as decimal(10,2)) as Total_sale_Usd from main2 inner join currrency on main2.currency=
 currrency.currency;
 
 
 -- -------------     4.Find the Numbers of Resturants based on City .
 select count(Restaurantid) as Total_Restaurant,City from main2 group by city order by count(restaurantid) desc;
 
 
 
 --  ----- ---------- 5.Find the Numbers of Resturants based on  Country.
select  countryname,count(restaurantid) as Total_Count_OF_Restaurant from main2 inner join country on main2.countrycode=country.countryid
 group by countryname order by count(restaurantid) desc;
 
 
 -- ----------------------- 6.Numbers of Resturants opening based on Year
 Select distinct(year) ,count(restaurantid) as Count_OF_Restaurant_Based_ON_Year from main2 
 group by year order by count(restaurantid) desc;


-- -------------------------7.Numbers of Resturants opening based on Quarter 
 Select Quarter_Name ,count(restaurantid) as Count_OF_Restaurant_Based_ON_Quarter from main2
 group by Quarter_Name order by count(restaurantid);
 
 -- ------------------------------- 8.Numbers of Resturants opening based on Month
 Select Month_name ,count(restaurantid) as Count_OF_Restaurant_Based_ON_Month from main2 
 group by Month_name order by count(restaurantid) desc;


-- --------------------------9.Percentage of Resturants based on "Has_Table_booking"
select has_table_booking,concat(round(count(has_table_booking)/100,1),"%") percentage from Main2 group by has_table_booking;

-- ---------------------------10.Percentage of Resturants based on "Has_Online_delivery"
select has_online_delivery,concat(round(count(Has_Online_delivery)/100,1),"%") percentage 
from MAIN2
group by has_online_delivery;


-- ----------11. Create buckets based on Average Price of reasonable size and find out how many resturants falls in each buckets
select case when price_range=1 then "0-500" when price_range=2 then "500-3000" when Price_range=3 then "3000-10000" when 
Price_range=4 then ">10000" end price_range,count(restaurantid)
from main2
group by price_range
order by Price_range desc;




-- CHARTS

-- TOP 5 MOST COUNTRY BASED ON VOTE 

SELECT COUNTRYNAME , count(VOTES) AS Total_votes FROM MAIN2 INNER JOIN COUNTRY ON MAIN2.COUNTRYCODE=COUNTRY.COUNTRYID 
group by  COUNTRYNAME ORDER BY count(VOTES) DESC  LIMIT 5;

-- --------TOP 5 RESTAURANT BASED ON RATING 
 SELECT RestaurantName , count(RATING) AS Total_Rating FROM MAIN2 
group by Restaurantname ORDER BY count(Rating) DESC  LIMIT 5;


-- ------------TOP 5 CUSINES BASED ON RATING
 SELECT CUISINES  , count(RATING) AS Total_Rating FROM MAIN2 
group by CUISINES ORDER BY count(Rating) DESC  LIMIT 5;



-- -----------Top restaurant with highest rating and votes from each country
select  countryname,restaurantname,max(rating)highest_rating,max(votes) from main2 inner join Country on main2.countrycode=Country.countryid
group by countryname , restaurantname order by max(votes) desc limit 5;
anj