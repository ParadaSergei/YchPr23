USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 24.03.2023 10:50:26 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY FULL 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Trade', N'ON'
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[FIOUser]    Script Date: 24.03.2023 10:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FIOUser](
	[Id_Fio] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Fio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformationEndOrder]    Script Date: 24.03.2023 10:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformationEndOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodeToGet] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 24.03.2023 10:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[Structure] [nvarchar](50) NOT NULL,
	[Id_PointOfIssue] [int] NOT NULL,
	[Id_Fio] [int] NOT NULL,
	[Id_InformationEndOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 24.03.2023 10:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[Id_Product] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[Id_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhotoProduct]    Script Date: 24.03.2023 10:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotoProduct](
	[id_photo] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [image] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_photo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointOfIssue]    Script Date: 24.03.2023 10:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointOfIssue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Index] [int] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](50) NULL,
	[Number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 24.03.2023 10:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id_Product] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
	[Cost] [decimal](19, 4) NOT NULL,
	[DiscountAmount] [tinyint] NULL,
	[QuantityInStock] [int] NOT NULL,
	[Id_photo] [int] NOT NULL,
	[Id_status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 24.03.2023 10:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatysProduct]    Script Date: 24.03.2023 10:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatysProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 24.03.2023 10:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Id_Role] [int] NOT NULL,
	[Id_Fio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FIOUser] ON 

INSERT [dbo].[FIOUser] ([Id_Fio], [Surname], [Name], [Patronymic]) VALUES (1, N'Суслов', N'Илья', N'Арсентьевич')
INSERT [dbo].[FIOUser] ([Id_Fio], [Surname], [Name], [Patronymic]) VALUES (2, N'Яковлева', N'Ярослава', N'Даниэльевна')
INSERT [dbo].[FIOUser] ([Id_Fio], [Surname], [Name], [Patronymic]) VALUES (3, N'Игнатьева', N'Алина', N'Михайловна')
INSERT [dbo].[FIOUser] ([Id_Fio], [Surname], [Name], [Patronymic]) VALUES (4, N'Денисов', N'Михаил', N'Романович')
INSERT [dbo].[FIOUser] ([Id_Fio], [Surname], [Name], [Patronymic]) VALUES (5, N'Тимофеев', N'Михаил', N'Елисеевич')
INSERT [dbo].[FIOUser] ([Id_Fio], [Surname], [Name], [Patronymic]) VALUES (6, N'Соловьев', N'Ярослав', N'Маркович')
INSERT [dbo].[FIOUser] ([Id_Fio], [Surname], [Name], [Patronymic]) VALUES (7, N'Филимонов', N'Роберт', N'Васильевич')
INSERT [dbo].[FIOUser] ([Id_Fio], [Surname], [Name], [Patronymic]) VALUES (8, N'Шилова', N'Майя', N'Артемьевна')
INSERT [dbo].[FIOUser] ([Id_Fio], [Surname], [Name], [Patronymic]) VALUES (9, N'Чистякова', N'Виктория', N'Степановна')
INSERT [dbo].[FIOUser] ([Id_Fio], [Surname], [Name], [Patronymic]) VALUES (10, N'Волкова', N'Эмилия', N'Артёмовна')
SET IDENTITY_INSERT [dbo].[FIOUser] OFF
GO
SET IDENTITY_INSERT [dbo].[InformationEndOrder] ON 

