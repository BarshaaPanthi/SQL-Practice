-- INNER JOINS
SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;

SELECT dem.employee_id, age, occupation
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
ON dem.employee_id = sal.employee_id
 ;
 
 -- OUTER JOINS
 SELECT dem.employee_id, age, occupation
FROM parks_and_recreation.employee_demographics AS dem
LEFT JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
 ;
 
 -- SELF JOIN
 SELECT *
 FROM employee_salary emp1
 JOIN employee_salary emp2
     ON emp1.employee_id = emp2.employee_id 
     ;
     
