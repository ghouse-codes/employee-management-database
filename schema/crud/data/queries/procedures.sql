-- ===========================
-- STORED PROCEDURES
-- ===========================

-- Add new employee (safe insert)
DELIMITER $$

CREATE PROCEDURE add_employee (
    IN fname VARCHAR(50),
    IN lname VARCHAR(50),
    IN mail VARCHAR(100),
    IN ph VARCHAR(15),
    IN sal INT,
    IN dept INT
)
BEGIN
    INSERT INTO employee(first_name, last_name, email, phone, salary, department_id)
    VALUES(fname, lname, mail, ph, sal, dept);
END $$

DELIMITER ;