INSERT [dbo].[InformationEndOrder] ([ID], [CodeToGet], [Status]) VALUES (1, N'601', N'1')
INSERT [dbo].[InformationEndOrder] ([ID], [CodeToGet], [Status]) VALUES (2, N'602', N'1')
INSERT [dbo].[InformationEndOrder] ([ID], [CodeToGet], [Status]) VALUES (3, N'603', N'2')
INSERT [dbo].[InformationEndOrder] ([ID], [CodeToGet], [Status]) VALUES (4, N'604', N'2')
INSERT [dbo].[InformationEndOrder] ([ID], [CodeToGet], [Status]) VALUES (5, N'605', N'2')
INSERT [dbo].[InformationEndOrder] ([ID], [CodeToGet], [Status]) VALUES (6, N'606', N'2')
INSERT [dbo].[InformationEndOrder] ([ID], [CodeToGet], [Status]) VALUES (7, N'607', N'1')
INSERT [dbo].[InformationEndOrder] ([ID], [CodeToGet], [Status]) VALUES (8, N'608', N'1')
INSERT [dbo].[InformationEndOrder] ([ID], [CodeToGet], [Status]) VALUES (9, N'609', N'1')
INSERT [dbo].[InformationEndOrder] ([ID], [CodeToGet], [Status]) VALUES (10, N'610', N'2')
SET IDENTITY_INSERT [dbo].[InformationEndOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [DeliveryDate], [Structure], [Id_PointOfIssue], [Id_Fio], [Id_InformationEndOrder]) VALUES (13, CAST(N'2022-05-14T00:00:00.000' AS DateTime), N'E532Q5, 10, T432F4, 10', 22, 8, 3)
INSERT [dbo].[Order] ([ID], [DeliveryDate], [Structure], [Id_PointOfIssue], [Id_Fio], [Id_InformationEndOrder]) VALUES (16, CAST(N'2022-05-17T00:00:00.000' AS DateTime), N'H436R4, 1, D643B5, 1', 28, 7, 6)
INSERT [dbo].[Order] ([ID], [DeliveryDate], [Structure], [Id_PointOfIssue], [Id_Fio], [Id_InformationEndOrder]) VALUES (19, CAST(N'2022-05-21T00:00:00.000' AS DateTime), N'V527T5, 1, K452T5, 1', 34, 10, 9)
INSERT [dbo].[Order] ([ID], [DeliveryDate], [Structure], [Id_PointOfIssue], [Id_Fio], [Id_InformationEndOrder]) VALUES (20, CAST(N'2022-05-21T00:00:00.000' AS DateTime), N'M356R4, 1, W548O7, 1', 36, 9, 10)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[PointOfIssue] ON 

INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (1, 344288, N' г, Нефтеюганск', N' ул, Чехова', 1)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (2, 614164, N' г,Нефтеюганск', N'  ул, Степная', 30)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (3, 394242, N' г, Нефтеюганск', N' ул, Коммунистическая', 43)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (4, 660540, N' г, Нефтеюганск', N' ул, Солнечная', 25)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (5, 125837, N' г, Нефтеюганск', N' ул, Шоссейная', 40)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (6, 125703, N' г, Нефтеюганск', N' ул, Партизанская', 49)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (7, 625283, N' г, Нефтеюганск', N' ул, Победы', 46)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (8, 614611, N' г, Нефтеюганск', N' ул, Молодежная', 50)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (9, 454311, N' г,Нефтеюганск', N' ул, Новая', 19)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (10, 660007, N' г,Нефтеюганск', N' ул, Октябрьская', 19)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (11, 603036, N' г, Нефтеюганск', N' ул, Садовая', 4)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (12, 450983, N' г,Нефтеюганск', N' ул, Комсомольская', 26)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (13, 394782, N' г, Нефтеюганск', N' ул, Чехова', 3)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (14, 603002, N' г, Нефтеюганск', N' ул, Дзержинского', 28)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (15, 450558, N' г, Нефтеюганск', N' ул, Набережная', 30)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (16, 394060, N' г,Нефтеюганск', N' ул, Фрунзе', 43)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (17, 410661, N' г, Нефтеюганск', N' ул, Школьная', 50)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (18, 625590, N' г, Нефтеюганск', N' ул, Коммунистическая', 20)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (19, 625683, N' г, Нефтеюганск', N' ул, 8 Марта', NULL)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (20, 400562, N' г, Нефтеюганск', N' ул, Зеленая', 32)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (21, 614510, N' г, Нефтеюганск', N' ул, Маяковского', 47)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (22, 410542, N' г, Нефтеюганск', N' ул, Светлая', 46)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (23, 620839, N' г, Нефтеюганск', N' ул, Цветочная', 8)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (24, 443890, N' г, Нефтеюганск', N' ул, Коммунистическая', 1)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (25, 603379, N' г, Нефтеюганск', N' ул, Спортивная', 46)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (26, 603721, N' г, Нефтеюганск', N' ул, Гоголя', 41)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (27, 410172, N' г, Нефтеюганск', N' ул, Северная', 13)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (28, 420151, N' г, Нефтеюганск', N' ул, Вишневая', 32)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (29, 125061, N' г, Нефтеюганск', N' ул, Подгорная', 8)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (30, 630370, N' г, Нефтеюганск', N' ул, Шоссейная', 24)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (31, 614753, N' г, Нефтеюганск', N' ул, Полевая', 35)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (32, 426030, N' г, Нефтеюганск', N' ул, Маяковского', 44)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (33, 450375, N' г, Нефтеюганск ул, Клубная', N' 44', NULL)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (34, 625560, N' г, Нефтеюганск', N' ул, Некрасова', 12)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (35, 630201, N' г, Нефтеюганск', N' ул, Комсомольская', 17)
INSERT [dbo].[PointOfIssue] ([ID], [Index], [City], [Street], [Number]) VALUES (36, 190949, N' г, Нефтеюганск', N' ул, Мичурина', 26)
SET IDENTITY_INSERT [dbo].[PointOfIssue] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[StatysProduct] ON 

