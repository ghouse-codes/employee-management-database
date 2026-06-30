
-- ==========================================
-- READ OPERATIONS
-- ==========================================

-- 1. Retrieve all employees
SELECT * FROM employee;

-- 2. Retrieve employees with department names
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.job_title,
    e.salary,
    d.department_name
FROM employee e
LEFT JOIN department d
ON e.department_id = d.department_id;

-- 3. Retrieve all projects
SELECT * FROM project;

-- 4. Retrieve salary information
SELECT
    e.first_name,
    e.last_name,
    s.basic_salary,
    s.bonus,
    s.deduction,
    (s.basic_salary + s.bonus - s.deduction) AS net_salary
FROM employee e
JOIN salary s
ON e.employee_id = s.employee_id;