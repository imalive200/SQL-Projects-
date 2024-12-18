							-- ALL SQL BASIC PLAYGROUND QUESTIONS--
-- SELECT --
-- Q1. Retrieve all data and cloumns from customers.
 
SELECT *
FROM customers;
 
-- Q2. Retrieve ONLY first name and country of all customers. 
 
SELECT first_name, country
FROM customers;

-- DISTINCT --
-- Q3. List all countries of all customers without duplicates.

SELECT DISTINCT country
FROM customers;

-- ORDER BY --
-- Q4. Retrieve all customers where the result is sorted by score(smallest first).

SELECT *
FROM customers
ORDER BY score ASC;

-- Q5.Retrieve all customers where the result is sorted by score(highest first).

SELECT  *
FROM customers
ORDER BY score DESC;

-- Q6.Retrieve all customers, sorting the result by country(alphabetically) and then by score(highest first).

SELECT *
FROM customers
ORDER BY country ASC , score DESC;

-- WHERE --
-- Q7. List only german customers.

SELECT *
FROM customers
WHERE country = 'germany';

-- Q8. Find all customers whose score is greater than 500?

SELECT *
FROM customers
WHERE score > 500;

-- Q9. Find all customers whose score is less than 500?

SELECT *
FROM customers
WHERE score < 500;

-- 10. Find all customers whose score is less than or equal to  500?

SELECT *
FROM customers
WHERE score <= 500;

-- Q11. Find all customers whose score is higher  than or equal to  500?

SELECT *
FROM customers
WHERE score >= 500;

-- Q12. Find all non-german customers?

SELECT *
FROM customers
WHERE country != 'Germany';

-- AND --
-- Q13. Find all customers who come from Germany AND whose score is less than 400?

SELECT *
FROM customers
WHERE country = 'Germany' AND score < 400;

-- OR --
-- Q14. Find all customers who come from Germany OR whose score is less than 400? 

SELECT *
FROM customers
WHERE country = 'Germany' OR score < 400;

-- NOT --
-- Q15. Find all customers whose score is NOT less than 400?

SELECT *
FROM customers
WHERE NOT score < 400;

-- BETWEEN --
-- Q16. Find all customers whose score falls in the range between 100 and 500?

SELECT *
FROM customers 
WHERE score BETWEEN 100 AND 500;

-- IN --
-- Q17. Find all customers whose ID is equal to 1, 2 or 5?

SELECT *
FROM customers
WHERE customer_id IN (1,2,3);

-- LIKE --
-- Q18. Find all customers whose first name starts with M?

SELECT *
FROM customers
WHERE first_name LIKE 'M%';

-- Q19. Find all customers whose first name ends with n?

SELECT *
FROM customers
WHERE first_name LIKE '%n';

-- Q20. Find all customers whose first name contains r?

SELECT *
FROM customers
WHERE first_name LIKE '%R%';

-- Q21. Find all customers whose first name contains r in 3d position?

SELECT *
FROM customers
WHERE first_name LIKE '__R%';

-- ALIASES --
-- Q22. Columns
SELECT customer_id AS cid  
FROM customers;  
 
-- Q23. Tables
SELECT c.customer_id AS cid  
FROM customers AS c;
 
-- INNER JOIN --
-- Q24. List customer ID, first name, order ID, quantity. Exclude the customers who have not placed any orders.
 
SELECT c.customer_id, c.first_name, o.order_id, o.quantity
FROM customers AS c
INNER JOIN orders as o ON c.customer_id = o.customer_id;
 
-- LEFT JOIN --
-- Q25. List customer ID, first name, order ID, quantity. Include  the customers who have not placed any orders.
 
SELECT c.customer_id, c.first_name, o.order_id, o.quantity
FROM customers AS c
LEFT JOIN orders as o ON c.customer_id = o.customer_id;

-- RIGHT JOIN --
-- Q26. List customer ID, first name, order ID, quantity.
-- Include all orders, regardless of whether there is a matching customer.

SELECT c.customer_id, c.first_name, o.order_id, o.quantity
FROM customers AS c
RIGHT JOIN orders AS o ON c.customer_id = o.customer_id; 
 
-- FULL JOIN --
-- Q27. List customer ID, first name, order ID, quantity. Include all customers and all orders.
 
SELECT c.customer_id, c.first_name, o.order_id, o.quantity
FROM customers AS c
LEFT JOIN orders AS o ON c.customer_id = o.customer_id 
 
UNION
 
SELECT c.customer_id, c.first_name, o.order_id, o.quantity
FROM customers AS c
RIGHT JOIN orders AS o ON c.customer_id = o.customer_id;

-- UNION --
-- Q28. List first name, last name and country of all persons from customers and employees.

SELECT first_name, last_name, country
FROM customers

UNION ALL

SELECT first_name, last_name, emp_country
FROM employees;
 
-- Q29. List first name, last name and country of all persons from customers and employees without duplicates.
 
SELECT first_name, last_name, country
FROM customers

UNION 

SELECT first_name, last_name, emp_country
FROM employees;

-- COUNT() --
-- Q30. Find the total number of customers?

SELECT COUNT(*) AS total_customers
FROM customers;

-- SUM() --
-- Q31. Find the total quantity of all orders?

SELECT SUM(quantity) AS sum_quantity
FROM orders;

-- AVG() --
-- Q32. Find the average score of all customers?

SELECT AVG(score) AS avg_score
FROM customers;

-- MAX() MIN() --
-- Q32.Find the highest score of all customers AND Find the lowest score of all customers?

SELECT MAX(score) AS max_score
FROM customers;

SELECT MIN(score) AS min_score
FROM customers;

-- GROUP BY --
-- Q33. Find the total number of customers for each country?

SELECT COUNT(*) AS total_customers,country
FROM customers
GROUP BY country;

-- HAVING --
-- Q34. Find the total number of customers for each country and only include countries that have more than 1 customer?

SELECT COUNT(*) AS total_customers, country
FROM customers
GROUP BY country
HAVING COUNT(*) > 1;

-- CONCAT() -- 
-- Q35. List all customer names, where the name is combination of first name and last name.

SELECT CONCAT(first_name,'-',last_name) AS customer_name
FROM customers;

-- LOWER() --
-- Q36. List the first name of all customers in lowercase.

SELECT LOWER(first_name) AS low_first_name
FROM customers;

-- UPPER() --
-- Q37. List the first name of all customers in lowercase.

SELECT UPPER(first_name) AS up_first_name
FROM customers;

-- TRIM() --
-- Q38. List the last name of all customers and remove all the white spaces in the names.

SELECT TRIM(last_name) AS trim_last_name
FROM customers;

-- LENGTH() --
-- Q39. Find the length of the last name of all customers?

SELECT LENGTH(last_name) AS len_last_name
FROM customers;

-- SUBSTRING() --
-- Q40. Subtract 3 characters from the last name of all customers, starting from the 2d position.

SELECT SUBSTRING(last_name,2,3) AS sub_last_name
FROM customers;

-- IN --
-- Q41. Find all orders placed from customers whose score higher than 500 using customer_id?

SELECT *
FROM orders
WHERE customer_id IN (
 SELECT customer_id
 FROM customers
 WHERE score > 500);
 

									  -- -- YHANK YOU -- --