CREATE database StudentManagementSystem;
USE StudentManagementSystem;

CREATE table Students(StudentID varchar(50) Primary key Not Null, 
FirstName varchar(50) Not Null, 
LastName varchar(50) Not Null,
DateOfBirth date Not Null,
Gender char Not Null,
Email varchar(50) Not Null,
Phone int Not Null);


CREATE table Course(CourseID varchar(50) primary key Not Null,
CourseTitle varchar(50) Not Null,
Credits varchar(50) Not Null);


CREATE table Instructor(InstructorID varchar(50) primary key Not Null,
FirstName varchar(50) Not Null,
LastName varchar(50) Not Null,
Email varchar(50) Not Null);


CREATE table Enrollment(EnrollmentID varchar(50) primary key Not Null,
EnrollmentDate date Not Null,
StudentID varchar(50),
foreign key (StudentID) references Students(StudentID),
CourseID varchar(50),
foreign key (CourseID) references Course(CourseID),
InstructorID varchar(50),
foreign key (InstructorID) references Instructor(InstructorID));


Create table Score(ScoreID varchar(50) primary key Not Null,
CourseID varchar(50),
foreign key (CourseID) references Course(CourseID),
StudentID varchar(50),
foreign key (StudentID) references Students(StudentID),
DateOfExam date Not Null,
CreditObtained varchar(50) );


CREATE table Feedback(FeedbackID varchar(50) primary key,
 StudentID varchar(50),
foreign key (StudentID) references Students(StudentID),
Date date Not Null,
InstructorName varchar(50) Not Null,
Feedback varchar(50));


INSERT into Students(StudentID, FirstName, LastName, DateOfBirth, Gender, Email, Phone)
VALUE
('STU001', 'John', 'Doe', '2002-04-15', 'M', 'john.doe@example.com', 1234567),
('STU002', 'Jane', 'Smith', '2001-07-22', 'F', 'jane.smith@example.com', 9876540),
('STU003', 'Alice', 'Johnson', '2003-02-10', 'F', 'alice.j@example.com', 55512367),
('STU004', 'Bob', 'Lee', '2000-12-30', 'M', 'bob.lee@example.com', 44456901),
('STU005', 'Sarah', 'Kim', '2002-11-05', 'F', 'sarah.kim@example.com', 33301234);


INSERT INTO Course (CourseID, CourseTitle, Credits) VALUES
('CSE101', 'Introduction to CS', '3'),
('MATH201', 'Calculus II', '4'),
('PHY101', 'General Physics I', '3'),
('ENG101', 'English Composition', '3'),
('BIO101', 'Introduction to Biology', '4');


INSERT INTO Instructor (InstructorID, FirstName, LastName, Email) VALUES
('INS001', 'Alice', 'Brown', 'alice.brown@example.com'),
('INS002', 'John', 'Smith', 'john.smith@example.com'),
('INS003', 'Emma', 'Johnson', 'emma.johnson@example.com'),
('INS004', 'Robert', 'Lee', 'robert.Lee@example.com'),
('INS005', 'Sarah', 'Kim', 'sarah.kim@example.com');


INSERT INTO Enrollment (EnrollmentID, EnrollmentDate, StudentID, CourseID, InstructorID) VALUES
('ENR001', '2024-01-15', 'STU001', 'CSE101', 'INS001'),
('ENR002', '2024-01-16', 'STU002', 'MATH201', 'INS002'),
('ENR003', '2024-01-17', 'STU003', 'PHY101', 'INS003'),
('ENR004', '2024-01-18', 'STU004', 'ENG101', 'INS004'),
('ENR005', '2024-01-19', 'STU005', 'BIO101', 'INS005');


INSERT INTO Score (ScoreID, CourseID, StudentID, DateOfExam, CreditObtained) VALUES
('SCR001', 'CSE101', 'STU001', '2024-03-15', '3'),
('SCR002', 'MATH201', 'STU002', '2024-03-16', '4'),
('SCR003', 'PHY101', 'STU003', '2024-03-17', '2'),
('SCR004', 'ENG101', 'STU004', '2024-03-18', '3'),
('SCR005', 'BIO101', 'STU005', '2024-03-19', '4');


INSERT INTO Feedback (FeedbackID, StudentID, Date, InstructorName, Feedback) VALUES
('FB001', 'STU001', '2024-02-01', 'Alice Brown', 'Excellent teaching'),
('FB002', 'STU002', '2024-02-02', 'John Smith', 'Very helpful guidance'),
('FB003', 'STU003', '2024-02-03', 'Emma Johnson', 'Needs to slow down a bit'),
('FB004', 'STU004', '2024-02-04', 'Robert Lee', 'Great explanations'),
('FB005', 'STU005', '2024-02-05', 'Sarah Kim', 'Very supportive');

