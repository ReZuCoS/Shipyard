USE [master]
GO
/****** Object:  Database [Shipyard]    Script Date: 12/6/2021 5:32:02 AM ******/
CREATE DATABASE [Shipyard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shipyard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Shipyard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shipyard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Shipyard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Shipyard] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shipyard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shipyard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shipyard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shipyard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shipyard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shipyard] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shipyard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shipyard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shipyard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shipyard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shipyard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shipyard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shipyard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shipyard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shipyard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shipyard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shipyard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shipyard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shipyard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shipyard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shipyard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shipyard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shipyard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shipyard] SET RECOVERY FULL 
GO
ALTER DATABASE [Shipyard] SET  MULTI_USER 
GO
ALTER DATABASE [Shipyard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shipyard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shipyard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shipyard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shipyard] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shipyard] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Shipyard', N'ON'
GO
ALTER DATABASE [Shipyard] SET QUERY_STORE = OFF
GO
USE [Shipyard]
GO
/****** Object:  Table [dbo].[Accessories]    Script Date: 12/6/2021 5:32:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](300) NOT NULL,
	[Price] [decimal](15, 2) NOT NULL,
	[VAT] [int] NOT NULL,
	[Inventory] [int] NOT NULL,
	[OrderLevel] [int] NOT NULL,
	[OrderBath] [int] NOT NULL,
	[ParthnerID] [int] NOT NULL,
 CONSTRAINT [PK_Accessories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccToBoats]    Script Date: 12/6/2021 5:32:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccToBoats](
	[ConnectionID] [int] IDENTITY(1,1) NOT NULL,
	[AccessoryID] [int] NOT NULL,
	[BoatID] [int] NOT NULL,
 CONSTRAINT [PK_AccToBoats] PRIMARY KEY CLUSTERED 
(
	[ConnectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boats]    Script Date: 12/6/2021 5:32:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boats](
	[ID] [int] NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[BoatType] [nvarchar](50) NOT NULL,
	[NumberOfRowers] [int] NOT NULL,
	[Mast] [bit] NOT NULL,
	[Colour] [nvarchar](50) NOT NULL,
	[Wood] [nvarchar](50) NOT NULL,
	[BasePrice] [decimal](15, 2) NOT NULL,
	[VAT] [int] NOT NULL,
 CONSTRAINT [PK_Boats] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 12/6/2021 5:32:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ID] [int] IDENTITY(10,1) NOT NULL,
	[Date] [date] NOT NULL,
	[DepositPayed] [decimal](15, 2) NOT NULL,
	[OrderID] [int] NOT NULL,
	[TotalPrice] [decimal](15, 2) NOT NULL,
	[TotalPrice_inclVAT] [decimal](15, 2) NULL,
	[ProductionProcess] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/6/2021 5:32:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] IDENTITY(111,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[SecondName] [nvarchar](50) NOT NULL,
	[Bithday] [date] NOT NULL,
	[OrganisationName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[DocumentName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 12/6/2021 5:32:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[ID] [int] IDENTITY(11,1) NOT NULL,
	[ContractID] [int] NOT NULL,
	[Setteled] [bit] NOT NULL,
	[Sum] [decimal](15, 2) NOT NULL,
	[Sum_inclVAT] [decimal](15, 2) NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/6/2021 5:32:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ConnectionID] [int] IDENTITY(1,1) NOT NULL,
	[AccessoryID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ConnectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/6/2021 5:32:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[SalesPersonID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[BoatID] [int] NOT NULL,
	[DeliveryAddress] [nvarchar](150) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 12/6/2021 5:32:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[ID] [int] IDENTITY(9,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](150) NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesPersons]    Script Date: 12/6/2021 5:32:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPersons](
	[ID] [int] IDENTITY(99,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[SecondName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SalesPerson] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/6/2021 5:32:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserType] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 12/6/2021 5:32:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypes_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accessories] ON 

INSERT [dbo].[Accessories] ([ID], [Name], [Description], [Price], [VAT], [Inventory], [OrderLevel], [OrderBath], [ParthnerID]) VALUES (1, N'Черпак', N'Деревянный черпак, красный', CAST(2500.00 AS Decimal(15, 2)), 18, 10, 5, 5, 11)
INSERT [dbo].[Accessories] ([ID], [Name], [Description], [Price], [VAT], [Inventory], [OrderLevel], [OrderBath], [ParthnerID]) VALUES (2, N'Весло малое', N'малое весло, дубовое', CAST(3000.00 AS Decimal(15, 2)), 18, 15, 10, 10, 10)
INSERT [dbo].[Accessories] ([ID], [Name], [Description], [Price], [VAT], [Inventory], [OrderLevel], [OrderBath], [ParthnerID]) VALUES (3, N'Весло среднее', N'Среднее весло, дубовое', CAST(4000.00 AS Decimal(15, 2)), 18, 20, 10, 20, 11)
INSERT [dbo].[Accessories] ([ID], [Name], [Description], [Price], [VAT], [Inventory], [OrderLevel], [OrderBath], [ParthnerID]) VALUES (4, N'Весло большое', N'Большое весло, дубовое', CAST(6000.00 AS Decimal(15, 2)), 18, 18, 10, 20, 13)
INSERT [dbo].[Accessories] ([ID], [Name], [Description], [Price], [VAT], [Inventory], [OrderLevel], [OrderBath], [ParthnerID]) VALUES (5, N'Зонтик', N'Большой красный зонтик', CAST(4800.00 AS Decimal(15, 2)), 18, 25, 5, 15, 15)
INSERT [dbo].[Accessories] ([ID], [Name], [Description], [Price], [VAT], [Inventory], [OrderLevel], [OrderBath], [ParthnerID]) VALUES (6, N'Тент', N'Синий тент', CAST(3000.00 AS Decimal(15, 2)), 18, 20, 10, 20, 11)
INSERT [dbo].[Accessories] ([ID], [Name], [Description], [Price], [VAT], [Inventory], [OrderLevel], [OrderBath], [ParthnerID]) VALUES (7, N'Холодильник', N'Холодильник на солнечной энергии', CAST(30000.00 AS Decimal(15, 2)), 18, 3, 1, 5, 10)
INSERT [dbo].[Accessories] ([ID], [Name], [Description], [Price], [VAT], [Inventory], [OrderLevel], [OrderBath], [ParthnerID]) VALUES (8, N'Спасжилет Ж', N'Спасательный жилет для женщин', CAST(6000.00 AS Decimal(15, 2)), 18, 25, 20, 50, 12)
INSERT [dbo].[Accessories] ([ID], [Name], [Description], [Price], [VAT], [Inventory], [OrderLevel], [OrderBath], [ParthnerID]) VALUES (9, N'Спасжилет М', N'Спасательный жилет для мужчин', CAST(8000.00 AS Decimal(15, 2)), 18, 45, 20, 50, 12)
INSERT [dbo].[Accessories] ([ID], [Name], [Description], [Price], [VAT], [Inventory], [OrderLevel], [OrderBath], [ParthnerID]) VALUES (10, N'Спасжилет Д', N'Спасательный жилет для детей', CAST(4000.00 AS Decimal(15, 2)), 18, 15, 10, 25, 11)
INSERT [dbo].[Accessories] ([ID], [Name], [Description], [Price], [VAT], [Inventory], [OrderLevel], [OrderBath], [ParthnerID]) VALUES (11, N'Стандартный вахтенный журнал', N'Вахтенный журнал, 100 стр', CAST(3000.00 AS Decimal(15, 2)), 18, 25, 10, 25, 14)
INSERT [dbo].[Accessories] ([ID], [Name], [Description], [Price], [VAT], [Inventory], [OrderLevel], [OrderBath], [ParthnerID]) VALUES (12, N'Вахтенный журнал Люкс', N'Вахтенный журнал, деревянная обложка', CAST(4500.00 AS Decimal(15, 2)), 18, 15, 10, 25, 13)
INSERT [dbo].[Accessories] ([ID], [Name], [Description], [Price], [VAT], [Inventory], [OrderLevel], [OrderBath], [ParthnerID]) VALUES (13, N'Парусный спорт для спортсменов', N'Учебник по парусному спорту', CAST(1000.00 AS Decimal(15, 2)), 18, 12, 10, 20, 15)
INSERT [dbo].[Accessories] ([ID], [Name], [Description], [Price], [VAT], [Inventory], [OrderLevel], [OrderBath], [ParthnerID]) VALUES (14, N'Кепка', N'Капитанская кепка, синяя', CAST(1700.00 AS Decimal(15, 2)), 18, 24, 20, 20, 14)
SET IDENTITY_INSERT [dbo].[Accessories] OFF
GO
SET IDENTITY_INSERT [dbo].[AccToBoats] ON 

INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (1, 1, 101)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (2, 1, 201)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (3, 1, 202)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (4, 1, 301)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (5, 1, 302)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (6, 1, 303)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (7, 2, 101)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (8, 2, 201)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (9, 2, 202)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (10, 3, 101)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (11, 3, 201)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (12, 3, 202)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (13, 3, 301)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (14, 3, 302)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (15, 3, 303)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (16, 4, 303)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (17, 5, 303)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (18, 6, 101)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (19, 6, 301)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (20, 6, 302)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (21, 6, 303)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (22, 7, 303)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (23, 8, 101)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (24, 8, 201)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (25, 8, 202)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (26, 8, 301)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (27, 8, 302)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (28, 8, 303)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (29, 9, 101)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (30, 9, 201)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (31, 9, 202)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (32, 9, 301)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (33, 9, 302)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (34, 9, 303)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (35, 10, 101)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (36, 10, 202)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (37, 10, 301)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (38, 10, 302)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (39, 10, 303)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (40, 11, 201)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (41, 11, 202)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (42, 11, 301)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (43, 11, 302)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (44, 11, 303)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (45, 12, 201)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (46, 12, 202)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (47, 12, 301)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (48, 12, 302)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (49, 12, 303)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (50, 13, 201)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (51, 13, 202)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (52, 14, 101)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (53, 14, 202)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (54, 14, 301)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (55, 14, 302)
INSERT [dbo].[AccToBoats] ([ConnectionID], [AccessoryID], [BoatID]) VALUES (56, 14, 303)
SET IDENTITY_INSERT [dbo].[AccToBoats] OFF
GO
INSERT [dbo].[Boats] ([ID], [Model], [BoatType], [NumberOfRowers], [Mast], [Colour], [Wood], [BasePrice], [VAT]) VALUES (101, N'RB Стандарт', N'Шлюпка', 1, 0, N'Зеленый', N'Ель', CAST(60000.00 AS Decimal(15, 2)), 18)
INSERT [dbo].[Boats] ([ID], [Model], [BoatType], [NumberOfRowers], [Mast], [Colour], [Wood], [BasePrice], [VAT]) VALUES (201, N'SB Стандарт', N'Парусная лодка', 0, 1, N'Белый', N'Ель', CAST(280000.00 AS Decimal(15, 2)), 18)
INSERT [dbo].[Boats] ([ID], [Model], [BoatType], [NumberOfRowers], [Mast], [Colour], [Wood], [BasePrice], [VAT]) VALUES (202, N'SB Юниор', N'Парусная лодка', 0, 1, N'Красный', N'Сосна', CAST(165000.00 AS Decimal(15, 2)), 18)
INSERT [dbo].[Boats] ([ID], [Model], [BoatType], [NumberOfRowers], [Mast], [Colour], [Wood], [BasePrice], [VAT]) VALUES (301, N'G Эконом', N'Галера', 6, 0, N'Черный', N'Сосна', CAST(550000.00 AS Decimal(15, 2)), 18)
INSERT [dbo].[Boats] ([ID], [Model], [BoatType], [NumberOfRowers], [Mast], [Colour], [Wood], [BasePrice], [VAT]) VALUES (302, N'G Люкс', N'Галера', 8, 0, N'Синий', N'Дуб', CAST(750000.00 AS Decimal(15, 2)), 18)
INSERT [dbo].[Boats] ([ID], [Model], [BoatType], [NumberOfRowers], [Mast], [Colour], [Wood], [BasePrice], [VAT]) VALUES (303, N'G Супер Люкс', N'Галера', 12, 1, N'Коричневый', N'Дуб', CAST(1080000.00 AS Decimal(15, 2)), 18)
GO
SET IDENTITY_INSERT [dbo].[Contracts] ON 

INSERT [dbo].[Contracts] ([ID], [Date], [DepositPayed], [OrderID], [TotalPrice], [TotalPrice_inclVAT], [ProductionProcess]) VALUES (10, CAST(N'2015-05-04' AS Date), CAST(96500.00 AS Decimal(15, 2)), 1, CAST(289200.00 AS Decimal(15, 2)), CAST(358608.00 AS Decimal(15, 2)), N'75% готовности')
INSERT [dbo].[Contracts] ([ID], [Date], [DepositPayed], [OrderID], [TotalPrice], [TotalPrice_inclVAT], [ProductionProcess]) VALUES (11, CAST(N'2015-06-15' AS Date), CAST(250000.00 AS Decimal(15, 2)), 2, CAST(744600.00 AS Decimal(15, 2)), CAST(922884.00 AS Decimal(15, 2)), N'75% готовности')
INSERT [dbo].[Contracts] ([ID], [Date], [DepositPayed], [OrderID], [TotalPrice], [TotalPrice_inclVAT], [ProductionProcess]) VALUES (12, CAST(N'2015-09-01' AS Date), CAST(22000.00 AS Decimal(15, 2)), 3, CAST(66000.00 AS Decimal(15, 2)), CAST(81840.00 AS Decimal(15, 2)), N'Отделка лодки')
INSERT [dbo].[Contracts] ([ID], [Date], [DepositPayed], [OrderID], [TotalPrice], [TotalPrice_inclVAT], [ProductionProcess]) VALUES (13, CAST(N'2015-10-10' AS Date), CAST(99000.00 AS Decimal(15, 2)), 4, CAST(294900.00 AS Decimal(15, 2)), CAST(365466.00 AS Decimal(15, 2)), N'50% готовности')
INSERT [dbo].[Contracts] ([ID], [Date], [DepositPayed], [OrderID], [TotalPrice], [TotalPrice_inclVAT], [ProductionProcess]) VALUES (14, CAST(N'2015-10-10' AS Date), CAST(56000.00 AS Decimal(15, 2)), 5, CAST(171000.00 AS Decimal(15, 2)), CAST(211830.00 AS Decimal(15, 2)), N'Отделка лодки')
INSERT [dbo].[Contracts] ([ID], [Date], [DepositPayed], [OrderID], [TotalPrice], [TotalPrice_inclVAT], [ProductionProcess]) VALUES (15, CAST(N'2015-11-01' AS Date), CAST(195000.00 AS Decimal(15, 2)), 6, CAST(577800.00 AS Decimal(15, 2)), CAST(716052.00 AS Decimal(15, 2)), N'25% готовности')
INSERT [dbo].[Contracts] ([ID], [Date], [DepositPayed], [OrderID], [TotalPrice], [TotalPrice_inclVAT], [ProductionProcess]) VALUES (16, CAST(N'2015-03-31' AS Date), CAST(385000.00 AS Decimal(15, 2)), 7, CAST(1154400.00 AS Decimal(15, 2)), CAST(1430868.00 AS Decimal(15, 2)), N'Начато производство')
INSERT [dbo].[Contracts] ([ID], [Date], [DepositPayed], [OrderID], [TotalPrice], [TotalPrice_inclVAT], [ProductionProcess]) VALUES (17, CAST(N'2015-05-04' AS Date), CAST(257000.00 AS Decimal(15, 2)), 8, CAST(768600.00 AS Decimal(15, 2)), CAST(952644.00 AS Decimal(15, 2)), N'Работы не начаты')
SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([ID], [FirstName], [SecondName], [Bithday], [OrganisationName], [Address], [City], [Email], [Phone], [Number], [DocumentName]) VALUES (111, N'Александр', N'Порков', CAST(N'1986-05-31' AS Date), N'ООО "Венчур капитал"', N'Невский пр., д. 43', N'Санкт-Петребург', N'c.bargue@kaarinacruises.fi', N'+7 915 142-67-10', N'PP6036589', N'Паспорт РФ')
INSERT [dbo].[Customers] ([ID], [FirstName], [SecondName], [Bithday], [OrganisationName], [Address], [City], [Email], [Phone], [Number], [DocumentName]) VALUES (112, N'Евгения', N'Сатова', CAST(N'1972-08-01' AS Date), N'ООО "Калипсо"', N'Судостроителей, д. 3', N'Санкт-Петербург', N'hanna.hentonen@doublehh.com', N'+7 925 145-18-83', N'PK5533478', N'Паспорт РФ')
INSERT [dbo].[Customers] ([ID], [FirstName], [SecondName], [Bithday], [OrganisationName], [Address], [City], [Email], [Phone], [Number], [DocumentName]) VALUES (113, N'Михаил', N'Буревой', CAST(N'1960-05-03' AS Date), N'', N'ул. Ленина, 15', N'Москва', N'bjorn.bengtson@amundsen.fi', N'+7 916 341-43-20', N'452639129', N'Загранпаспорт')
INSERT [dbo].[Customers] ([ID], [FirstName], [SecondName], [Bithday], [OrganisationName], [Address], [City], [Email], [Phone], [Number], [DocumentName]) VALUES (114, N'Наталья', N'Поздникова', CAST(N'1953-07-24' AS Date), N'', N'Вишневая улица, ', N'Ростов-на-дону', N'mattim11@hotmail.com', N'+7 926 284-49-80', N'PH5663289', N'Паспорт РФ')
INSERT [dbo].[Customers] ([ID], [FirstName], [SecondName], [Bithday], [OrganisationName], [Address], [City], [Email], [Phone], [Number], [DocumentName]) VALUES (115, N'Арсений', N'Витарсо', CAST(N'1982-03-01' AS Date), N'ООО "Вартовские пряжи"', N'Проспект Жукова, 1', N'Новосибирск', N'arton@hjauoy.fi', N'+7 915 254-37-86', N'562197341', N'Загранпаспорт')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoices] ON 

INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (11, 10, 1, CAST(96400.00 AS Decimal(15, 2)), CAST(17352.00 AS Decimal(15, 2)), CAST(N'2014-05-06' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (12, 10, 1, CAST(120000.00 AS Decimal(15, 2)), CAST(21600.00 AS Decimal(15, 2)), CAST(N'2014-07-06' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (13, 10, 1, CAST(72799.80 AS Decimal(15, 2)), CAST(13103.96 AS Decimal(15, 2)), CAST(N'2014-09-06' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (14, 11, 1, CAST(248200.20 AS Decimal(15, 2)), CAST(44676.04 AS Decimal(15, 2)), CAST(N'2014-06-17' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (15, 11, 1, CAST(496399.80 AS Decimal(15, 2)), CAST(89351.96 AS Decimal(15, 2)), CAST(N'2014-09-18' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (16, 12, 1, CAST(22000.20 AS Decimal(15, 2)), CAST(3960.04 AS Decimal(15, 2)), CAST(N'2014-09-06' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (17, 12, 1, CAST(43999.80 AS Decimal(15, 2)), CAST(7919.96 AS Decimal(15, 2)), CAST(N'2014-11-12' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (18, 13, 1, CAST(98299.80 AS Decimal(15, 2)), CAST(17693.96 AS Decimal(15, 2)), CAST(N'2014-10-20' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (19, 13, 1, CAST(196600.20 AS Decimal(15, 2)), CAST(35388.04 AS Decimal(15, 2)), CAST(N'2015-01-02' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (20, 14, 1, CAST(57000.00 AS Decimal(15, 2)), CAST(10260.00 AS Decimal(15, 2)), CAST(N'2014-10-21' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (21, 14, 1, CAST(57000.00 AS Decimal(15, 2)), CAST(10260.00 AS Decimal(15, 2)), CAST(N'2014-12-15' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (22, 14, 1, CAST(57000.00 AS Decimal(15, 2)), CAST(10260.00 AS Decimal(15, 2)), CAST(N'2015-02-15' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (23, 15, 1, CAST(192600.00 AS Decimal(15, 2)), CAST(34668.00 AS Decimal(15, 2)), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (24, 15, 1, CAST(128400.00 AS Decimal(15, 2)), CAST(23112.00 AS Decimal(15, 2)), CAST(N'2015-01-02' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (25, 15, 1, CAST(128400.00 AS Decimal(15, 2)), CAST(23112.00 AS Decimal(15, 2)), CAST(N'2015-03-15' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (26, 15, 0, CAST(128400.00 AS Decimal(15, 2)), CAST(23112.00 AS Decimal(15, 2)), CAST(N'2015-05-05' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (27, 16, 1, CAST(384799.80 AS Decimal(15, 2)), CAST(69263.96 AS Decimal(15, 2)), CAST(N'2015-04-01' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (28, 16, 0, CAST(384799.80 AS Decimal(15, 2)), CAST(69263.96 AS Decimal(15, 2)), CAST(N'2015-05-02' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (29, 16, 0, CAST(384800.40 AS Decimal(15, 2)), CAST(69264.07 AS Decimal(15, 2)), CAST(N'2015-06-15' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (30, 17, 1, CAST(256200.00 AS Decimal(15, 2)), CAST(46116.00 AS Decimal(15, 2)), CAST(N'2015-05-04' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (31, 17, 0, CAST(128100.00 AS Decimal(15, 2)), CAST(23058.00 AS Decimal(15, 2)), CAST(N'2015-06-12' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (32, 17, 0, CAST(128100.00 AS Decimal(15, 2)), CAST(23058.00 AS Decimal(15, 2)), CAST(N'2015-07-12' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (33, 17, 0, CAST(128100.00 AS Decimal(15, 2)), CAST(23058.00 AS Decimal(15, 2)), CAST(N'2015-08-12' AS Date))
INSERT [dbo].[Invoices] ([ID], [ContractID], [Setteled], [Sum], [Sum_inclVAT], [Date]) VALUES (34, 17, 0, CAST(128100.00 AS Decimal(15, 2)), CAST(23058.00 AS Decimal(15, 2)), CAST(N'2015-09-12' AS Date))
SET IDENTITY_INSERT [dbo].[Invoices] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (1, 14, 1)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (2, 3, 1)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (3, 9, 1)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (4, 8, 1)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (5, 1, 2)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (6, 4, 2)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (7, 5, 2)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (8, 12, 2)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (9, 14, 2)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (10, 1, 3)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (11, 3, 3)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (12, 8, 3)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (13, 3, 4)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (14, 8, 4)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (15, 9, 4)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (16, 10, 4)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (17, 13, 4)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (18, 14, 4)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (19, 1, 5)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (20, 10, 5)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (21, 13, 5)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (22, 1, 6)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (23, 4, 6)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (24, 6, 6)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (25, 9, 6)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (26, 12, 6)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (27, 14, 6)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (28, 1, 7)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (29, 4, 7)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (30, 5, 7)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (31, 7, 7)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (32, 9, 7)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (33, 11, 7)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (34, 14, 7)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (35, 1, 8)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (36, 4, 8)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (37, 6, 8)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (38, 8, 8)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (39, 9, 8)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (40, 12, 8)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (41, 14, 8)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (42, 4, 2)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (43, 9, 6)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (44, 9, 6)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (45, 4, 7)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (46, 9, 7)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (47, 9, 7)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (48, 11, 7)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (49, 4, 8)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (50, 8, 8)
INSERT [dbo].[OrderDetails] ([ConnectionID], [AccessoryID], [OrderID]) VALUES (51, 9, 8)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [Date], [SalesPersonID], [CustomerID], [BoatID], [DeliveryAddress], [City]) VALUES (1, CAST(N'2015-05-04' AS Date), 100, 111, 201, N'Санкт-Петербург, порт', N'Санкт-Петербург')
INSERT [dbo].[Orders] ([ID], [Date], [SalesPersonID], [CustomerID], [BoatID], [DeliveryAddress], [City]) VALUES (2, CAST(N'2015-06-06' AS Date), 100, 112, 302, N'Кронштадт', N'Кронштадт')
INSERT [dbo].[Orders] ([ID], [Date], [SalesPersonID], [CustomerID], [BoatID], [DeliveryAddress], [City]) VALUES (3, CAST(N'2015-08-12' AS Date), 102, 113, 101, N'Москва, Северный порт', N'Москва')
INSERT [dbo].[Orders] ([ID], [Date], [SalesPersonID], [CustomerID], [BoatID], [DeliveryAddress], [City]) VALUES (4, CAST(N'2015-09-23' AS Date), 101, 115, 201, N'Санкт-Петербург, порт', N'Санкт-Петербург')
INSERT [dbo].[Orders] ([ID], [Date], [SalesPersonID], [CustomerID], [BoatID], [DeliveryAddress], [City]) VALUES (5, CAST(N'2015-10-04' AS Date), 103, 114, 202, N'Казань', N'Казнь')
INSERT [dbo].[Orders] ([ID], [Date], [SalesPersonID], [CustomerID], [BoatID], [DeliveryAddress], [City]) VALUES (6, CAST(N'2015-10-20' AS Date), 100, 115, 301, N'Ростов-на-Дону', N'Ростов-на-Дону')
INSERT [dbo].[Orders] ([ID], [Date], [SalesPersonID], [CustomerID], [BoatID], [DeliveryAddress], [City]) VALUES (7, CAST(N'2015-01-02' AS Date), 102, 111, 303, N'Калининград', N'Калининград')
INSERT [dbo].[Orders] ([ID], [Date], [SalesPersonID], [CustomerID], [BoatID], [DeliveryAddress], [City]) VALUES (8, CAST(N'2015-02-15' AS Date), 102, 112, 302, N'Санкт-Петербург', N'Санкт-Петербург')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([ID], [Name], [Address], [City]) VALUES (10, N'ООО"Мемфис"', N'Испания, Барселона', N'Барселона
')
INSERT [dbo].[Partners] ([ID], [Name], [Address], [City]) VALUES (11, N'ООО "Рога и копыта"', N'Сакт-петербург, Невский проспект, 41', N'Санкт-Петербург')
INSERT [dbo].[Partners] ([ID], [Name], [Address], [City]) VALUES (12, N'ЗАО "Онский сталелитейный завод', N'Онск, ул. Ленина, д 12', N'Онск')
INSERT [dbo].[Partners] ([ID], [Name], [Address], [City]) VALUES (13, N'ООО "Верфь"', N'Санкт-Петербург, Северная верфь', N'Санкт-Петербург')
INSERT [dbo].[Partners] ([ID], [Name], [Address], [City]) VALUES (14, N'ООО "Призманти"', N'Саратов, ул. Советская, д. 87', N'Саратов')
INSERT [dbo].[Partners] ([ID], [Name], [Address], [City]) VALUES (15, N'ООО "Кабель интрудшекн"', N'г. Москва, Войковская ул., д. 13А', N'Москва')
INSERT [dbo].[Partners] ([ID], [Name], [Address], [City]) VALUES (16, N'ООО "Картова елице"', N'г. Владивосток, ул. Карелии, д.2', N'Владивосток')
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesPersons] ON 

INSERT [dbo].[SalesPersons] ([ID], [FirstName], [SecondName]) VALUES (100, N'Игорь', N'Авторасков')
INSERT [dbo].[SalesPersons] ([ID], [FirstName], [SecondName]) VALUES (101, N'Екатерина', N'Иванова')
INSERT [dbo].[SalesPersons] ([ID], [FirstName], [SecondName]) VALUES (102, N'Яна', N'Свиридова')
INSERT [dbo].[SalesPersons] ([ID], [FirstName], [SecondName]) VALUES (103, N'Нина', N'Пацкирова')
SET IDENTITY_INSERT [dbo].[SalesPersons] OFF
GO
INSERT [dbo].[Users] ([Login], [Password], [Name], [UserType]) VALUES (N'admin', N'admin', N'Администратор', 2)
INSERT [dbo].[Users] ([Login], [Password], [Name], [UserType]) VALUES (N'user', N'user', N'Пользователь', 1)
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([ID], [Title]) VALUES (1, N'User')
INSERT [dbo].[UserTypes] ([ID], [Title]) VALUES (2, N'Administrator')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
GO
ALTER TABLE [dbo].[Accessories]  WITH CHECK ADD  CONSTRAINT [FK_Accessories_Partners] FOREIGN KEY([ParthnerID])
REFERENCES [dbo].[Partners] ([ID])
GO
ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_Partners]
GO
ALTER TABLE [dbo].[AccToBoats]  WITH CHECK ADD  CONSTRAINT [FK_AccToBoats_Accessories] FOREIGN KEY([AccessoryID])
REFERENCES [dbo].[Accessories] ([ID])
GO
ALTER TABLE [dbo].[AccToBoats] CHECK CONSTRAINT [FK_AccToBoats_Accessories]
GO
ALTER TABLE [dbo].[AccToBoats]  WITH CHECK ADD  CONSTRAINT [FK_AccToBoats_Boats] FOREIGN KEY([BoatID])
REFERENCES [dbo].[Boats] ([ID])
GO
ALTER TABLE [dbo].[AccToBoats] CHECK CONSTRAINT [FK_AccToBoats_Boats]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Orders]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Contracts] FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contracts] ([ID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Contracts]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Accessories] FOREIGN KEY([AccessoryID])
REFERENCES [dbo].[Accessories] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Accessories]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_SalesPersons] FOREIGN KEY([SalesPersonID])
REFERENCES [dbo].[SalesPersons] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_SalesPersons]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypes] FOREIGN KEY([UserType])
REFERENCES [dbo].[UserTypes] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypes]
GO
USE [master]
GO
ALTER DATABASE [Shipyard] SET  READ_WRITE 
GO
