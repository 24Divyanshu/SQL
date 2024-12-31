CREATE DATABASE BankDB;
USE BankDB;

CREATE TABLE BankAccount(AccountID varchar(50) primary key,
AccountHolderName Varchar(50) Not Null,
AccountBalance decimal Not Null);

/*Task 1: Insert Data
Write an SQL INSERT statement to insert data into the BankAccount table.*/
-- QUERY --
INSERT INTO BankAccount (AccountID, AccountHolderName, AccountBalance) VALUES
('ACC001', 'John Smith', '1000.50'),
('ACC002', 'Jane Doe', '2500.75'),
('ACC003', 'Alice Brown', '500.00'),
('ACC004', 'Bob White', '3500.00');

/*Task 2: Retrieving Data
Write an SQL SELECT statement to retrieve the account_holder_name and
account_balance of all account holders from the BankAccount table.*/
-- QUERY --
SELECT AccountHolderName,AccountBalance FROM BankAccount;

/*ask 3: Filtering Data
Write an SQL SELECT statement to retrieve the account_holder_name and
account_balance where the account_balance is more than 30,000.*/
-- QUERY --
SELECT AccountHolderName,AccountBalance FROM BankAccount
WHERE AccountBalance >30000;

/*Task 4: Updating Data
Write an SQL UPDATE statement to change the account_balance of the account
holder whose ID is ACC001.*/
-- QUERY --
UPDATE BankAccount
SET AccountBalance = '4000'
WHERE AccountID = 'ACC001';
SELECT * FROM BankAccount;