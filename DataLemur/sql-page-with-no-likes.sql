-- Question:
/*
Assume you are given the tables below about Facebook pages and page likes. 
Write a query to return the page IDs of all the Facebook pages that don't have any likes. 
The output should be in ascending order.
*/

-- Answer:

SELECT pages.page_id
FROM pages LEFT OUTER JOIN page_likes ON pages.page_id = page_likes.page_id
WHERE page_likes.liked_date is NULL
ORDER BY pages.page_id

-- Discusion Solution:

SELECT page_id FROM pages
except 
SELECT page_id FROM page_likes;
