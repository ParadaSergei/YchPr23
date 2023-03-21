--CREATE DATABASE PoliceDB
USE PoliceDB
GO

CREATE TABLE [User]
(
Id			int PRIMARY KEY IDENTITY,
[Login]		nvarchar(50),
[Password]	nvarchar(50),
[EMAIL]		nvarchar(50),
Id_info	int,
FOREIGN KEY (Id_info) REFERENCES [UserInform]
)

CREATE TABLE [UserInform]
(
Id_info			int PRIMARY KEY IDENTITY,
[FirstName]		nvarchar(50),
[LastName]		nvarchar(50),
[Age]			int,
)