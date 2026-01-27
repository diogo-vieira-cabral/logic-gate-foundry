/* 
PROBLEM 176: Second Highest Salary

BUSINESS CONTEXT: 
Identifying the second-tier compensation level for market benchmarking. 
Ensures accurate reporting even when multiple employees share the top salary.

TECHNICAL CHALLENGE: 
Scaling the logic beyond the 2nd rank. Subqueries become unreadable 
at N > 2; Window Functions provide a consistent, O(n) approach.
*/

WITH rankedsalaries AS (
    SELECT 
        salary, 
        DENSE_RANK() OVER (ORDER BY salary DESC) as rank
    FROM Employee
)
SELECT salary AS SecondHighestSalary
FROM rankedsalaries
WHERE rank = 2
LIMIT 1; -- Ensures a single result if the table has no duplicate 2nd place values