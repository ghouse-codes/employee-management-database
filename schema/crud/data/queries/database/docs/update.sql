-- ==========================================
-- UPDATE OPERATIONS
-- ==========================================

-- Update employee salary
UPDATE employee
SET salary = 70000
WHERE employee_id = 1;

-- Update employee department
UPDATE employee
SET department_id = 3
WHERE employee_id = 1;

-- Update project status
UPDATE project
SET status = 'Completed'
WHERE project_id = 2;
