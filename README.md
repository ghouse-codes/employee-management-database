🧑‍💼 Employee Management Database System


A relational SQL database for managing employees, departments, projects, attendance, leave, and salary records — built the way real HR and payroll backends are designed.



<p align="center">
Show Image
Show Image
Show Image
Show Image
Show Image

</p>

📌 Project Overview

The Employee Management Database System is a SQL-based relational database designed to model the core data layer of a real-world HR/payroll application. It manages employees, departments, project assignments, attendance, leave requests, and salary records.

Why this matters:

Real-world needHow this project addresses itHR teams need a single source of truth for employee dataCentralized Employee and Department tables with enforced relationshipsPayroll must be accurate and auditableDedicated Salary table tied 1:1/1:M to employeesCompanies need to track who's working on whatEmployee_Project many-to-many mapping tableAttendance and leave must be tracked per employeeAttendance and Leave_Request tables linked via foreign keysData must stay consistent as the org scalesSchema designed around normalization and referential integrity

Database design is the foundation of this project, not an afterthought — bad schema design is the single biggest cause of data inconsistency, slow queries, and broken reports in production HR systems. This project demonstrates how to avoid that through proper normalization, keys, and constraints.


🧠 Database Concepts Used

CRUD Operations

Standard Create, Read, Update, Delete operations are implemented for every core entity (employee, department, salary, attendance, leave).

sql-- Create
INSERT INTO Employee (first_name, last_name, dept_id, hire_date)
VALUES ('Ayesha', 'Khan', 2, '2024-03-15');

-- Read
SELECT * FROM Employee WHERE dept_id = 2;

-- Update
UPDATE Salary SET amount = 75000 WHERE emp_id = 101;

-- Delete
DELETE FROM Employee WHERE emp_id = 105;

Normalization (1NF → 3NF)


1NF — Every column holds a single atomic value (e.g., no comma-separated skills in one cell).
2NF — Non-key attributes depend on the whole primary key, eliminating partial dependency (relevant in the Employee_Project composite-key table).
3NF — No transitive dependencies; e.g., department name lives only in Department, not duplicated inside Employee.


Primary Key & Foreign Key Relationships

Every table has a surrogate primary key (*_id), and relationships are enforced through foreign keys — e.g., Employee.dept_id → Department.dept_id.

Joins


INNER JOIN to fetch only employees that have a matching department/salary record.
LEFT JOIN to include employees even when attendance or leave data is missing.


Indexing

Indexes are applied on frequently filtered/joined columns (dept_id, emp_id) to speed up lookups and reports as the dataset grows.

Constraints


NOT NULL on required fields like first_name, dept_id
UNIQUE on identifiers such as employee email
CHECK constraints for valid ranges (e.g., salary > 0)


Schema Design Principles


One responsibility per table
Minimal data duplication
Explicit relationships over implicit ones
Designed to scale from a single team to a multi-department organization



🛠️ Tech Stack

CategoryToolWhyDatabaseMySQL / PostgreSQLMature, ACID-compliant RDBMS suited for structured HR data with strict relational integrityQuery LanguageSQLIndustry-standard for relational data manipulation and reportingIDEVS CodeLightweight, extensible environment for writing and organizing SQL scriptsModelingER Diagram ToolVisualizes entity relationships before implementationVersion ControlGit & GitHubTracks schema evolution and enables collaborationOptionalDockerContainerized DB instance for consistent local development

Why a relational database? Employee data is inherently relational — employees belong to departments, are assigned to projects, and have salary/attendance histories tied to them by foreign keys. A relational model enforces this structure at the database level, preventing orphaned or inconsistent records that a NoSQL/document store would allow.


🏗️ Project Structure

employee-management-database/
│
├── schema/
│   ├── tables.sql            # Table definitions (DDL)
│   └── relationships.sql     # Foreign key constraints
│
├── crud/
│   └── crud_operations.sql   # Insert/Update/Delete/Select queries
│
├── data/
│   └── sample_data.sql       # Seed data for testing
│
├── ER-Diagram.png            # Entity-relationship diagram
├── .gitignore
└── README.md


🗄️ Database Schema Design

Core Tables / Modules

TableDescriptionDepartmentStores company departmentsEmployeeStores employee personal and employment detailsProjectStores project informationEmployee_ProjectMany-to-many mapping between employees and projectsAttendanceDaily/periodic attendance records per employeeLeave_RequestEmployee leave applications and statusesSalarySalary and compensation details per employee

