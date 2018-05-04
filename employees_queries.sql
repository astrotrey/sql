-------------------------------------------
-- SQL Queries of the databased from  
-- the Linux 101 SQL Tutorial 
-------------------------------------------
USE employees;

-------------------------------------------
-- Queries executed by TM for the purpose of
-- practice, play, and curiosity
-------------------------------------------

-------------------------------------------
-- For each employee, return the employee id,
-- full name, and the total amount that their
-- salary has increased during their term of
-- employment. Limit output to five records.
-------------------------------------------
SELECT e.emp_no, e.last_name, e.first_name,
       MAX(s.salary)-MIN(s.salary) AS max_sal_min_sal
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 5;

-------------------------------------------
-- For employees whose salaries increased by
-- more than 20,000 currency units, return 
-- the employee id, full name, and the total 
-- amount that their salary has increased 
-- during their term of employment. Limit 
-- output to five records.
-------------------------------------------
SELECT e.emp_no, e.last_name, e.first_name,
       MAX(s.salary)-MIN(s.salary) AS max_sal_min_sal
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
GROUP BY e.emp_no
HAVING ((MAX(s.salary)-MIN(s.salary)) > 20000)
ORDER BY e.emp_no
LIMIT 5;

-------------------------------------------
-- For employees whose salaries increased by
-- more than 20,000 currency units, return 
-- the employee id, full name, and the total 
-- amount that their salary has increased 
-- during their term of employment. Sort by
-- their salary increase in descending order.
-- Limit output to five records.
-------------------------------------------
SELECT e.emp_no, e.last_name, e.first_name,
       MAX(s.salary)-MIN(s.salary) AS max_sal_min_sal
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
GROUP BY e.emp_no
HAVING ((MAX(s.salary)-MIN(s.salary)) > 20000)
ORDER BY (MAX(s.salary)-MIN(s.salary)) DESC
LIMIT 5;

-------------------------------------------
-- Return the total number of employees whose 
-- salaries increased by more than 
-- 20,000 currency units. 
-------------------------------------------
SELECT COUNT(subq.emp_no) AS '# employees with salary increase > 20,000'
FROM (
      SELECT emp_no, MAX(salary)-MIN(salary)
      FROM salaries
      GROUP BY emp_no
      HAVING ((MAX(salary)-MIN(salary)) > 20000)
     ) subq;

-------------------------------------------
-- Return the total number of employees whose 
-- salaries increased by 10,000 currency units
-- or more but less than (or equal to)
-- 20,000 currency units. 
-------------------------------------------
SELECT COUNT(subq.emp_no) AS '# employees with salary increase >= 10,000 and <= 20,000'
FROM (
      SELECT emp_no, MAX(salary)-MIN(salary)
      FROM salaries
      GROUP BY emp_no
      HAVING ((MAX(salary)-MIN(salary)) BETWEEN 10000 AND 20000)
     ) subq;
-------------------------------------------
-- Return the total number of employees whose 
-- salaries decreased by less than
-- 10,000 currency units. 
-------------------------------------------
SELECT COUNT(subq.emp_no) AS '# employees with salary increase < 10,000'
FROM (
      SELECT emp_no, MAX(salary)-MIN(salary)
      FROM salaries
      GROUP BY emp_no
      HAVING ((MAX(salary)-MIN(salary)) < 10000)
     ) subq;
