
-- ==========================================
-- Employee Management Database
-- Sample Data
-- ==========================================

SET SCHEMA employee_management;

-- ===========================
-- Department
-- ===========================

INSERT INTO department (department_name, location)
VALUES
('Human Resources', 'Hyderabad'),
('Information Technology', 'Bengaluru'),
('Finance', 'Mumbai'),
('Sales', 'Delhi'),
('Marketing', 'Chennai');

-- ===========================
-- Employee
-- ===========================

INSERT INTO employee
(first_name, last_name, email, phone, hire_date, job_title, salary, department_id)
VALUES
('Rahul','Sharma','rahul.sharma@company.com','9876500001','2023-01-10','Software Engineer',65000,2),
('Priya','Reddy','priya.reddy@company.com','9876500002','2022-05-15','HR Executive',45000,1),
('Amit','Patel','amit.patel@company.com','9876500003','2021-03-20','Accountant',55000,3),
('Sneha','Verma','sneha.verma@company.com','9876500004','2020-08-18','Marketing Executive',50000,5),
('Arjun','Kumar','arjun.kumar@company.com','9876500005','2024-02-01','Sales Executive',48000,4),
('Neha','Singh','neha.singh@company.com','9876500006','2023-09-12','Backend Developer',75000,2),
('Rohan','Das','rohan.das@company.com','9876500007','2021-11-21','Frontend Developer',70000,2),
('Anjali','Joshi','anjali.joshi@company.com','9876500008','2022-07-30','UI Designer',60000,2),
('Vikram','Mehta','vikram.mehta@company.com','9876500009','2020-12-12','Finance Manager',90000,3),
('Kiran','Naik','kiran.naik@company.com','9876500010','2024-01-15','HR Manager',80000,1);

-- ===========================
-- Project
-- ===========================

INSERT INTO project
(project_name, start_date, end_date, budget, status)
VALUES
('HR Portal','2025-01-01','2025-06-30',200000,'Completed'),
('E-Commerce Website','2025-02-01','2025-12-31',900000,'In Progress'),
('Payroll System','2025-03-01','2025-08-30',350000,'In Progress'),
('CRM Platform','2025-04-15','2025-10-31',450000,'Planning'),
('Inventory System','2025-05-01','2025-11-30',500000,'Planning');

-- ===========================
-- Employee Project
-- ===========================

INSERT INTO employee_project
(employee_id, project_id, assigned_date)
VALUES
(1,2,'2025-02-01'),
(6,2,'2025-02-01'),
(7,2,'2025-02-01'),
(8,2,'2025-02-01'),
(2,1,'2025-01-05'),
(3,3,'2025-03-05'),
(5,4,'2025-04-20'),
(9,3,'2025-03-05'),
(10,1,'2025-01-05');

-- ===========================
-- Attendance
-- ===========================

INSERT INTO attendance
(employee_id, attendance_date, check_in, check_out, status)
VALUES
(1,'2025-06-01','09:00:00','18:00:00','Present'),
(2,'2025-06-01','09:10:00','18:05:00','Present'),
(3,'2025-06-01','09:05:00','18:00:00','Present'),
(4,'2025-06-01','09:20:00','18:15:00','Present'),
(5,'2025-06-01','09:00:00','17:45:00','Present'),
(6,'2025-06-01','09:30:00','18:30:00','Present'),
(7,'2025-06-01','09:00:00','18:00:00','Present'),
(8,'2025-06-01','09:15:00','18:10:00','Present'),
(9,'2025-06-01','09:00:00','18:00:00','Present'),
(10,'2025-06-01','09:05:00','18:00:00','Present');

-- ===========================
-- Leave Request
-- ===========================

INSERT INTO leave_request
(employee_id, leave_type, start_date, end_date, reason, status)
VALUES
(2,'Casual Leave','2025-07-01','2025-07-03','Personal Work','Approved'),
(4,'Sick Leave','2025-07-10','2025-07-12','Fever','Approved'),
(6,'Vacation','2025-08-01','2025-08-05','Family Trip','Pending'),
(8,'Casual Leave','2025-09-02','2025-09-03','Festival','Approved');

-- ===========================
-- Salary
-- ===========================

INSERT INTO salary
(employee_id, basic_salary, bonus, deduction, payment_date)
VALUES
(1,65000,5000,1000,'2025-06-30'),
(2,45000,3000,500,'2025-06-30'),
(3,55000,4000,750,'2025-06-30'),
(4,50000,3500,500,'2025-06-30'),
(5,48000,2000,500,'2025-06-30'),
(6,75000,6000,1500,'2025-06-30'),
(7,70000,5500,1200,'2025-06-30'),
(8,60000,4500,900,'2025-06-30'),
(9,90000,8000,2000,'2025-06-30'),
(10,80000,7000,1800,'2025-06-30');