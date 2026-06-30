-- ===========================
-- PRIMARY & FOREIGN KEYS
-- ===========================

-- Department
ALTER TABLE department
ADD PRIMARY KEY (department_id);

-- Employee
ALTER TABLE employee
ADD PRIMARY KEY (employee_id),
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (department_id)
REFERENCES department(department_id)
ON DELETE SET NULL;

-- Project
ALTER TABLE project
ADD PRIMARY KEY (project_id),
ADD CONSTRAINT fk_project_department
FOREIGN KEY (department_id)
REFERENCES department(department_id)
ON DELETE CASCADE;

-- Attendance
ALTER TABLE attendance
ADD PRIMARY KEY (attendance_id),
ADD CONSTRAINT fk_attendance_employee
FOREIGN KEY (employee_id)
REFERENCES employee(employee_id)
ON DELETE CASCADE;

-- Leave Request
ALTER TABLE leave_request
ADD PRIMARY KEY (leave_id),
ADD CONSTRAINT fk_leave_employee
FOREIGN KEY (employee_id)
REFERENCES employee(employee_id)
ON DELETE CASCADE;

-- Project Assignment
ALTER TABLE project_assignment
ADD PRIMARY KEY (assignment_id),
ADD CONSTRAINT fk_assignment_employee
FOREIGN KEY (employee_id)
REFERENCES employee(employee_id)
ON DELETE CASCADE,
ADD CONSTRAINT fk_assignment_project
FOREIGN KEY (project_id)
REFERENCES project(project_id)
ON DELETE CASCADE;