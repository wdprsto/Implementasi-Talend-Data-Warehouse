USE [master]
GO
/****** Object:  Database [DWH_Project]    Script Date: 5/14/2023 12:17:00 AM ******/
CREATE DATABASE [DWH_Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DWH_Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\DWH_Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DWH_Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\DWH_Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DWH_Project] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DWH_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DWH_Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DWH_Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DWH_Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DWH_Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DWH_Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [DWH_Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DWH_Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DWH_Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DWH_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DWH_Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DWH_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DWH_Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DWH_Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DWH_Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DWH_Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DWH_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DWH_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DWH_Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DWH_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DWH_Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DWH_Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DWH_Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DWH_Project] SET RECOVERY FULL 
GO
ALTER DATABASE [DWH_Project] SET  MULTI_USER 
GO
ALTER DATABASE [DWH_Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DWH_Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DWH_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DWH_Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DWH_Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DWH_Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DWH_Project', N'ON'
GO
ALTER DATABASE [DWH_Project] SET QUERY_STORE = ON
GO
ALTER DATABASE [DWH_Project] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DWH_Project]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 5/14/2023 12:17:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerId] [int] NOT NULL,
	[CustomerName] [varchar](100) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[NoHp] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProduct]    Script Date: 5/14/2023 12:17:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductId] [int] NOT NULL,
	[ProductName] [varchar](255) NOT NULL,
	[ProductCategory] [varchar](255) NOT NULL,
	[ProductUnitPrice] [int] NULL,
 CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStatusOrder]    Script Date: 5/14/2023 12:17:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStatusOrder](
	[StatusId] [int] NOT NULL,
	[StatusOrder] [varchar](50) NOT NULL,
	[StatusOrderDesc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DimStatusOrder] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSalesOrder]    Script Date: 5/14/2023 12:17:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSalesOrder](
	[OrderId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
 CONSTRAINT [PK_FactSalesOrder] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Age], [Gender], [City], [NoHp]) VALUES (201, N'BUDI SANTOSO', 45, N'Pria', N'Jakarta', N'087645465712')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Age], [Gender], [City], [NoHp]) VALUES (202, N'AJENG SRIASIH', 25, N'Wanita', N'Bogor', N'089045465712')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Age], [Gender], [City], [NoHp]) VALUES (203, N'BAGUS PRAKOSO', 20, N'Pria', N'Depok', N'087905465712')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Age], [Gender], [City], [NoHp]) VALUES (204, N'LIA RAHMAWATI', 31, N'Wanita', N'Bekasi', N'089945408712')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Age], [Gender], [City], [NoHp]) VALUES (205, N'AZMU FATI', 28, N'Pria', N'Jakarta', N'087689765712')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Age], [Gender], [City], [NoHp]) VALUES (206, N'RIFKI MUHAMMAD', 22, N'Pria', N'Depok', N'087645468907')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Age], [Gender], [City], [NoHp]) VALUES (207, N'BELA ADRILIA', 24, N'Wanita', N'Tangerang', N'087647665712')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Age], [Gender], [City], [NoHp]) VALUES (208, N'RAHMA AMELIA', 18, N'Wanita', N'Bogor', N'087645431212')
