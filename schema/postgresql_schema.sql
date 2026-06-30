-- ==========================================
-- Employee Management Database
-- PostgreSQL Schema
-- ==========================================

CREATE SCHEMA IF NOT EXISTS employee_management;

SET search_path TO employee_management;

DROP TABLE IF EXISTS employee_project CASCADE;
DROP TABLE IF EXISTS attendance CASCADE;
DROP TABLE IF EXISTS leave_request CASCADE;
DROP TABLE IF EXISTS salary CASCADE;
DROP TABLE IF EXISTS project CASCADE;
DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS department CASCADE;

CREATE TABLE department (

    department_id SERIAL PRIMARY KEY,

    department_name VARCHAR(100) UNIQUE NOT NULL,

    location VARCHAR(100) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE employee (

    employee_id SERIAL PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    email VARCHAR(100) UNIQUE NOT NULL,

    phone VARCHAR(15),

    hire_date DATE,

    job_title VARCHAR(100),

    salary DECIMAL(10,2),

    department_id INT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_department
    FOREIGN KEY(department_id)
    REFERENCES department(department_id)
);

CREATE TABLE project (

    project_id SERIAL PRIMARY KEY,

    project_name VARCHAR(100),

    start_date DATE,

    end_date DATE,

    budget DECIMAL(12,2),

    status VARCHAR(30)
);

CREATE TABLE employee_project (

    employee_id INT,

    project_id INT,

    assigned_date DATE,

    PRIMARY KEY(employee_id, project_id),

    FOREIGN KEY(employee_id)
        REFERENCES employee(employee_id),

    FOREIGN KEY(project_id)
        REFERENCES project(project_id)
);

CREATE TABLE attendance (

    attendance_id SERIAL PRIMARY KEY,

    employee_id INT,

    attendance_date DATE,

    check_in TIME,

    check_out TIME,

    status VARCHAR(20),

    FOREIGN KEY(employee_id)
        REFERENCES employee(employee_id)
);

CREATE TABLE leave_request (

    leave_id SERIAL PRIMARY KEY,

    employee_id INT,

    leave_type VARCHAR(50),

    start_date DATE,

    end_date DATE,

    reason VARCHAR(255),

    status VARCHAR(30),

    FOREIGN KEY(employee_id)
        REFERENCES employee(employee_id)
);

CREATE TABLE salary (

    salary_id SERIAL PRIMARY KEY,

    employee_id INT UNIQUE,

    basic_salary DECIMAL(10,2),

    bonus DECIMAL(10,2),

    deduction DECIMAL(10,2),

    payment_date DATE,

    FOREIGN KEY(employee_id)
        REFERENCES employee(employee_id)
);