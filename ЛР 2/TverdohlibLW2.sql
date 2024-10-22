CREATE DATABASE STUDENTS;
/*
Створюємо дб Students
*/

USE STUDENTS;

/*
Використовуємо дб Students
*/

CREATE TABLE PersonalInfo (
        StudentID INT PRIMARY KEY,
        FirstName NVARCHAR(50),
        LastName NVARCHAR(50),
        DateOfBirth DATE
    );

CREATE TABLE AcademicInfo (
        RecordID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Faculty NVARCHAR(100),
        Curator NVARCHAR(100),
        EnrollmentYear INT
    );

CREATE TABLE ContactInfo (
        ContactID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Email NVARCHAR(100),
        PhoneNumber NVARCHAR(15)
    );

/*
Створюємо таблиці: PersonalInfo, AcademicInfo, ContactInfo
*/

ALTER TABLE ContactInfo ADD Address NVARCHAR(200);
/*
Додаємо у таблицю ContactInfo ствобець Address
*/

ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;

/*
З таблиці ContactInfo видаляємо стовбець PhoneNumber
*/

EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';

/*
Змінюємо назву стовпця Email на EmailAddress
*/

ALTER TABLE AcademicInfo
   ALTER COLUMN Faculty NVARCHAR(150);
/*
Змінюємо тип даних таблиці Faculty на NVARCHAR(150)
*/

CREATE TABLE Extracurricular (
        ActivityID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        ActivityName NVARCHAR(100),
        JoinDate DATE
    );
/*
Створюємо таблицю Extracurricular
*/

DROP TABLE Extracurricular;
/*
Видаляємо таблицю Extracurricular
*/

CREATE DATABASE TEACHER;
DROP DATABASE TEACHER;
/*
Створюємо базу даних TEACHER та видаляємо її після перевірки на працездатність
*/

USE STUDENTS;

INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES 
    (1, 'Олександр', 'Петров', '2000-05-15'),
    (2, 'Марія', 'Іваненко', '2001-03-22'),
    (3, 'Василь', 'Коваленко', '1999-10-10');
/*
Додаємо три рядки до таблиці PersonalInfo
*/

