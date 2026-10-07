-- ============================================================
-- EXPERIMENT 8: CASE STUDY – STUDENT INFORMATION SYSTEM
-- DBMS: MySQL
-- ============================================================

-- 1. CREATE DATABASE
CREATE DATABASE StudentDB;
USE StudentDB;


-- ============================================================
-- 2. CREATE TABLES
-- ============================================================

-- Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Address VARCHAR(200)
);

-- Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    Capacity INT NOT NULL
);

-- Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Grade VARCHAR(5),
    Status VARCHAR(20),

    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- ============================================================
-- 3. INSERT AT LEAST FIVE RECORDS INTO EACH TABLE
-- ============================================================

INSERT INTO Students (StudentID, Name, Age, Address) VALUES
(1, 'Rahul', 20, 'Bhubaneswar'),
(2, 'Priya', 21, 'Cuttack'),
(3, 'Amit', 19, 'Puri'),
(4, 'Sneha', 22, 'Rourkela'),
(5, 'Arjun', 20, 'Sambalpur');

INSERT INTO Courses (CourseID, CourseName, Credits, Capacity) VALUES
(101, 'Database Management System', 4, 30),
(102, 'Computer Networks', 3, 25),
(103, 'Operating Systems', 4, 35),
(104, 'Data Structures', 4, 40),
(105, 'Web Development', 3, 30);

INSERT INTO Enrollments
(EnrollmentID, StudentID, CourseID, EnrollmentDate, Grade, Status)
VALUES
(1, 1, 101, '2026-01-10', 'A', 'Active'),
(2, 2, 102, '2026-01-11', 'B', 'Active'),
(3, 3, 103, '2026-01-12', 'A', 'Completed'),
(4, 4, 104, '2026-01-13', 'B', 'Active'),
(5, 5, 105, '2026-01-14', NULL, 'Active');


-- ============================================================
-- 4. DISPLAY ALL STUDENT RECORDS
-- ============================================================

SELECT * FROM Students;


-- ============================================================
-- 5. DISPLAY ALL COURSE RECORDS
-- ============================================================

SELECT * FROM Courses;


-- ============================================================
-- 6. DISPLAY ENROLLED COURSES WITH STUDENT DETAILS
-- ============================================================

SELECT
    s.StudentID,
    s.Name AS StudentName,
    c.CourseID,
    c.CourseName,
    e.EnrollmentDate,
    e.Grade,
    e.Status
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID;


-- ============================================================
-- 7. DISPLAY COURSE NAME, STUDENT NAME AND ENROLLMENT DATE
-- ============================================================

SELECT
    c.CourseName,
    s.Name AS StudentName,
    e.EnrollmentDate
FROM Enrollments e
INNER JOIN Students s
    ON e.StudentID = s.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID;


-- ============================================================
-- 8. UPDATE COURSE CAPACITY WHEN A STUDENT ENROLLS
-- ============================================================

UPDATE Courses
SET Capacity = Capacity - 1
WHERE CourseID = 101;


-- ============================================================
-- 9. UPDATE STUDENT GRADE / ENROLLMENT STATUS
-- ============================================================

UPDATE Enrollments
SET Grade = 'A',
    Status = 'Completed'
WHERE EnrollmentID = 1;


-- ============================================================
-- 10. INCREASE COURSE CAPACITY
-- ============================================================

UPDATE Courses
SET Capacity = Capacity + 10
WHERE CourseID = 102;


-- ============================================================
-- 11. ADD EMAIL COLUMN TO STUDENTS
-- ============================================================

ALTER TABLE Students
ADD Email VARCHAR(100);


-- ============================================================
-- 12. DROP ADDRESS COLUMN
-- ============================================================

ALTER TABLE Students
DROP COLUMN Address;


-- ============================================================
-- 13. ADD NOT NULL CONSTRAINT TO NAME
-- ============================================================

ALTER TABLE Students
MODIFY Name VARCHAR(100) NOT NULL;


-- ============================================================
-- 14. ADD CHECK CONSTRAINT: AGE >= 18
-- ============================================================

