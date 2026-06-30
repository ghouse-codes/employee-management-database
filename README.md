# Employee Management Database System

## 📌 Project Overview
This project is a SQL-based Employee Management System built in VS Code.  
It manages employees, departments, projects, attendance, leave requests, and salary details using relational database concepts.

---

## 🛠 Tools Used
- VS Code
- SQL (MySQL / PostgreSQL)
- ER Diagram Tool

---

## 📂 Project Structure
employee-management-db/
│
├── schema/
├── crud/
├── data/
├── ER-Diagram.png
├── README.md
├── .gitignore

---

## 🧩 Database Modules

- Department → Stores company departments  
- Employee → Stores employee details  
- Project → Stores project information  
- Employee_Project → Many-to-many mapping  
- Attendance → Employee attendance records  
- Leave_Request → Employee leave tracking  
- Salary → Salary details

---

## 🔗 Relationships

- Department → Employee (1:M)
- Employee → Attendance (1:M)
- Employee → Salary (1:M)
- Employee ↔ Project (M:M)

---

## 🚀 How to Run

1. Create database:
```sql
CREATE DATABASE employee_management;
USE employee_management;