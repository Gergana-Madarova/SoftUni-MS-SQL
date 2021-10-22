CREATE DATABASE [Persons]

USE [Persons]

CREATE TABLE [Passports] 
			(
			[PassportID]	 INT PRIMARY KEY IDENTITY(101,1)	NOT NULL,
			[PassportNumber] CHAR (8)							NOT NULL
			)

INSERT INTO [Passports] ([PassportNumber])
VALUES
	('N34FG21B'),
	('K65LO4R7'),
	('ZE657QP2')

CREATE TABLE [Persons]
			 (
			 [PersonID]		INT PRIMARY KEY IDENTITY NOT NULL,
			 [FirstName]	NVARCHAR(20)			 NOT NULL,
			 [Salary]		DECIMAL(9,2)			 NOT NULL,
			 [PassportID]	INT FOREIGN KEY REFERENCES [Passports](PassportID) UNIQUE NOT NULL
			 )

INSERT INTO [Persons] ([FirstName],[Salary],[PassportID]) 
VALUES
	('Roberto', 43300.00,102),
	('Tom', 56100.00,103),
	('Yana', 60200.00,101)
