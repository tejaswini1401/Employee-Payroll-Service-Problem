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

