/*Please add ; after each select statement*/
CREATE PROCEDURE salaryDifference()
BEGIN
    SELECT 
    MAX(salary), MIN(salary) -- , COUNT(MAX(salary)), COUNT(MIN(salary)) 
    -- , COUNT(DISTINCT MAX(salary)), COUNT(DISTINCT MIN(salary)) 
    INTO @maxSalary, @minSalary -- , @countMax, @countMin 
    FROM employees;
    
    SELECT 
        COUNT(*)
    INTO @countMax
    FROM employees
    WHERE salary = @maxSalary;
    
    SELECT 
        COUNT(*) 
    INTO @countMin 
    FROM employees
    WHERE salary = @minSalary;
    
    SELECT 
    CASE WHEN @maxSalary IS NULL THEN 0 ELSE @maxSalary END,
    CASE WHEN @minSalary IS NULL THEN 0 ELSE @minSalary END 
    INTO @maxSalary, @minSalary;
    
    SELECT ((@maxSalary*@countMax) - (@minSalary*@countMin)) as difference;
    -- SELECT @maxSalary, @minSalary, @countMax, @countMin as difference;
END