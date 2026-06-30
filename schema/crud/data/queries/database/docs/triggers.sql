-- ===========================
-- TRIGGERS
-- ===========================

-- Audit salary changes
CREATE TABLE salary_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    old_salary INT,
    new_salary INT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER trg_salary_update
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO salary_audit(employee_id, old_salary, new_salary)
        VALUES(OLD.employee_id, OLD.salary, NEW.salary);
    END IF;
END $$

DELIMITER ;