ALTER TABLE Students
ADD CONSTRAINT chk_student_age
CHECK (Age >= 18);


-- ============================================================
-- 15. RENAME ENROLLMENTS TO REGISTRATIONS
-- ============================================================

RENAME TABLE Enrollments TO Registrations;


-- ============================================================
-- 16. INNER JOIN
-- DISPLAY STUDENTS WITH THEIR ENROLLED COURSES
-- ============================================================

SELECT
    s.StudentID,
    s.Name AS StudentName,
    c.CourseName,
    r.EnrollmentDate,
    r.Grade,
    r.Status
FROM Students s
INNER JOIN Registrations r
    ON s.StudentID = r.StudentID
INNER JOIN Courses c
    ON r.CourseID = c.CourseID;


-- ============================================================
-- 17. LEFT JOIN
-- DISPLAY ALL STUDENTS WITH OR WITHOUT ENROLLMENTS
-- ============================================================

SELECT
    s.StudentID,
    s.Name AS StudentName,
    c.CourseName,
    r.EnrollmentDate,
    r.Status
FROM Students s
LEFT JOIN Registrations r
    ON s.StudentID = r.StudentID
LEFT JOIN Courses c
    ON r.CourseID = c.CourseID;


-- ============================================================
-- 18. TOTAL NUMBER OF STUDENTS
-- ============================================================

SELECT COUNT(*) AS TotalStudents
FROM Students;


-- ============================================================
-- 19. MAXIMUM AND MINIMUM COURSE CREDITS
-- ============================================================

SELECT
    MAX(Credits) AS MaximumCredits,
    MIN(Credits) AS MinimumCredits
FROM Courses;


-- ============================================================
-- 20. COUNT ACTIVE ENROLLMENTS
-- ============================================================

SELECT COUNT(*) AS ActiveEnrollments
FROM Registrations
WHERE Status = 'Active';


-- ============================================================
-- 21. CREATE ACTIVE ENROLLMENTS VIEW
-- ============================================================

CREATE VIEW ActiveEnrollmentsView AS
SELECT
    c.CourseName,
    s.Name AS StudentName,
    r.EnrollmentDate
FROM Registrations r
INNER JOIN Students s
    ON r.StudentID = s.StudentID
INNER JOIN Courses c
    ON r.CourseID = c.CourseID
WHERE r.Status = 'Active';


-- ============================================================
-- 22. DISPLAY RECORDS FROM VIEW
-- ============================================================

SELECT * FROM ActiveEnrollmentsView;


-- ============================================================
-- 23. CREATE STORED PROCEDURE
-- ============================================================

DELIMITER //

CREATE PROCEDURE GetActiveEnrollments()
BEGIN
    SELECT
        c.CourseName,
        s.Name AS StudentName,
        r.EnrollmentDate
    FROM Registrations r
    INNER JOIN Students s
        ON r.StudentID = s.StudentID
    INNER JOIN Courses c
        ON r.CourseID = c.CourseID
    WHERE r.Status = 'Active';
END //

DELIMITER ;


-- ============================================================
-- 24. EXECUTE STORED PROCEDURE
-- ============================================================

CALL GetActiveEnrollments();


-- ============================================================
-- 25. DELETE A STUDENT RECORD
-- ============================================================
-- Delete the registration first because of the foreign key.

DELETE FROM Registrations
WHERE StudentID = 5;

DELETE FROM Students
WHERE StudentID = 5;


-- ============================================================
-- 26. DELETE A COURSE RECORD
-- ============================================================
-- Delete its registration first because of the foreign key.

DELETE FROM Registrations
WHERE CourseID = 105;

DELETE FROM Courses
WHERE CourseID = 105;


-- ============================================================
-- 27. TRUNCATE ALL RECORDS FROM REGISTRATIONS
-- ============================================================
-- WARNING: This permanently removes all registration records.

TRUNCATE TABLE Registrations;


-- ============================================================
-- END OF EXPERIMENT
-- ============================================================