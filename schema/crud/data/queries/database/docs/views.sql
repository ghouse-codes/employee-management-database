SET SCHEMA employee_management;

-- ==========================================
-- Employee Details View
-- ==========================================

CREATE VIEW employee_details AS
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.job_title,
    e.salary,
    d.department_name
FROM employee e
JOIN department d
ON e.department_id = d.department_id;

-- ==========================================
-- Salary Details View
-- ==========================================

CREATE VIEW salary_details AS
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    s.basic_salary,
    s.bonus,
    s.deduction,
    (s.basic_salary + s.bonus - s.deduction) AS net_salary
FROM employee e
JOIN salary s
ON e.employee_id = s.employee_id;

-- ==========================================
-- Project Assignment View
-- ==========================================

CREATE VIEW project_assignments AS
SELECT
    e.employee_id,
    e.first_name,
    p.project_name,
    ep.assigned_date
FROM employee e
JOIN employee_project ep
ON e.employee_id = ep.employee_id
JOIN project p
ON ep.project_id = p.project_id;