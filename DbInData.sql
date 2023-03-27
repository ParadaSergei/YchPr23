USE [master]
GO
/****** Object:  Database [trade]    Script Date: 27.03.2023 14:09:24 ******/
CREATE DATABASE [trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [trade] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [trade] SET RECOVERY FULL 
GO
ALTER DATABASE [trade] SET  MULTI_USER 
GO
ALTER DATABASE [trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [trade] SET QUERY_STORE = OFF
GO
USE [trade]
GO
/****** Object:  Table [dbo].[InformationEndOrder]    Script Date: 27.03.2023 14:09:24 ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 27.03.2023 14:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[Structure] [nvarchar](50) NOT NULL,
	[Id_PointOfIssue] [int] NOT NULL,
	[Id_Fio] [int] NULL,
	[Id_Status] [int] NOT NULL,
	[Id_InformationEndOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 27.03.2023 14:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductID] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointOfIssue]    Script Date: 27.03.2023 14:09:24 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 27.03.2023 14:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
	[Cost] [decimal](19, 4) NOT NULL,
	[DiscountAmount] [tinyint] NULL,
	[QuantityInStock] [int] NOT NULL,
 CONSTRAINT [PK__Product__6B19B3E71A23F4CC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27.03.2023 14:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatysProduct]    Script Date: 27.03.2023 14:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatysProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 27.03.2023 14:09:24 ******/
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
/****** Object:  Table [dbo].[UserData]    Script Date: 27.03.2023 14:09:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'1', N'Лакомство', N'Лакомство для кошек Dreamies Подушечки с курицей, 140 г', N'Dreames', CAST(123.0000 AS Decimal(19, 4)), 30, 6)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'10', N'Лакомство', N'Лакомство для собак Triol Кость из жил 7.5 см, 4шт. в уп.', N'Triol', CAST(170.0000 AS Decimal(19, 4)), 5, 5)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'11', N'Игрушка', N'Игрушка для собак Triol Бобер 41 см 12141053 бежевый', N'Triol', CAST(600.0000 AS Decimal(19, 4)), 10, 5)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'12', N'Игрушка', N'Игрушка для собак Triol 3D плетение EC-04/12171005 бежевый', N'Triol', CAST(300.0000 AS Decimal(19, 4)), 15, 15)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'13', N'Сухой корм', N'Сухой корм для котят CAT CHOW с высоким содержанием домашней птицы', N'Cat Chow', CAST(4100.0000 AS Decimal(19, 4)), 30, 9)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'14', N'Миска', N'Миска Triol 9002/KIDP3211/30261087 400 мл серебристый', N'Triol', CAST(385.0000 AS Decimal(19, 4)), 10, 17)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'15', N'Сухой корм', N'Сухой корм для кошек CAT CHOW', N'Cat Chow', CAST(280.0000 AS Decimal(19, 4)), 15, 8)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'16', N'Сухой корм', N'Сухой корм для собак Chappi Мясное изобилие, мясное ассорти', N'Chappy', CAST(1700.0000 AS Decimal(19, 4)), 25, 9)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'17', N'Игрушка', N'Игрушка для собак Triol Енот 41 см 12141063 серый', N'Triol', CAST(510.0000 AS Decimal(19, 4)), 5, 17)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'18', N'Игрушка', N'Игрушка для собак Triol Бобер 41 см 12141063 серый', N'Triol', CAST(510.0000 AS Decimal(19, 4)), 5, 17)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'19', N'Сухой корм', N'Сухой корм для собак Pro Plan при чувствительном пищеварении, ягненок', N'Pro Plan', CAST(2190.0000 AS Decimal(19, 4)), 30, 7)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'2', N'Щетка-варежка', N'Щетка-варежка True Touch для вычесывания шерсти, синий', N'True Touch', CAST(149.0000 AS Decimal(19, 4)), 15, 7)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'20', N'Лакомство', N'Лакомство для собак Triol Мясные полоски из кролика, 70 г', N'Triol', CAST(177.0000 AS Decimal(19, 4)), 15, 15)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'21', N'Мячик', N'Мячик для собак Triol с косточками 12101096 желтый/зеленый', N'Triol', CAST(100.0000 AS Decimal(19, 4)), 5, 21)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'22', N'Игрушка', N'Игрушка для собак Triol Ящерица 39 см коричневый', N'Triol', CAST(640.0000 AS Decimal(19, 4)), 5, 4)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'23', N'Лежак', N'Лежак для собак и кошек ZooM Lama 40х30х8 см бежевый', N'ZooM', CAST(800.0000 AS Decimal(19, 4)), 25, 17)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'24', N'Клетка', N'Клетка для собак Triol 30671002 61х45.5х52 см серый/белый', N'Triol', CAST(3500.0000 AS Decimal(19, 4)), 30, 3)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'25', N'Миска', N'Миска для животных Triol "Стрекоза", 450 мл', N'Triol', CAST(400.0000 AS Decimal(19, 4)), 15, 5)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'26', N'Миска', N'Миска Triol CB02/30231002 100 мл бежевый/голубой', N'Triol', CAST(292.0000 AS Decimal(19, 4)), 25, 13)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'27', N'Мячик', N'Мячик для собак TRIXIE DentaFun (32942) зеленый / белый', N'trixie', CAST(600.0000 AS Decimal(19, 4)), 15, 16)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'28', N'Лакомство', N'Лакомство для собак Titbit Лакомый кусочек Нарезка из говядины, 80 г', N'TitBit', CAST(140.0000 AS Decimal(19, 4)), 20, 19)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'29', N'Лакомство', N'Лакомство для собак Titbit Гематоген мясной Classic, 35 г', N'TitBit', CAST(50.0000 AS Decimal(19, 4)), 5, 6)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'3', N'Сухой корм', N'Сухой корм для кошек Pro Plan с чувствительным пищеварением', N'Pro Plan', CAST(1200.0000 AS Decimal(19, 4)), 10, 15)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'30', N'Сухой корм', N'Сухой корм для щенков DOG CHOW Puppy, ягненок 2.5 кг', N'Dog Chow', CAST(600.0000 AS Decimal(19, 4)), 15, 15)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'4', N'Лакомство', N'Лакомство для собак Titbit Косточки мясные с индейкой и ягненком, 145 г', N'TitBit', CAST(86.0000 AS Decimal(19, 4)), 5, 17)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'5', N'Лакомство', N'Лакомство для собак Titbit Печенье Био Десерт с лососем стандарт, 350 г', N'TitBit', CAST(166.0000 AS Decimal(19, 4)), 15, 18)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'6', N'Сухой корм', N'Сухой корм для собак Chappi говядина по-домашнему, с овощами', N'Chappy', CAST(1700.0000 AS Decimal(19, 4)), 25, 5)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'7', N'Мячик', N'Мячик для собак LIKER Мячик Лайкер (6294) оранжевый', N'LIKER', CAST(300.0000 AS Decimal(19, 4)), 5, 19)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'8', N'Игрушка', N'Игрушка для животных «Котик» с кошачьей мятой FANCY PETS', N'Fancy Pets', CAST(199.0000 AS Decimal(19, 4)), 5, 7)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock]) VALUES (N'9', N'Миска', N'Миска Nobby с рисунком Dog для собак 130 мл красный', N'Nobby', CAST(234.0000 AS Decimal(19, 4)), 10, 17)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([ID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[StatysProduct] ON 

INSERT [dbo].[StatysProduct] ([ID], [Status]) VALUES (1, N'Новый ')
INSERT [dbo].[StatysProduct] ([ID], [Status]) VALUES (2, N'Завершен')
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
SET IDENTITY_INSERT [dbo].[UserData] ON 

INSERT [dbo].[UserData] ([ID], [Surname], [Name], [Patronymic]) VALUES (1, N'Суслов', N'Илья', N'Арсентьевич')
INSERT [dbo].[UserData] ([ID], [Surname], [Name], [Patronymic]) VALUES (2, N'Яковлева', N'Ярослава', N'Даниэльевна')
INSERT [dbo].[UserData] ([ID], [Surname], [Name], [Patronymic]) VALUES (3, N'Игнатьева', N'Алина', N'Михайловна')
INSERT [dbo].[UserData] ([ID], [Surname], [Name], [Patronymic]) VALUES (4, N'Денисов', N'Михаил', N'Романович')
INSERT [dbo].[UserData] ([ID], [Surname], [Name], [Patronymic]) VALUES (5, N'Тимофеев', N'Михаил', N'Елисеевич')
INSERT [dbo].[UserData] ([ID], [Surname], [Name], [Patronymic]) VALUES (6, N'Соловьев', N'Ярослав', N'Маркович')
INSERT [dbo].[UserData] ([ID], [Surname], [Name], [Patronymic]) VALUES (7, N'Филимонов', N'Роберт', N'Васильевич')
INSERT [dbo].[UserData] ([ID], [Surname], [Name], [Patronymic]) VALUES (8, N'Шилова', N'Майя', N'Артемьевна')
INSERT [dbo].[UserData] ([ID], [Surname], [Name], [Patronymic]) VALUES (9, N'Чистякова', N'Виктория', N'Степановна')
INSERT [dbo].[UserData] ([ID], [Surname], [Name], [Patronymic]) VALUES (10, N'Волкова', N'Эмилия', N'Артёмовна')
SET IDENTITY_INSERT [dbo].[UserData] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Id_Fio])
REFERENCES [dbo].[UserData] ([ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Id_InformationEndOrder])
REFERENCES [dbo].[InformationEndOrder] ([ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Id_PointOfIssue])
REFERENCES [dbo].[PointOfIssue] ([ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_StatysProduct] FOREIGN KEY([Id_Status])
REFERENCES [dbo].[StatysProduct] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_StatysProduct]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Id_Pr__178D7CA5] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Id_Pr__178D7CA5]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([Id_Fio])
REFERENCES [dbo].[UserData] ([ID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([Id_Role])
REFERENCES [dbo].[Role] ([ID])
GO
USE [master]
GO
ALTER DATABASE [trade] SET  READ_WRITE 
GO
