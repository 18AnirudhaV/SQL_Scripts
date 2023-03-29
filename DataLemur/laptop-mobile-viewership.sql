-- Question:
/*
Assume that you are given the table below containing information on viewership by device type (where the three types are laptop, tablet, and phone). 
Define “mobile” as the sum of tablet and phone viewership numbers. 
Write a query to compare the viewership on laptops versus mobile devices.

Output the total viewership for laptop and mobile devices in the format of "laptop_views" and "mobile_views".
*/

-- Answer:

SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership

-- Discusion Solution:

SELECT 
(SELECT COUNT(*) from viewership WHERE device_type = 'laptop') AS laptop_views,
(SELECT COUNT(*) from viewership WHERE device_type IN ('tablet', 'phone')) AS mobile_views
