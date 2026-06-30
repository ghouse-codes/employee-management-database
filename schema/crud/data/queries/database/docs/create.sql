-- ==========================================
-- CREATE OPERATIONS
-- ==========================================

-- ---------------------------
-- Insert a new department
-- ---------------------------

INSERT INTO department
(department_name, location)
VALUES
('Engineering', 'Bengaluru');


-- ---------------------------
-- Insert a new employee
-- ---------------------------

INSERT INTO employee
(
    first_name,
    last_name,
    email,
    phone,
    hire_date,
    job_title,
    salary,
    department_id
)
VALUES
(
    'John',
    'Doe',
    'john.doe@email.com',
    '9876543210',
    DATE '2026-06-29',
    'Software Engineer',
    60000,
    1
);


-- ---------------------------
-- Insert a new project
-- ---------------------------

INSERT INTO project
(
    project_name,
    start_date,
    end_date,
    budget,
    status
)
VALUES
(
    'Payroll System',
    DATE '2026-06-01',
    DATE '2026-12-31',
    300000,
    'Active'
);
