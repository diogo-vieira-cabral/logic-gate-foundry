/*
PROBLEM: Nth Highest Salary

BUSINESS CONTEXT: 
A luxury jewelry brand needs to identify the Nth percentile of spenders 
to trigger exclusive marketing workflows without manual data exports.

TECHNICAL CHALLENGE: 
Encapsulating logic into a reusable UDF (user_defined_function) while handling zero-based indexing 
and NULL results for empty datasets.
*/

  -- 1. Adjust N for zero-based indexing. 
  -- SQL offsets start at 0, not 1. If we want the 2nd highest salary, we need to "skip" 1, hence (N-1). 

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N = N - 1;
  
RETURN (
      -- 2. Logic to sort and pick the single Nth row
      SELECT DISTINCT salary 
      FROM Employee 
      ORDER BY salary DESC
      LIMIT 1 OFFSET N
  );
END