CREATE DATABASE [University]

GO

USE [University]

CREATE TABLE [Majors]
			 (
			 [MajorID]	INT				PRIMARY KEY IDENTITY NOT NULL,
			 [Name]		VARCHAR(50)		NOT NULL
			 )

CREATE TABLE [Subjects] 
			 (
			 [SubjectID]	INT			PRIMARY KEY IDENTITY NOT NULL,
			 [SubjecttName] VARCHAR(50) NOT NULL,
			 )

CREATE TABLE [Students]
			 (
			 [StudentID]	 INT			PRIMARY KEY IDENTITY NOT NULL,
			 [StudentNumber] INT			NOT NULL,
			 [StudentName]	 VARCHAR (100)	NOT NULL,
			 [MajorID]		 INT			FOREIGN KEY REFERENCES [Majors] ([MajorID])
			 )

CREATE TABLE [Payments]
			 (
			 [PaymentID]	 INT			PRIMARY KEY IDENTITY NOT NULL,
			 [PaymentDate]	 DATETIME2		NOT NULL,
			 [PaymentAmount] DECIMAL(10,2),
			 [StudentID]	 INT			FOREIGN KEY REFERENCES [Students] ([StudentID]) NOT NULL,
			 )

CREATE TABLE [Agenda]
			 (
			 [StudentID] INT FOREIGN KEY REFERENCES [Students] ([StudentID]) NOT NULL,
			 [SubjectID] INT FOREIGN KEY REFERENCES [Subjects] ([SubjectID]) NOT NULL,
			 [ID]		 INT PRIMARY KEY ([StudentID],[SubjectID])			 NOT NULL IDENTITY
			 )