CREATE DATABASE [Store]

GO

USE [Store]

CREATE TABLE [Cities]
			 (
			 [CityID] INT		  PRIMARY KEY IDENTITY NOT NULL,
			 [Name]	  VARCHAR(50) NOT NULL
			 )

CREATE TABLE [Customers]
			 (
			 [CustomerID] INT		  PRIMARY KEY IDENTITY	 NOT NULL,
			 [Name]		  VARCHAR(50) NOT NULL,
			 [Birthday]	  DATE,
			 [CityID]	  INT		  FOREIGN KEY REFERENCES [Cities] ([CityID])
			 )

CREATE TABLE [Orders]
			 (
			 [OrderID]	  INT PRIMARY KEY IDENTITY	 NOT NULL,
			 [CustomerID] INT FOREIGN KEY REFERENCES [Customers] ([CustomerID])
			 )

CREATE TABLE [ItemTypes]
			 (
			 [ItemTypeID] INT		  PRIMARY KEY IDENTITY NOT NULL,
			 [Name]		  VARCHAR(50) NOT NULL
			 )

CREATE TABLE [Items]
			 (
			 [ItemID]		INT PRIMARY KEY IDENTITY NOT NULL,
			 [Name]			VARCHAR(50) NOT NULL,
			 [ItemTypeID]   INT FOREIGN KEY REFERENCES [ItemTypes] ([ItemTypeID] )
			 )

CREATE TABLE [OrderItems]
			 (
			 [OrderID] INT FOREIGN KEY REFERENCES [Orders] ([OrderID]) NOT NULL,
			 [ItemID]  INT FOREIGN KEY REFERENCES [Items] ([ItemID] ),
			 [ID]	   INT PRIMARY KEY ([OrderID],[ItemID])			   IDENTITY   NOT NULL
			 )