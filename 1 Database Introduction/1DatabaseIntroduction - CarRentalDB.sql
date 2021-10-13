CREATE DATABASE [CarRental]
GO

USE [CarRental]
GO

CREATE TABLE [Categories]
			 (
			 [Id]			INT PRIMARY KEY IDENTITY NOT NULL,
			 [CategoryName] NVARCHAR(40)			 NOT NULL,
			 [DailyRate]	FLOAT,
			 [WeeklyRate]	FLOAT,
			 [MonthlyRate]	FLOAT,
			 [WeekendRate]	FLOAT
			 )
GO

INSERT INTO [Categories] ([CategoryName], [DailyRate], [WeeklyRate], [MonthlyRate], [WeekendRate]) 
VALUES
	('Car', 99.66, 1000, 10000, 56.75),
	('Jeep', 33.25, 500, 20000, 19.25),
	('Family', 67.25, 800, 30000, 46.75)
GO


CREATE TABLE [Cars]
			 (
			 [Id]			INT PRIMARY KEY IDENTITY NOT NULL,
			 [PlateNumber]	NVARCHAR(10)			 NOT NULL,
			 [Manufacturer] NVARCHAR(40)			 NOT NULL,
			 [Model]		NVARCHAR(50)			 NOT NULL,
			 [CarYear]		DATE					 NOT NULL,
			 [CategoryId]	INT FOREIGN KEY REFERENCES [Categories](Id) NOT NULL,
			 [Doors]		INT						 NOT NULL,
			 [Picture]		VARBINARY(MAX),
			 [Condition]	NVARCHAR(50),
			 [Available]	BIT						 NOT NULL
			 )
GO

INSERT INTO [Cars]([PlateNumber], [Manufacturer], [Model], [CarYear], [CategoryId], [Doors], [Picture], [Condition], [Available])
VALUES
	('PB5230CH', 'BMW', 'X6', '2015-06-05', 3,4, NULL,'used', 1),
	('CB6606AC', 'Audi', 'A4', '2012-12-05', 2,2, NULL,'used', 0),
	('CA5230AB', 'KIA', 'Picanto', '2020-09-25', 1,4, NULL,'new', 1)
GO


CREATE TABLE [Employees]
			 (
			 [Id]		 INT PRIMARY KEY IDENTITY  NOT NULL,
			 [FirstName] NVARCHAR(50)			   NOT NULL,
			 [LastName]	 NVARCHAR(50)			   NOT NULL,
			 [Title]	 NVARCHAR(200)			   NOT NULL,
			 [Notes]	 NVARCHAR(MAX)
			 )
GO

INSERT INTO [Employees] ([FirstName], [LastName], [Title], [Notes])
VALUES
	('A1', 'B1', 'C1', NULL),
	('A2', 'B2', 'C2', NULL),
	('A3', 'B3', 'C3', NULL)
GO


CREATE TABLE [Customers]
			 (
			 [Id]					INT PRIMARY KEY IDENTITY	NOT NULL,
			 [DriverLicenceNumber]	INT							NOT NULL,
			 [FullName]				NVARCHAR(250)				NOT NULL,
			 [Address]				NVARCHAR(250)				NOT NULL,
			 [City]					NVARCHAR(100)				NOT NULL,
			 [ZIPCode]				INT							NOT NULL,
			 [Notes]				NVARCHAR(MAX)
			 )
GO

INSERT INTO [Customers] ([DriverLicenceNumber], [FullName], [Address], [City], [ZIPCode], [Notes])
VALUES
	(51513205, 'Anthony Winchester', 'ul.Ivan Vazov', 'Varna', 6000, null),
	(04620144, 'Vesa Spasova', 'ul.Boycho Handjiev', 'Plovdiv', 1450, null),
	(04789632, 'Milen Angelov', 'Tsar Kaloyan 22A', 'Sofia', 1000, null)
GO


CREATE TABLE [RentalOrders]
			 (
			 [Id]				INT PRIMARY KEY IDENTITY					NOT NULL,
			 [EmployeeId]		INT FOREIGN KEY REFERENCES [Employees](Id)	NOT NULL,
			 [CustomerId]		INT FOREIGN KEY REFERENCES [Customers](Id)	NOT NULL,
			 [CarId]			INT FOREIGN KEY REFERENCES [Cars](Id)		NOT NULL,
			 [TankLevel]		FLOAT								NOT NULL,
			 [KilometrageStart] FLOAT,
			 [KilometrageEnd]	FLOAT,
			 [TotalKilometrage] AS [KilometrageEnd] - [KilometrageStart],
			 [StartDate]		DATETIME2 ,
			 [EndDate]			DATETIME2,
			 [TotalDate]		AS DATEDIFF(Day, [StartDate], [EndDate]),
			 [RateApplied]		DECIMAL(18,2)								NOT NULL,
			 [TaxRate]			DECIMAL(18,2)								NOT NULL,
			 [OrderStatus]		NVARCHAR(250)								NOT NULL,
			 [Notes]			NVARCHAR(MAX) 
			 )
GO

INSERT INTO [RentalOrders] ([EmployeeId], [CustomerId],[CarId], [TankLevel], [KilometrageStart], [KilometrageEnd], 
			[StartDate], [EndDate], [RateApplied], [TaxRate], [OrderStatus], [Notes])
VALUES
	(1, 1, 1, 10.10, 10.10, 20.20, '2016/12/10', '2019/10/10', 1010.10,1010.10, 'YES', null),
	(2, 2, 2, 20.20, 20.20, 30.30, '2017/12/10', '2020/10/10', 2020.20,2020.20, 'NO', null),
	(3, 3, 3, 30.30, 30.30, 40.40, '2019/12/10', '2021/10/10', 3030.30,3030.30, 'YES', null)

SELECT * FROM [RentalOrders]