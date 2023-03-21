--CREATE DATABASE CommunSalonDB
USE CommunSalonDB
GO

CREATE TABLE [Item]
(
Id_item		int PRIMARY KEY IDENTITY,
[Name]		nvarchar(50),
[Price]		money,
[Amount]	int,
) 

CREATE TABLE [UserInform]
(
Id_info			int PRIMARY KEY IDENTITY,
[FirstName]		nvarchar(50),
[LastName]		nvarchar(50),
[Age]			int,
)

CREATE TABLE [User]
(
Id			int PRIMARY KEY IDENTITY,
[Login]		nvarchar(50),
[Password]	nvarchar(50),
[EMAIL]		nvarchar(50),
Id_info	int,
id_item int,
FOREIGN KEY (Id_info) REFERENCES [UserInform],
FOREIGN KEY (id_item) REFERENCES [Item]

)