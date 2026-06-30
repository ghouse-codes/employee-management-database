-- ===========================
-- VIEWS (HR DASHBOARD LAYER)
-- ===========================

-- 1. Employee Full Details View
CREATE VIEW v_employee_details AS
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    e.job_title,
    e.salary,
    d.department_name,
    d.location
FROM employee e
JOIN department d ON e.department_id = d.department_id;


-- 2. Project Overview View
CREATE VIEW v_project_overview AS
SELECT
    p.project_id,
    p.project_name,
    p.start_date,
    p.end_date,
    p.status,
    d.department_name
FROM project p
JOIN department d ON p.department_id = d.department_id;


-- 3. Salary Report View
CREATE VIEW v_salary_report AS
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    s.basic_salary,
    s.bonus,
    s.deduction,
    (s.basic_salary + s.bonus - s.deduction) AS net_salary,
    s.payment_date
FROM salary s
JOIN employee e ON e.employee_id = s.employee_id;