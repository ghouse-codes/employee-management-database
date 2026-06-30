
-- ==========================================
-- DELETE OPERATIONS
-- ==========================================

-- Delete an attendance record
DELETE FROM attendance
WHERE attendance_id = 1;

-- Delete a leave request
DELETE FROM leave_request
WHERE leave_id = 1;

-- Delete a project assignment
DELETE FROM employee_project
WHERE employee_id = 1
AND project_id = 2;