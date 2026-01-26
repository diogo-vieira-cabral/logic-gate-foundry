/* 
PROBLEM: Second Highest Salary 

TECHNICAL CHALLENGE: 
Handling 'Empty' results. If the table has fewer than 2 distinct salaries, 
the query must return NULL, not an error. The Subquery method handles this 
natively via the MAX() function's behavior on empty sets.

DEBUG:
❌ v1: OFFSET skips ROWS not values  
❌ v2: DISTINCT MAX → highest salary
✅ v3: Subquery < MAX(salary)
*/

SELECT MAX(salary) AS SecondHighestSalary
FROM Employee 
WHERE salary < (SELECT MAX(salary) FROM Employee);

