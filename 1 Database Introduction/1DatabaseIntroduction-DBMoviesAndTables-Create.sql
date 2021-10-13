CREATE DATABASE [Movies]
GO

USE [Movies]
GO

CREATE TABLE [Directors]
			 (
			 [Id]			INT PRIMARY KEY IDENTITY NOT NULL,
			 [DirectorName] NVARCHAR(50) UNIQUE		 NOT NULL,
							CHECK (DATALENGTH([DirectorName]) >= 3),
			 [Notes]		NVARCHAR(MAX)
			 )

CREATE TABLE [Genres]
			 (
			 [Id]			INT PRIMARY KEY IDENTITY NOT NULL,
			 [GenreName]	NVARCHAR(50) UNIQUE	  NOT NULL,
							CHECK (DATALENGTH([GenreName]) >= 3),
			 [Notes]		NVARCHAR(MAX)
			 )

CREATE TABLE [Categories]
			 (
			 [Id]			INT PRIMARY KEY IDENTITY NOT NULL,
			 [CategoryName] NVARCHAR(50) UNIQUE NOT NULL,
							CHECK (DATALENGTH([CategoryName]) >= 3),
			 [Notes]		NVARCHAR(MAX)
			 )

CREATE TABLE [Movies]
			 (
			 [Id]			INT PRIMARY KEY IDENTITY NOT NULL,
			 [Title]		NVARCHAR(50) UNIQUE		 NOT NULL,
			 [DirectorId]	INT FOREIGN KEY REFERENCES [Directors](Id),
			 [CopyrightYear] DATETIME2,
			 [Length]		 DECIMAL (18,2),
			 [GenreId]		INT FOREIGN KEY REFERENCES [Genres](Id),
			 [CategoryId]	INT FOREIGN KEY REFERENCES [Categories](Id),
			 [Rating]		INT						 NOT NULL,
			 [Notes]		NVARCHAR(MAX)
			 )

INSERT INTO [Directors] ([DirectorName],[Notes])
VALUES 
	('Disney', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('TV5Mode', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('BTV', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('NOVA', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('Discovery', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit')

INSERT INTO [Genres] ([GenreName],[Notes])
VALUES 
	('Action', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('Comedy', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('Trilar', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('Animation', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('Fantasy', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit')

INSERT INTO [Categories] ([CategoryName],[Notes])
VALUES 
	('Act', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('Co', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('Tr', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('An', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('Fan', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit')


INSERT INTO [Movies] ([Title], [DirectorId], [CopyrightYear], [Length], [GenreId], [CategoryId], [Rating], [Notes])
VALUES 
	('A1', 1, GETDATE(), 95.56, 1, 1, 10, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('A2', 2, GETDATE(), 95.56, 2, 2, 8.1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('A3', 3, GETDATE(), 95.56, 3, 3, 9.0, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('A4', 4, GETDATE(), 95.56, 4, 4, 7.7, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'),
	('A5', 5, GETDATE(), 95.56, 5, 5, 6.3, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit')

SELECT * FROM [Movies]

GO