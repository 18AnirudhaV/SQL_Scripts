-- Question:
/*
Given the reviews table, write a query to retrieve the average star rating for each product, grouped by month. 
The output should display the month as a numerical value, product ID, and average star rating rounded to two decimal places. 
Sort the output first by month and then by product ID.
*/

-- Answer:

SELECT EXTRACT(MONTH FROM submit_date) AS month, 
  product_id AS product, 
  ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY month, product
ORDER BY month, product;

-- Discusion Solution: same answer but different syntax for grouping and ordering

SELECT EXTRACT(MONTH FROM submit_date) AS month, 
  product_id AS product, 
  ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY 1, 2
ORDER BY 1, 2; 
