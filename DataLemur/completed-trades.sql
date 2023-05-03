-- Question:
/*
Assume you're given the tables containing completed trade orders and user details in a Robinhood trading system.

Write a query to retrieve the top three cities that have the highest number of completed trade orders listed in descending order. 
Output the city name and the corresponding number of completed trade orders.
*/

-- Answer:

SELECT u.city, count(t.order_id) as total_orders
FROM users as u INNER JOIN trades as t ON u.user_id = t.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC LIMIT 3;

-- Discusion Solution: same answer