Relationships

RelationshipCardinalityDepartment → EmployeeOne-to-ManyEmployee → AttendanceOne-to-ManyEmployee → SalaryOne-to-ManyEmployee ↔ ProjectMany-to-Many (via Employee_Project)Employee → Leave_RequestOne-to-Many

[Department] 1 ────────< Many [Employee]
                              │
              ┌───────────────┼────────────────┐
              │               │                │
        [Attendance]      [Salary]      [Leave_Request]
              │
       (M:M via Employee_Project)
              │
          [Project]


⚙️ Sample Queries (CRUD + Reports)

Insert a new employee

sqlINSERT INTO Employee (first_name, last_name, dept_id, hire_date, email)
VALUES ('Rahul', 'Mehta', 3, '2025-01-10', 'rahul.mehta@company.com');

Update an employee's salary

sqlUPDATE Salary
SET amount = amount + 5000
WHERE emp_id = 101;

Delete an employee record

sqlDELETE FROM Employee WHERE emp_id = 110;

Fetch all employees in a specific department

sqlSELECT e.emp_id, e.first_name, e.last_name, d.dept_name
FROM Employee e
INNER JOIN Department d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Engineering';

Departmental salary report (JOIN + aggregation)

sqlSELECT d.dept_name, COUNT(e.emp_id) AS total_employees, SUM(s.amount) AS total_payroll
FROM Department d
INNER JOIN Employee e ON d.dept_id = e.dept_id
INNER JOIN Salary s ON e.emp_id = s.emp_id
GROUP BY d.dept_name
ORDER BY total_payroll DESC;

Employees with no recorded attendance (LEFT JOIN)

sqlSELECT e.emp_id, e.first_name, e.last_name
FROM Employee e
LEFT JOIN Attendance a ON e.emp_id = a.emp_id
WHERE a.emp_id IS NULL;


🚀 CI/CD Pipeline (Database Project Style)

This project follows a database-oriented CI workflow using GitHub Actions:


On push to main → SQL files are linted for syntax errors
Schema validation → schema/tables.sql and schema/relationships.sql are executed against a fresh test database instance
Seed & test → data/sample_data.sql is loaded, followed by smoke-testing core queries from crud/crud_operations.sql
Version control strategy → feature branches for schema changes → pull request → review → merge to main


.github/workflows/ci.yml

yamlname: SQL CI
on: [push, pull_request]
jobs:
  validate-schema:
    runs-on: ubuntu-latest
    services:
      mysql:
        image: mysql:8
        env:
          MYSQL_ROOT_PASSWORD: root
        ports: ["3306:3306"]
    steps:
      - uses: actions/checkout@v4
      - name: Run schema scripts
        run: mysql -h 127.0.0.1 -uroot -proot < schema/tables.sql
      - name: Apply relationships
        run: mysql -h 127.0.0.1 -uroot -proot < schema/relationships.sql
      - name: Load sample data
        run: mysql -h 127.0.0.1 -uroot -proot < data/sample_data.sql


📊 Output / Demo

Running the schema and seed scripts produces a fully populated relational dataset. Example outputs:

Employee table view

emp_idfirst_namelast_namedept_idhire_date101AyeshaKhan22024-03-15102RahulMehta32025-01-10

Department report

dept_nametotal_employeestotal_payrollEngineering12960,000HR5320,000

Salary report

emp_idnameamount101Ayesha Khan75,000102Rahul Mehta68,000


📷 Database Diagram

Show Image


📌 Key Learnings / Skills Gained


Relational schema design from real-world requirements
Applying normalization (1NF–3NF) to eliminate redundancy
Designing and enforcing primary/foreign key relationships
Writing efficient JOIN-based reporting queries
Indexing strategy for query performance
Structuring a SQL project for collaboration and CI validation



🔮 Future Improvements


 Backend REST API (Spring Boot / Node.js + Express)
 Frontend admin dashboard for HR staff
 Role-based authentication & authorization
 Cloud database deployment (AWS RDS / Supabase)
 Automated payroll calculation module
 Stored procedures and triggers for audit logging



👨‍💻 Author

Ghouse


GitHub: @ghouse-codes
Project: employee-management-database


<p align="center">⭐ If you found this project useful, consider giving it a star!</p>


<p align="center">⭐ If you found this project useful, consider giving it a star!</p>
