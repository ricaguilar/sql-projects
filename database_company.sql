CREATE TABLE employee (
	emp_id INT,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE,
    sex CHAR(1),
    salary INT,
    super_id INT,
    branch_id INT,
    PRIMARY KEY(emp_id)
);

SELECT * FROM employee;
SELECT * FROM branch;
DROP TABLE employee;

CREATE TABLE branch (
	branch_id INT,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
	PRIMARY KEY(branch_id),
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id) ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id) ON DELETE SET NULL;

CREATE TABLE client (
	client_id INT,
    client_name VARCHAR(40),
    branch_id INT,
    PRIMARY KEY(client_id),
	FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
	emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY(emp_id, client_id),
	FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
	branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
	FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

-- INSERTING DATA IN THE TABLES

-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee SET branch_id = 1 WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'M', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee SET branch_id = 2 WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2),
(104, 'Kelly', 'Kapoor', '1980-02-15', 'F', 55000, 102, 2),
(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

SELECT * FROM employee;

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee SET branch_id = 3 WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3),
	(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper'),
	(2, 'Uni-Ball', 'Writing Utensils'),
	(2, 'Uni-Ball', 'Writing Utensils'),
	(3, 'Patriot Paper', 'Paper'),
	(2, 'J.T. Forms & Labels', 'Custom Forms'),
	(3, 'Uni-Ball', 'Writing Utensils'),
	(3, 'Hammer Mill', 'Paper'),
	(3, 'Stamford Lables', 'Custom Forms');

SELECT * FROM branch_supplier;

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2),
	(401, 'Lackawana Country', 2),
	(402, 'FedEx', 3),
	(403, 'John Daly Law, LLC', 3),
	(404, 'Scranton Whitepages', 2),
	(405, 'Times Newspaper', 3),
	(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000),
	(102, 401, 267000),
	(108, 402, 22500),
	(107, 403, 5000),
	(108, 403, 12000),
	(105, 404, 33000),
	(107, 405, 26000),
	(102, 406, 15000),
	(105, 406, 130000);

UPDATE branch_supplier SET supplier_name = 'Stamford Labels' WHERE supplier_name = 'Stamford Lables';

-- What is the maximum and average salary of the employees?
-- Round to two decimals the average salary
SELECT MAX(salary) AS max_salary
FROM example.employee;

SELECT ROUND(AVG(salary), 2) AS average_salary
FROM example.employee;

ALTER TABLE employee 
ADD COLUMN job_title VARCHAR(40);

SELECT * FROM employee;

UPDATE employee SET job_title = 'Salesman' WHERE emp_id IN (108, 107, 106, 105);
UPDATE employee SET job_title = 'Accountant' WHERE emp_id IN (103);
UPDATE employee SET job_title = 'Regional Manager' WHERE emp_id IN (102);
UPDATE employee SET job_title = 'Receptionist' WHERE emp_id IN (104);
UPDATE employee SET job_title = 'Finance Manager' WHERE emp_id IN (101);

-- What if we want to raise recepcionist salary? lets raise 5%
SELECT first_name, last_name, job_title, salary,
CASE
	WHEN job_title = 'Receptionist' THEN salary + (salary * .05)
END AS salary_after_raise
FROM employee;

CREATE TABLE employee_errors (
	emp_id VARCHAR(50),
    first_name VARCHAR(40),
    last_name VARCHAR(40)
);

INSERT INTO employee_errors VALUES
	('1001 ', 'Jimbo', 'Halbert'),
    (' 1002', 'Pamela', 'Beasely'),
    ('1005', 'TOby', 'Flenderson - Fired');
    
SELECT * FROM employee_errors;
DROP TABLE employee_errors;

-- The table created above has errors. Use Trim, LTRIM and RTRIM
SELECT emp_id, TRIM(emp_id) AS IDTRIM
FROM employee_errors;

SELECT emp_id, LTRIM(emp_id) AS IDTRIM
FROM employee_errors;

SELECT emp_id, RTRIM(emp_id) AS IDTRIM
FROM employee_errors;

-- Use Replace
SELECT last_name, REPLACE(last_name, '- Fired', '') as last_name_fixed
FROM employee_errors;

-- Use Upper and Lower
SELECT first_name, LOWER(first_name)
FROM employee_errors;

SELECT first_name, UPPER(first_name)
FROM employee_errors;

--------

select sum(salary) as total_salary from employee;

select emp_id, sum(salary) as total_salary 
from employee
group by emp_id;

select avg(salary) as average_salary from employee;
select max(salary) as average_salary from employee;
select max(salary) as average_salary from employee;

select first_name, salary, rank() over(order by salary desc)as ranks from employee;
select first_name, salary, row_number() over(order by birth_day)as num_fila from employee;
select first_name, salary, dense_rank() over(order by salary desc)as dense_ranks from employee;

describe employee;

select date_format(birth_day, '%d-%m-%y') as date_value
from employee;

alter table employee rename column birth_day to birth_date;
drop view fullname_employee;

create view fullname_employee as
select emp_id, first_name, last_name, birth_date, concat(first_name,' ',last_name) as full_name,
salary
from employee;

select * from fullname_employee;
use example;

-- Take the first name out of the full name
select substring_index(full_name,' ',1) as fname 
from fullname_employee;

