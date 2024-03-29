-- Question:
/*
You're trying to find the mean number of items per order on Alibaba, rounded to 1 decimal place using tables which includes information on the count of items in each order (item_count table) 
and the corresponding number of orders for each item count (order_occurrences table).
*/

-- Answer:

SELECT ROUND(SUM(item_count::DECIMAL*order_occurrences) / SUM(order_occurrences) ,1) AS mean
FROM items_per_order;

-- Discusion Solution: Multiplying by 1.0 casts it to a decimal value as well

SELECT ROUND(1.0 * SUM(item_count * order_occurrences) / SUM(order_occurrences), 1) AS mean
FROM items_per_order;
