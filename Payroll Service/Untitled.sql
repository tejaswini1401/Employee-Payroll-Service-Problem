CREATE DATABASE payroll_service;
show databases;
USE payroll_service;
SELECT DATABASE();
CREATE TABLE employee_payroll(
	id INT unsigned NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    salary Double NOT NULL,
    start Date NOT NULL,
    PRIMARY KEY (id)
);
INSERT INTO employee_payroll (name, salary, start) VALUES
("Teja", 500000, '2024-11-15'),
("Momo", 300000, '2024-07-15'),
("Sami", 400000, '2025-01-15');

SELECT * FROM employee_payroll;

SELECT salary FROM employee_payroll WHERE name = "Teja";

SELECT * FROM employee_payroll WHERE start BETWEEN CAST('2023-11-15' AS DATE) AND DATE(now());

ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;

describe employee_payroll;

SET SQL_SAFE_UPDATES = 0;
UPDATE employee_payroll SET gender = 'F' WHERE name = 'Teja';
UPDATE employee_payroll SET gender = 'F' WHERE name = 'Sami';
UPDATE employee_payroll SET gender = 'M' WHERE name = 'Momo';

SELECT * FROM employee_payroll;

SELECT AVG(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;

SELECT gender, AVG(salary) FROM employee_payroll GROUP BY gender;

SELECT gender, COUNT(salary) FROM employee_payroll GROUP BY gender;

SELECT gender, SUM(salary) FROM employee_payroll GROUP BY gender;

SELECT gender, MIN(salary) FROM employee_payroll GROUP BY gender;

SELECT gender, MAX(salary) FROM employee_payroll GROUP BY gender;

ALTER TABLE employee_payroll 
ADD COLUMN employee_phone VARCHAR(10),
ADD COLUMN employee_address VARCHAR(50) DEFAULT "Pune",
ADD COLUMN department VARCHAR(50) NOT NULL;

SELECT * FROM employee_payroll;

ALTER TABLE employee_payroll
ADD COLUMN basic_pay DECIMAL(15, 2),
ADD COLUMN deductions DECIMAL(15, 2),
ADD COLUMN taxable_pay DECIMAL(15, 2),
ADD COLUMN income_tax DECIMAL(15, 2),
ADD COLUMN net_pay DECIMAL(15, 2);

SELECT * FROM employee_payroll;

