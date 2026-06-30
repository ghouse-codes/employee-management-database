-- ==========================================
-- Employee Management Database
-- H2 Database Schema
-- ==========================================

CREATE SCHEMA IF NOT EXISTS employee_management;
SET SCHEMA employee_management;

DROP TABLE IF EXISTS employee_project;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS leave_request;
DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

-- ===========================
-- Department
-- ===========================

CREATE TABLE department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ===========================
-- Employee
-- ===========================

CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    hire_date DATE NOT NULL,
    job_title VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_department
        FOREIGN KEY (department_id)
        REFERENCES department(department_id)
);

-- ===========================
-- Project
-- ===========================

CREATE TABLE project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12,2),
    status VARCHAR(30)
);

-- ===========================
-- Employee Project
-- ===========================

CREATE TABLE employee_project (
    employee_id INT,
    project_id INT,
    assigned_date DATE,

    PRIMARY KEY (employee_id, project_id),

    CONSTRAINT fk_emp_project_employee
        FOREIGN KEY (employee_id)
        REFERENCES employee(employee_id),

    CONSTRAINT fk_emp_project_project
        FOREIGN KEY (project_id)
        REFERENCES project(project_id)
);

-- ===========================
-- Attendance
-- ===========================

CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    attendance_date DATE,
    check_in TIME,
    check_out TIME,
    status VARCHAR(20),

    CONSTRAINT fk_attendance_employee
        FOREIGN KEY (employee_id)
        REFERENCES employee(employee_id)
);

-- ===========================
-- Leave Request
-- ===========================

CREATE TABLE leave_request (
    leave_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    leave_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    reason VARCHAR(255),
    status VARCHAR(30),

    CONSTRAINT fk_leave_employee
        FOREIGN KEY (employee_id)
        REFERENCES employee(employee_id)
);

-- ===========================
-- Salary
-- ===========================

CREATE TABLE salary (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT UNIQUE,
    basic_salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    deduction DECIMAL(10,2),
    payment_date DATE,

    CONSTRAINT fk_salary_employee
        FOREIGN KEY (employee_id)
        REFERENCES employee(employee_id)
);