GO
INSERT [dbo].[DimProduct] ([ProductId], [ProductName], [ProductCategory], [ProductUnitPrice]) VALUES (1001, N'Macbook Air 2020 13 inch', N'Komputer & Laptop', 12000000)
INSERT [dbo].[DimProduct] ([ProductId], [ProductName], [ProductCategory], [ProductUnitPrice]) VALUES (1002, N'T-Shirt Polo Nevada', N'Pakaian', 150000)
INSERT [dbo].[DimProduct] ([ProductId], [ProductName], [ProductCategory], [ProductUnitPrice]) VALUES (1003, N'Blender Philips 500 watt', N'Elektronik', 200000)
INSERT [dbo].[DimProduct] ([ProductId], [ProductName], [ProductCategory], [ProductUnitPrice]) VALUES (1004, N'Kipas Angin Cosmos', N'Elektronik', 120000)
INSERT [dbo].[DimProduct] ([ProductId], [ProductName], [ProductCategory], [ProductUnitPrice]) VALUES (1005, N'HP Elitebook 840 G4', N'Komputer & Laptop', 10000000)
INSERT [dbo].[DimProduct] ([ProductId], [ProductName], [ProductCategory], [ProductUnitPrice]) VALUES (1006, N'Asus Zenbook 800', N'Komputer & Laptop', 9000000)
INSERT [dbo].[DimProduct] ([ProductId], [ProductName], [ProductCategory], [ProductUnitPrice]) VALUES (1007, N'Luciana Set Dress 2 in 1', N'Pakaian', 300000)
INSERT [dbo].[DimProduct] ([ProductId], [ProductName], [ProductCategory], [ProductUnitPrice]) VALUES (1008, N'Converse Cap Original', N'Topi', 180000)
INSERT [dbo].[DimProduct] ([ProductId], [ProductName], [ProductCategory], [ProductUnitPrice]) VALUES (1009, N'Pull & Bear T-Shirt', N'Pakaian', 250000)
INSERT [dbo].[DimProduct] ([ProductId], [ProductName], [ProductCategory], [ProductUnitPrice]) VALUES (1010, N'Bagpack Navy Club', N'Tas', 350000)
GO
INSERT [dbo].[DimStatusOrder] ([StatusId], [StatusOrder], [StatusOrderDesc]) VALUES (1, N'Awaiting Payment', N'Menunggu Pembayaran')
INSERT [dbo].[DimStatusOrder] ([StatusId], [StatusOrder], [StatusOrderDesc]) VALUES (2, N'Awaiting Shipment', N'Menunggu Pengiriman')
INSERT [dbo].[DimStatusOrder] ([StatusId], [StatusOrder], [StatusOrderDesc]) VALUES (3, N'Shipped', N'Sedang Dikirim')
INSERT [dbo].[DimStatusOrder] ([StatusId], [StatusOrder], [StatusOrderDesc]) VALUES (4, N'Completed', N'Pesanan sampai tujuan')
INSERT [dbo].[DimStatusOrder] ([StatusId], [StatusOrder], [StatusOrderDesc]) VALUES (5, N'Cancelled', N'Pesanan dibatalkan oleh customer')
GO
INSERT [dbo].[FactSalesOrder] ([OrderId], [CustomerId], [ProductId], [Quantity], [Amount], [StatusId], [OrderDate]) VALUES (1301, 204, 1008, 2, 360000, 2, CAST(N'2022-01-06' AS Date))
INSERT [dbo].[FactSalesOrder] ([OrderId], [CustomerId], [ProductId], [Quantity], [Amount], [StatusId], [OrderDate]) VALUES (1302, 206, 1005, 1, 10000000, 4, CAST(N'2022-01-20' AS Date))
INSERT [dbo].[FactSalesOrder] ([OrderId], [CustomerId], [ProductId], [Quantity], [Amount], [StatusId], [OrderDate]) VALUES (1303, 201, 1001, 1, 12000000, 1, CAST(N'2022-02-02' AS Date))
INSERT [dbo].[FactSalesOrder] ([OrderId], [CustomerId], [ProductId], [Quantity], [Amount], [StatusId], [OrderDate]) VALUES (1304, 202, 1002, 2, 300000, 2, CAST(N'2022-02-04' AS Date))
INSERT [dbo].[FactSalesOrder] ([OrderId], [CustomerId], [ProductId], [Quantity], [Amount], [StatusId], [OrderDate]) VALUES (1305, 203, 1003, 3, 600000, 3, CAST(N'2022-03-28' AS Date))
INSERT [dbo].[FactSalesOrder] ([OrderId], [CustomerId], [ProductId], [Quantity], [Amount], [StatusId], [OrderDate]) VALUES (1306, 206, 1006, 1, 9000000, 4, CAST(N'2022-03-15' AS Date))
INSERT [dbo].[FactSalesOrder] ([OrderId], [CustomerId], [ProductId], [Quantity], [Amount], [StatusId], [OrderDate]) VALUES (1307, 208, 1009, 1, 250000, 2, CAST(N'2022-03-09' AS Date))
INSERT [dbo].[FactSalesOrder] ([OrderId], [CustomerId], [ProductId], [Quantity], [Amount], [StatusId], [OrderDate]) VALUES (1308, 207, 1007, 2, 600000, 3, CAST(N'2022-04-28' AS Date))
INSERT [dbo].[FactSalesOrder] ([OrderId], [CustomerId], [ProductId], [Quantity], [Amount], [StatusId], [OrderDate]) VALUES (1309, 202, 1010, 1, 350000, 4, CAST(N'2022-04-22' AS Date))
INSERT [dbo].[FactSalesOrder] ([OrderId], [CustomerId], [ProductId], [Quantity], [Amount], [StatusId], [OrderDate]) VALUES (1310, 204, 1004, 2, 240000, 1, CAST(N'2022-04-25' AS Date))
GO
ALTER TABLE [dbo].[FactSalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesOrderCustomer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[DimCustomer] ([CustomerId])
GO
ALTER TABLE [dbo].[FactSalesOrder] CHECK CONSTRAINT [FK_FactSalesOrderCustomer]
GO
ALTER TABLE [dbo].[FactSalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesOrderProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[DimProduct] ([ProductId])
GO
ALTER TABLE [dbo].[FactSalesOrder] CHECK CONSTRAINT [FK_FactSalesOrderProduct]
GO
ALTER TABLE [dbo].[FactSalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesOrderStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[DimStatusOrder] ([StatusId])
GO
ALTER TABLE [dbo].[FactSalesOrder] CHECK CONSTRAINT [FK_FactSalesOrderStatus]
GO
/****** Object:  StoredProcedure [dbo].[summary_order_status]    Script Date: 5/14/2023 12:17:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[summary_order_status]
(
	@statusId int
)
AS
BEGIN
	SELECT OrderID, dc.CustomerName, dp.ProductName, fso.Quantity, dso.StatusOrder
	FROM dbo.FactSalesOrder fso
	JOIN dbo.DimCustomer dc 
		on dc.CustomerId = fso.CustomerId
	JOIN dbo.DimProduct dp
		on dp.ProductId = fso.ProductId
	JOIN dbo.DimStatusOrder dso
		on dso.StatusId = fso.StatusId
	WHERE fso.StatusId = @statusId;
END;


GO
USE [master]
GO
ALTER DATABASE [DWH_Project] SET  READ_WRITE 
GO
