show databases;
use sys;
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);
INSERT INTO employees (emp_name, department, salary, hire_date) VALUES
('Alice Johnson', 'HR', 50000, '2021-06-15'),
('Bob Smith', 'IT', 75000, '2020-09-25'),
('Charlie Brown', 'Finance', 68000, '2019-11-10'),
('David Miller', 'IT', 80000, '2018-04-20'),
('Eva Adams', 'Marketing', 62000, '2022-01-05'),
('Frank White', 'Finance', 70000, '2021-03-10'),
('Grace Taylor', 'HR', 55000, '2020-07-19'),
('Henry Wilson', 'IT', 85000, '2017-02-12'),
('Ivy Clark', 'Marketing', 58000, '2023-01-30'),
('Jake Turner', 'Finance', 72000, '2022-11-15');
CREATE TABLE random_employee_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    selection_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$

CREATE PROCEDURE call_random_employee(IN num_employees INT)
BEGIN
    -- Insert selected employees into the log table
    INSERT INTO random_employee_log (emp_id, emp_name, department, salary, hire_date)
    SELECT emp_id, emp_name, department, salary, hire_date 
    FROM employees 
    ORDER BY RAND() 
    LIMIT num_employees;

    -- Display the randomly selected employees
    SELECT * FROM random_employee_log ORDER BY selection_time DESC LIMIT num_employees;
END $$

DELIMITER ;
CALL call_random_employee(1);
CALL call_random_employee(3);
SELECT * FROM random_employee_log ORDER BY selection_time DESC;
