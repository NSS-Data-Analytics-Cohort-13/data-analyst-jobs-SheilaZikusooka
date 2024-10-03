SELECT *
FROM data_analyst_jobs;

--1. How many rows are in the data_analyst_jobs table?

SELECT COUNT (*)
FROM data_analyst_jobs;

--Answer: 1793






--2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;

--Answer: ExxonMobil




--3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT(location)
FROM data_analyst_jobs 
WHERE location ='TN';

--Answer 3a: 21 postings are in Tennessee

SELECT COUNT(location)
FROM data_analyst_jobs 
WHERE location IN ('TN','KY');

--Answer 3b: 27 postings are the total postings in Tennessee and Kentucky





--4. How many postings in Tennessee have a star rating above 4?

SELECT COUNT(location)
FROM data_analyst_jobs
WHERE(location= 'TN') AND (star_rating >'4');

--Answer: 3





--5. How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count 
BETWEEN 500 AND 1000;

--Answer: 151





--6. Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT ROUND(AVG(star_rating), 2) AS avg_rating , location AS state
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY state
ORDER BY avg_rating DESC;

--Answer: 4.20 in NE





--7. Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT COUNT (DISTINCT title) AS unique_jobs
FROM data_analyst_jobs;

--Answer: 881





--8. How many unique job titles are there for California companies?

SELECT COUNT (DISTINCT title) AS unique_jobs
FROM data_analyst_jobs
WHERE (location='CA');

--Answer: 230





--9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT ROUND(AVG(star_rating), 2) AS avg_rating, company
FROM data_analyst_jobs
WHERE (review_count>'5000')
AND company IS NOT NULL
GROUP BY company
ORDER BY avg_rating ASC;

--Answer: 40





--10.Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT ROUND(AVG(star_rating), 2) AS avg_rating, company,review_count, location
FROM data_analyst_jobs
WHERE (review_count>'5000')
GROUP BY company, review_count, location
ORDER BY avg_rating DESC;

--Answer: General Motors in MI, with 6241 reviews has the highest start rating with more that 5000 reviews. 4.20 is the rating.





--11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

SELECT COUNT (title)
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

--Answer: 1636




--12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT count(title)
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%' 
AND title NOT LIKE '%Analytics%';

--Answer: 36 different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’. The word of these positions are all captialized