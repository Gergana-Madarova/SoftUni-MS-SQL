USE [Minions]

GO

--Create Table Users and Add dates
CREATE TABLE [Users]
			 (
			 [Id]		 BIGINT PRIMARY KEY IDENTITY,		--no more than 2^63-1 users. Auto incremented
			 [Username]  VARCHAR(30) UNIQUE NOT NULL,		--no more than 30 characters (non Unicode)
						 CHECK (DATALENGTH([Username]) <= 30),
			 [Password]  VARCHAR(26) UNIQUE NOT NULL,		--no longer than 26 characters (non Unicode)
			 [ProfilePicture] VARBINARY(MAX) ,				--size up to 900 KB
						 CHECK (DATALENGTH([ProfilePicture]) <= 900000),
			 [LastLoginTime] DATETIME2,
			 [IsDeleted] BIT NOT NULL, 						--true or false
						 CHECK ([IsDeleted] in (1, 0))
			 )

GO

INSERT INTO [Users] ([Username], [Password], [ProfilePicture], [LastLoginTime], [IsDeleted])
VALUES
	('ABC', '12345', null,  '1977/01/26', 0),
	('DEF', '45678', null,  '1988/01/11', 0),
	('GHI', '7891011', null,  '1999/11/10', 1),
	('JKL', '101112', null,  '1985/09/17', 1),
	('MNO', '00000000', null,  '1985/01/16', 0)

GO

SELECT * FROM [Users]

GO


--Change Primary Key to Composite PK
ALTER TABLE		[Users]
DROP CONSTRAINT [PK__Users__3214EC077558060C]

GO

ALTER TABLE		[Users] 
ADD CONSTRAINT	[PK_CompPKIdUsername] PRIMARY KEY ([Id], [Username])

GO


--Add CHECK Constraint
ALTER TABLE		[Users]
ADD CONSTRAINT	CHK_PasswordLen CHECK (DATALENGTH([Password]) >= 5)

GO

--Set Default Value of a Field
--Make the default value of LastLoginTime field to be the current time
ALTER TABLE		[Users] 
ADD CONSTRAINT	DF_DefDate DEFAULT GETDATE() FOR [LastLoginTime]

GO

 --Remove Username field from the primary key (Id would be PK). 
ALTER TABLE		[Users]
DROP CONSTRAINT [PK_CompPKIdUsername]

GO

ALTER TABLE		[Users] 
ADD CONSTRAINT  [PK_ID] PRIMARY KEY ([Id])

GO

--Add unique constraint to the Username field - the values there are at least 3 symbols long.
ALTER TABLE		[Users]
ADD CONSTRAINT  CHK_Username CHECK (DATALENGTH([Username]) >= 3)