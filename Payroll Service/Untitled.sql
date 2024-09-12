CREATE DATABASE payroll_service;
show databases;
USE payroll_service;
SELECT DATABASE();
CREATE TABLE Employee(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    salary Double NOT NULL,
    start Date NOT NULL,
    PRIMARY KEY (id)
);
INSERT INTO Employee (name, salary, start) VALUES
("Teja", 500000, '2024-11-15'),
("Momo", 300000, '2024-07-15'),
("Sami", 400000, '2025-01-15');

SELECT * FROM Employee;

SELECT salary FROM Employee WHERE name = "Teja";

SELECT * FROM Employee WHERE start BETWEEN CAST('2023-11-15' AS DATE) AND DATE(now());

ALTER TABLE Employee ADD gender CHAR(1) AFTER name;

describe Employee;

SET SQL_SAFE_UPDATES = 0;
UPDATE Employee SET gender = 'F' WHERE name = 'Teja';
UPDATE Employee SET gender = 'F' WHERE name = 'Sami';
UPDATE Employee SET gender = 'M' WHERE name = 'Momo';

SELECT * FROM Employee;

SELECT AVG(salary) FROM Employee WHERE gender = 'F' GROUP BY gender;

SELECT gender, AVG(salary) FROM Employee GROUP BY gender;

SELECT gender, COUNT(salary) FROM Employee GROUP BY gender;

SELECT gender, SUM(salary) FROM Employee GROUP BY gender;

SELECT gender, MIN(salary) FROM Employee GROUP BY gender;

SELECT gender, MAX(salary) FROM Employee GROUP BY gender;

ALTER TABLE Employee
ADD COLUMN employee_phone VARCHAR(10),
ADD COLUMN employee_address VARCHAR(50) DEFAULT "Pune",
ADD COLUMN department VARCHAR(50) NOT NULL;

SELECT * FROM Employee;

CREATE TABLE Payroll (
    payroll_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    employee_id INT UNSIGNED NOT NULL,
    basic_pay DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    deductions DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    taxable_pay DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    income_tax DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    net_pay DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (payroll_id),
    FOREIGN KEY (employee_id) REFERENCES employee_payroll(id)
);


SELECT * FROM Payroll;

ALTER TABLE Employee
MODIFY salary DECIMAL(10,2) DEFAULT 0.00,
ALTER COLUMN start SET DEFAULT '2024-01-01';

UPDATE Employee
SET department = "Sales"
WHERE name = "Teressa";

SELECT * FROM employee_payroll 	WHERE name = "Teressa"; 

CREATE TABLE departments(
department_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
department_name VARCHAR(50) NOT NULL
);

INSERT INTO departments (department_name) VALUES
('HR'),
('Engineering'),
('Marketing'),
('Sales');
DROP TABLE departments;

CREATE TABLE employee_department (
    employee_id INT UNSIGNED NOT NULL,
    department_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (employee_id, department_id),
    FOREIGN KEY (employee_id) REFERENCES employee_payroll(id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employee_department (employee_id, department_id) VALUES
((SELECT id FROM employee_payroll WHERE name = 'Teja'), (SELECT department_id FROM departments WHERE department_name = 'Engineering')),
((SELECT id FROM employee_payroll WHERE name = 'Momo'), (SELECT department_id FROM departments WHERE department_name = 'Marketing')),
((SELECT id FROM employee_payroll WHERE name = 'Sami'), (SELECT department_id FROM departments WHERE department_name = 'HR'));

SELECT 
    d.department_name AS Department_Name,
    e.name AS Employee_Name
FROM 
    departments d
JOIN 
    employee_department ed ON d.department_id = ed.department_id
JOIN 
    employee_payroll e ON ed.employee_id = e.id;
