-- GOAL: Calculate the daily cancellation rate for trips involving only unbanned clients and drivers between 2013-10-01 and 2013-10-03.

-- BUSINESS CONTEXT: Identifying friction in the marketplace. High cancellation rates usually signal a mismatch in supply/demand or a UI/UX failure.

-- TECHNICAL NOTE: Could solve this with double joins, or a more complex subquery but CTEs ensure a straightforward logic and improve readability.

-- clean list of users to filter
WITH unbanned AS (
    SELECT users_id
    FROM Users
    WHERE banned = 'NO'
),
-- filter only unbanned user trips for requested date range
FilteredTrips AS (
    SELECT status, request_at
    FROM Trips
    WHERE client_id IN (SELECT users_id FROM unbanned)
    AND driver_id IN (SELECT users_id FROM unbanned)
    AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
)
-- do the math on the clean data
SELECT
    request_at AS Day,
    ROUND(SUM(IF(status != 'completed', 1, 0)) / COUNT(*), 2) AS 'Cancellation Rate'
FROM FilteredTrips
GROUP BY request_at;

/* BUSINESS RECOMMENDATION: Always filter dates and "blacklisted" entities as early as possible in the query to reduce the computational load on the warehouse. 
Using CTEs for "Unbanned" filters makes the code auditable. A business stakeholder can easily verify who was excluded before looking at the final rate. */