select * from Students;
select * from Course;
select * from Instructor;
select * from Enrollment;
select * from Score;
select * from Feedback;


/*Task 1: Update the Student table with the following information:
Change the email to 'jane_Smith@example.com'
Where FirstName is 'Jane' and LastName is 'Smith';*/
-- QUERY --
UPDATE Students
SET email = 'jane_Smith@example.com'
WHERE FirstName = 'Jane' AND LastName = 'Smith';
select * from students;

/*Update the Instructor with the following information:
Change the email to 'robert_Lee@example.com'
Where FirstName of the instructor is 'Robert' and LastName is 'Lee';*/
-- QUERY --
UPDATE Instructor
SET email = 'robert_Lee@example.com'
WHERE FirstName = 'Robert' AND LastName = 'Lee';
select * from Instructor;

/*Delete record from the Student table on following condition:
Delete student/students records from the Student table where last name is Smith.*/
-- QUERY --
DELETE FROM Enrollment
WHERE StudentID IN (SELECT StudentID FROM Students WHERE LastName = 'Smith');
DELETE FROM Feedback
WHERE StudentID IN (SELECT StudentID FROM Students WHERE LastName='Smith');
DELETE FROM Score
WHERE StudentID IN (SELECT StudentID FROM Students WHERE LastName='Smith');
DELETE from Students
WHERE LastName = 'Smith';
select*from Students;

-- List the student whose first name starts with J.--
-- QUERY --
SELECT * FROM Students WHERE FirstName LIKE 'J%';


/* Let's consider a scenario where you want to retrieve information about students
from a database table named student and display the results in ascending order based
on their last names*/
-- QUERY--
SELECT * FROM Students
ORDER BY LastName ASC;

/* Let's consider a scenario where you want to count the number of students based
on their gender from a database table named Student.*/
-- QUERY--
SELECT Gender, COUNT(*) AS Student_Count
FROM Students
GROUP BY Gender;

/*you need to
retrieve information about students born after June 16, 2009. What will be the sql query*/
-- QUERY--
SELECT *
FROM students
WHERE DateOfBirth > '2009-06-16';

/* You want to retrieve records of students
whose first names start with either 'A' or 'J'. To achieve this,what will be your sql query?*/
-- QUERY --
SELECT * FROM Students
WHERE FirstName LIKE 'A%' OR FirstName LIKE 'J%' ;

/*You want to retrieve records of students whose first name is not 'Alice' and whose email
addresses contain the domain '@example.com'. To achieve this, what will be your sql
query?*/
-- QUERY --
SELECT * FROM Students 
WHERE FirstName != 'Alice' AND Email LIKE '@example.com';

/* Create a table Person with PersonID int, FirstName varchar(255),
LastName varchar(255) and age (int).
Make PersonID PRIMARY KEY.*/
-- QUERY--
CREATE TABLE Person 
(PersonID int primary key,
FirstName varchar(255),
Age int);
 
 
 /*Create a table Employee with emp_id int, first_name varchar(255),
last_name varchar(255) and age (int )
Make emp_id PRIMARY KEY.*/
-- QUERY--
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    age INT);

/*: Insert data to Person table
 Insert data to Employee table*/
 -- QUERY--
 INSERT INTO Person (PersonID, FirstName, Age) VALUES
 ('1', 'Alice', '25'),
 ('2', 'Bob', '30'),
('3', 'Charlie', '35'),
('4', 'Diana', '28'),
('5', 'Ethan', '40');

INSERT INTO Employee (emp_id, first_name, last_name, age) VALUES (1, 'John', 'Doe', 30);
INSERT INTO Employee (emp_id, first_name, last_name, age) VALUES (2, 'Jane', 'Smith', 25);
INSERT INTO Employee (emp_id, first_name, last_name, age) VALUES (3, 'Robert', 'Brown', 40);
INSERT INTO Employee (emp_id, first_name, last_name, age) VALUES (4, 'Emily', 'Davis', 35);
INSERT INTO Employee (emp_id, first_name, last_name, age) VALUES (5, 'Michael', 'Wilson', 50);


/*find the courses where the average grade is below a 'C' (consider 'C' as a passing grade).
We have a "Course" table with the following columns:
CourseId,CourseName,CreditHours and
"Grade" table*/
-- QUERY--
ALTER TABLE Course 
ADD COLUMN Grades varchar(50);
INSERT INTO Grades VALUES
('A'),
('C'),
('B'),
('B'),
('C');




 































