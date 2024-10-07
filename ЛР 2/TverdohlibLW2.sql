CREATE DATABASE STUDENTS;
/*
��������� �� Students
*/

USE STUDENTS;

/*
������������� �� Students
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
��������� �������: PersonalInfo, AcademicInfo, ContactInfo
*/

ALTER TABLE ContactInfo ADD Address NVARCHAR(200);
/*
������ � ������� ContactInfo �������� Address
*/

ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;

/*
� ������� ContactInfo ��������� �������� PhoneNumber
*/

EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';

/*
������� ����� ������� Email �� EmailAddress
*/

ALTER TABLE AcademicInfo
   ALTER COLUMN Faculty NVARCHAR(150);
/*
������� ��� ����� ������� Faculty �� NVARCHAR(150)
*/

CREATE TABLE Extracurricular (
        ActivityID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        ActivityName NVARCHAR(100),
        JoinDate DATE
    );
/*
��������� ������� Extracurricular
*/

DROP TABLE Extracurricular;
/*
��������� ������� Extracurricular
*/

CREATE DATABASE TEACHER;
DROP DATABASE TEACHER;
/*
��������� ���� ����� TEACHER �� ��������� �� ���� �������� �� �������������
*/

USE STUDENTS;

INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES 
    (1, '���������', '������', '2000-05-15'),
    (2, '����', '��������', '2001-03-22'),
    (3, '������', '���������', '1999-10-10');
/*
������ ��� ����� �� ������� PersonalInfo
*/

