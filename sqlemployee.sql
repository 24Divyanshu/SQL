CREATE database Employeedata;
USE Employeedata;

CREATE TABLE Employee (EmpID varchar(50) primary key,
FirstName varchar(50) Not Null,
LastName varchar(50) Not Null,
Age int Not Null,
Email varchar(50) Not Null);

/* Task 1: Insert Data
Write an SQL INSERT statement to insert data into the Employee table.*/
-- QUERY --
INSERT INTO Employee (EmpID, FirstName, LastName, Age, Email) VALUES
('EMP001', 'John', 'Smith', 30, 'john.smith@example.com'),
('EMP002', 'Jane', 'Doe', 28, 'jane.doe@example.com'),
('EMP003', 'Alice', 'Brown', 35, 'alice.brown@example.com'),
('EMP004', 'Bob', 'White', 40, 'bob.white@example.com');

/*ask 2: Retrieving Data
Write an SQL SELECT statement to retrieve the first_name and last_name of all
employees from the Employee table.*/
-- QUERY --
SELECT FirstName,LastName FROM Employee;

/*Task 3: Filtering Data
Write an SQL SELECT statement to retrieve the first_name, last_name, and age of
employees who are older than 30 years.*/
-- QUERY --
SELECT FirstName,LastName,Age FROM Employee
WHERE Age>30;

/*Task 4: Updating Data
Write an SQL UPDATE statement to increase the age of employees by 1 year for all
employees older than 25.*/
-- QUERY --
UPDATE Employee
SET Age = Age+1
WHERE Age>25;
SELECT * FROM Employee; 

/*Add two more columns in the Employee table named Salary and department and
add data into it*/
-- QUERY--
ALTER TABLE Employee
ADD COLUMN Salary decimal(10,2) ,
ADD COLUMN Department varchar(50);
SELECT*FROM Employee;
INSERT INTO Employee
(Salary, Department)VALUES
(50000.00, 'Sales'),
(60000.00, 'Marketing'),
(55000.00, 'HR'),
(45000.00, 'Finance'),
(70000.00, 'IT');

/*Due to a pricing adjustment, the company decided to increase the salary of all
employees by 10%. Create an SQL update query to apply this change selectively to
employees with a specific job title, say 'Manager.*/
-- QUERY --
UPDATE Employee
SET Salary = Salary * 1.10
WHERE JobTitle = 'Manager';
SELECT * FROM Employee WHERE JobTitle = 'Manager';

/*In an employee database, you want to retrieve information about
employees who belong to the "Sales" department and have a salary greater than
50,000.*/
-- QUERY--
SELECT *
FROM employees
WHERE department = 'Sales' AND salary > 50000;


/*An employee has resigned, and you need to remove their record from the
"employees" table. Write an SQL DELETE query for this.*/
-- QUERY--
DELETE FROM employees
WHERE employee_id = 1234;


/* You want to delete all orders placed before '2022-01-01' that are still in the
'Pending' status. Write an SQL DELETE query for this.*/
-- QUERY--
SELECT * FROM orders
WHERE order_date < '2022-01-01' AND status = 'Pending';
DELETE FROM orders
WHERE order_date < '2022-01-01' AND status = 'Pending';


/* Employees in the "Sales" department are getting a bonus, and you want to
add 1000 to the bonus column for all employees in that department. Write an SQL
UPDATE query for this.*/
-- QUERY--
UPDATE employees
SET bonus = bonus + 1000
WHERE department = 'Sales';

/*.Write a query to
retrieve all employees from the "employee" table who have a salary greater than 50000
and are in the 'IT' department*/
-- QUERY--
SELECT *
FROM employee
WHERE salary > 50000 AND department = 'IT';

/*The goal is to offer discounts on electronics
and include products with a price less than rs. 70,000 in the promotion.Write a query to
find products from the "product" table that are either in the 'Electronics' category or
have a
PRICE LESS THAN 70000*/
SELECT *
FROM product
WHERE category = 'Electronics' OR price < 70000;


/*.Write a query to Calculate the average salary of employee in each
department from the "employee" table.*/
SELECT department, AVG(salary) AS average_salary
FROM employee
GROUP BY department;








