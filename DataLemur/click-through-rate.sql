-- Question:
/*
Assume you have an events table on Facebook app analytics. 
Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.

Definition and note:

Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
To avoid integer division, multiply the CTR by 100.0, not 100.
*/

-- Answer:

SELECT app_id,
  ROUND(100.0 *
  SUM(CASE WHEN event_type = 'click' THEN 1 ElSE 0  END) /
  SUM(CASE WHEN event_type = 'impression' THEN 1 ElSE 0  END), 2) as ctr_rate
FROM events
WHERE timestamp >= '01/01/2022' AND timestamp < '01/01/2023'
GROUP BY app_id;

-- Discusion Solution: Using COUNT over SUM

SELECT
  app_id,
  ROUND(100.0 *
    COUNT(CASE WHEN event_type = 'click' THEN 1 ELSE NULL END) /
    COUNT(CASE WHEN event_type = 'impression' THEN 1 ELSE NULL END), 2)  AS ctr_rate
FROM events
WHERE timestamp >= '2022-01-01' 
  AND timestamp < '2023-01-01'
GROUP BY app_id;


-- Discusion Solution: Using SUM with FILTER

SELECT
  app_id,
  ROUND(100.0 *
    SUM(1) FILTER (WHERE event_type = 'click') /
    SUM(1) FILTER (WHERE event_type = 'impression'), 2) AS ctr_app
FROM events
WHERE timestamp >= '2022-01-01' 
  AND timestamp < '2023-01-01'
GROUP BY app_id;
