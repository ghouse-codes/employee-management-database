SELECT
    first_name,
    last_name,
    salary
FROM employee
WHERE salary > 60000;

SELECT
    first_name,
    salary
FROM employee
ORDER BY salary DESC;

SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees
FROM department d
LEFT JOIN employee e
ON d.department_id = e.department_id
GROUP BY d.department_name;

SELECT
    first_name,
    last_name,
    salary
FROM employee
ORDER BY salary DESC
LIMIT 1;


SELECT
    e.first_name,
    e.last_name,
    p.project_name
FROM employee e
JOIN employee_project ep
ON e.employee_id = ep.employee_id
JOIN project p
ON ep.project_id = p.project_id;

SELECT
    first_name,
    last_name
FROM employee
WHERE employee_id NOT IN
(
    SELECT employee_id
    FROM employee_project
);

SELECT
SUM(basic_salary) AS total_salary
FROM salary;

SELECT
AVG(basic_salary) AS average_salary
FROM salary;

SELECT
MAX(basic_salary) AS highest_salary
FROM salary;

SELECT
MIN(basic_salary) AS lowest_salary
FROM salary;

SELECT
first_name,
hire_date
FROM employee
WHERE hire_date > '2023-01-01';

SELECT
*
FROM leave_request
WHERE status='Pending';

SELECT
employee_id,
COUNT(*) AS attendance_days
FROM attendance
GROUP BY employee_id;


SELECT *
FROM project
WHERE status='In Progress';


SELECT
e.first_name,
s.basic_salary,
s.bonus,
s.deduction,
(s.basic_salary+s.bonus-s.deduction) AS net_salary
FROM employee e
JOIN salary s
ON e.employee_id=s.employee_id;
