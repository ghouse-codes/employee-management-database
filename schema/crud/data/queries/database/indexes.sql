-- ===========================
-- INDEXES (FOR FAST QUERIES)
-- ===========================

CREATE INDEX idx_employee_email ON employee(email);
CREATE INDEX idx_employee_department ON employee(department_id);
CREATE INDEX idx_project_status ON project(status);
CREATE INDEX idx_attendance_date ON attendance(attendance_date);