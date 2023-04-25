-- Question:
/*
Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. 
Write a query to get the number of companies that have posted duplicate job listings.

Clarification:

*/

-- Answer:

WITH jobs_grouped AS (
  SELECT 
    company_id, 
    title, 
    description, 
    COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY 
    company_id, 
    title, 
    description)

SELECT COUNT(DISTINCT company_id) AS co_w_duplicate_jobs
FROM jobs_grouped
WHERE job_count > 1;

-- Discusion Solution: Subquery vs CTE I used above

SELECT COUNT(DISTINCT company_id) AS co_w_duplicate_jobs
FROM (
  SELECT 
    company_id, 
    title, 
    description, 
    COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY 
    company_id, 
    title, 
    description) AS jobs_grouped
WHERE job_count > 1;
