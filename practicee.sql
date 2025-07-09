-- View all data
SELECT *
FROM employee_demographics
;


-- View all data
SELECT *
FROM employee_salary
;


-- Select specific columns
SELECT employee_id, age
FROM employee_demographics
;


-- Use aliases
SELECT first_name AS f_name
FROM employee_demographics
;


-- Employees older than 40
SELECT *
FROM employee_demographics
WHERE age > 40
;


-- Gender-based filtering
SELECT *
FROM employee_demographics
WHERE gender = 'Female'
;

-- Name-based filter
SELECT *
FROM employee_demographics
WHERE first_name = 'TOM'
;


-- Sort by salary (high to low)
SELECT *
FROM employee_salary
ORDER BY salary DESC
;


-- Unique occupations
SELECT DISTINCT occupation
FROM employee_salary
;


-- top 3 highest paid
SELECT *
FROM employee_salary
ORDER BY salary DESC LIMIT 3;


-- Average salary
SELECT AVG(salary) 
FROM employee_salary
;


-- Count of employees
SELECT COUNT(*)
FROM employee_demographics
;


-- Max & Min salary
SELECT MAX(salary), MIN(salary)
FROM employee_salary;


-- Average salary per occupation
SELECT occupation, AVG(salary)
FROM employee_salary
GROUP BY occupation
;


-- Count by gender
SELECT gender, 
COUNT(*) FROM employee_demographics
GROUP BY gender;


-- Occupations with avg salary > 50000
SELECT occupation, AVG(salary)
FROM employee_salary
GROUP BY occupation
HAVING AVG(salary) > 50000;


-- INNER JOIN employee_salary and demographics
SELECT d.first_name, d.last_name, s.occupation, s.salary
FROM employee_demographics d
JOIN employee_salary s ON d.employee_id = s.employee_id;


-- LEFT JOIN to include all from demographics
SELECT d.first_name, s.salary
FROM employee_demographics d
LEFT JOIN employee_salary s ON d.employee_id = s.employee_id;


-- Employees earning above average
SELECT first_name, salary
FROM employee_salary
WHERE salary > (SELECT AVG(salary) fROM employee_salary);


-- Salary grade
SELECT first_name, salary, 
CASE
WHEN salary > 50000 then 'High'
WHEN salary < 50000 then 'Medium'
ELSE 'Low'
END AS salary_grade
FROM employee_salary
;


-- Group By
SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

-- ORDER BY
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age                                    -- ASC DESC
;


-- WHERE and HAVING
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > '75000' 
;

-- LIMIT 
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

-- ALIASING
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;

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
     
