

 -- Q1. Display the country and the city with most no of museums?

SELECT country,city,COUNT(country) AS no_of_museum
FROM museum
GROUP BY country,city
ORDER BY no_of_museum DESC
LIMIT 1;
 
 -- Q2. Which are the 3 most popular and 3 least popular painting styles?
 
SELECT style, COUNT(*) AS most_popular
FROM works 
GROUP BY style
ORDER BY most_popular DESC
LIMIT 3;

SELECT style ,COUNT(*) AS least_popular 
FROM works
GROUP BY style
ORDER BY least_popular ASC
LIMIT 3;

-- Q3.How many museums are open every single day?

SELECT m.museum_id, m.name AS museum_name, COUNT(DISTINCT mh.day) AS open_days
FROM museum_hours mh
JOIN museum m ON m.museum_id = mh.museum_id
GROUP BY m.museum_id, m.name
HAVING open_days = 7;

-- Q4. Identify the museums which are open on both Sunday and Monday.
                
SELECT DISTINCT name, city, state, country
FROM museum_hours 
JOIN museum m ON m.museum_id = museum_hours.museum_id
WHERE day = 'Sunday'
  AND EXISTS (
    SELECT 1
    FROM museum_hours mh
    WHERE mh.day = 'Monday' AND mh.museum_id = museum_hours.museum_id
  );
                
-- Q5. Which museum is open for the longest during a day. Dispay museum name, state and hours open and which day?

SELECT DISTINCT
    m.name AS museum_name,
    m.state,
    mh.day,
    mh.open_time,
    mh.close_time,
    TIMESTAMPDIFF(HOUR, mh.open_time, mh.close_time) AS hours_open
FROM museum_hours mh
JOIN museum m ON m.museum_id = mh.museum_id
ORDER BY hours_open DESC
LIMIT 1;



										-- -- THANK YOU -- --	