INSERT [dbo].[StatysProduct] ([Id], [Status]) VALUES (1, N'Новый ')
INSERT [dbo].[StatysProduct] ([Id], [Status]) VALUES (2, N'Завершен')
SET IDENTITY_INSERT [dbo].[StatysProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Login], [Password], [Id_Role], [Id_Fio]) VALUES (45, N'pixil59@gmail.com', N'2L6KZG', 1, 1)
INSERT [dbo].[User] ([ID], [Login], [Password], [Id_Role], [Id_Fio]) VALUES (48, N'vilagajaunne-5170@yandex.ru', N'8ntwUp', 1, 3)
INSERT [dbo].[User] ([ID], [Login], [Password], [Id_Role], [Id_Fio]) VALUES (49, N'frusubroppotou656@yandex.ru', N'YOyhfR', 2, 4)
INSERT [dbo].[User] ([ID], [Login], [Password], [Id_Role], [Id_Fio]) VALUES (50, N'leuttevitrafo1998@mail.ru', N'RSbvHv', 2, 5)
INSERT [dbo].[User] ([ID], [Login], [Password], [Id_Role], [Id_Fio]) VALUES (51, N'frapreubrulloba1141@yandex.ru', N'rwVDh9', 2, 6)
INSERT [dbo].[User] ([ID], [Login], [Password], [Id_Role], [Id_Fio]) VALUES (52, N'loudittoimmolau1900@gmail.com', N'LdNyos', 3, 7)
INSERT [dbo].[User] ([ID], [Login], [Password], [Id_Role], [Id_Fio]) VALUES (53, N'hittuprofassa4984@mail.com', N'gynQMT', 3, 8)
INSERT [dbo].[User] ([ID], [Login], [Password], [Id_Role], [Id_Fio]) VALUES (54, N'freineiciweijau888@yandex.ru', N'AtnDjr', 3, 9)
INSERT [dbo].[User] ([ID], [Login], [Password], [Id_Role], [Id_Fio]) VALUES (55, N'nokupekidda2001@gmail.com', N'JlFRCZ', 3, 10)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Id_Fio])
REFERENCES [dbo].[FIOUser] ([Id_Fio])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Id_InformationEndOrder])
REFERENCES [dbo].[InformationEndOrder] ([ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Id_PointOfIssue])
REFERENCES [dbo].[PointOfIssue] ([ID])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([Id_Product])
REFERENCES [dbo].[Product] ([Id_Product])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Id_photo])
REFERENCES [dbo].[PhotoProduct] ([id_photo])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Id_status])
REFERENCES [dbo].[StatysProduct] ([Id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([Id_Fio])
REFERENCES [dbo].[FIOUser] ([Id_Fio])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([Id_Role])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
