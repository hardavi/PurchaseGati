USE [master]
GO
/****** Object:  Database [RestaurantDB]    Script Date: 2/15/2021 11:12:55 AM ******/
CREATE DATABASE [RestaurantDB] ON  PRIMARY 
( NAME = N'RestaurantDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\RestaurantDB.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RestaurantDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\RestaurantDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RestaurantDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RestaurantDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RestaurantDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestaurantDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestaurantDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestaurantDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestaurantDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestaurantDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RestaurantDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestaurantDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestaurantDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestaurantDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RestaurantDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestaurantDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestaurantDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestaurantDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestaurantDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RestaurantDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestaurantDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestaurantDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestaurantDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RestaurantDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestaurantDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RestaurantDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestaurantDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RestaurantDB] SET  MULTI_USER 
GO
ALTER DATABASE [RestaurantDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RestaurantDB] SET DB_CHAINING OFF 
GO
USE [RestaurantDB]
GO
/****** Object:  Schema [Master]    Script Date: 2/15/2021 11:12:56 AM ******/
CREATE SCHEMA [Master]
GO
/****** Object:  Schema [Orders]    Script Date: 2/15/2021 11:12:56 AM ******/
CREATE SCHEMA [Orders]
GO
/****** Object:  Table [Master].[Customers]    Script Date: 2/15/2021 11:12:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[CustomerCode] [varchar](50) NULL,
	[CustomerNo] [bigint] NULL,
	[Company] [varchar](150) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[Items]    Script Date: 2/15/2021 11:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Items](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[ItemPrice] [decimal](18, 2) NOT NULL,
	[Tax] [float] NULL,
	[ItemImg] [varchar](900) NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[Login]    Script Date: 2/15/2021 11:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Login](
	[UserName] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Role] [varchar](15) NULL,
 CONSTRAINT [PK_Login_1] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[PaymentTypes]    Script Date: 2/15/2021 11:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[PaymentTypes](
	[PaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentTypes] PRIMARY KEY CLUSTERED 
(
	[PaymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[Register]    Script Date: 2/15/2021 11:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Register](
	[UserName] [varchar](20) NOT NULL,
	[Email_ID] [varchar](30) NOT NULL,
	[Role] [varchar](15) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Confirm_Password] [varchar](20) NOT NULL,
	[Phone_Number] [bigint] NOT NULL,
	[IsEmailVerified] [bit] NULL,
	[ActivationCode] [uniqueidentifier] NULL,
	[ResetPasswordCode] [nvarchar](100) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[Stock]    Script Date: 2/15/2021 11:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Stock](
	[Stock_Product_id] [int] IDENTITY(1,1) NOT NULL,
	[Last_Updated] [datetime] NOT NULL,
	[Instock] [bigint] NOT NULL,
	[Itemid] [int] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Stock_Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[Supplier]    Script Date: 2/15/2021 11:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Supplier](
	[Supplier_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [varchar](250) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[Contact_Number] [bigint] NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Orders].[OrderDetails]    Script Date: 2/15/2021 11:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Orders].[OrderDetails](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Tax] [float] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Orders].[Orders]    Script Date: 2/15/2021 11:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Orders].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[OrderNumber] [varchar](250) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[FinalTotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Orders].[Transaction]    Script Date: 2/15/2021 11:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Orders].[Transaction](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[TypeId] [int] NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Master].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Items] FOREIGN KEY([Itemid])
REFERENCES [Master].[Items] ([ItemId])
GO
ALTER TABLE [Master].[Stock] CHECK CONSTRAINT [FK_Stock_Items]
GO
ALTER TABLE [Orders].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Items] FOREIGN KEY([ItemId])
REFERENCES [Master].[Items] ([ItemId])
GO
ALTER TABLE [Orders].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Items]
GO
ALTER TABLE [Orders].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [Orders].[Orders] ([OrderId])
GO
ALTER TABLE [Orders].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
USE [master]
GO
ALTER DATABASE [RestaurantDB] SET  READ_WRITE 
GO
