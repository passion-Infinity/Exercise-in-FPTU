USE [master]
GO
/****** Object:  Database [Assignment1_NguyenLamCongDanh]    Script Date: 1/19/2021 10:50:46 PM ******/
CREATE DATABASE [Assignment1_NguyenLamCongDanh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment1_NguyenLamCongDanh', FILENAME = N'D:\App\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment1_NguyenLamCongDanh.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment1_NguyenLamCongDanh_log', FILENAME = N'D:\App\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment1_NguyenLamCongDanh_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment1_NguyenLamCongDanh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET QUERY_STORE = OFF
GO
USE [Assignment1_NguyenLamCongDanh]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 1/19/2021 10:50:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [varchar](50) NOT NULL,
	[userID] [varchar](50) NULL,
	[createdDate] [date] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 1/19/2021 10:50:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[orderID] [varchar](50) NULL,
	[productCode] [varchar](15) NULL,
	[productName] [nvarchar](100) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 1/19/2021 10:50:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productCode] [varchar](15) NOT NULL,
	[productName] [nvarchar](100) NULL,
	[description] [nvarchar](200) NULL,
	[image] [varchar](500) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[status] [bit] NULL,
	[createdDate] [date] NULL,
	[createdBy] [nvarchar](50) NULL,
	[modifiedDate] [date] NULL,
	[modifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 1/19/2021 10:50:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [varchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [varchar](30) NULL,
	[role] [varchar](15) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblOrder] ([orderID], [userID], [createdDate], [total]) VALUES (N'1611070520585', N'test', CAST(N'2021-01-19' AS Date), 2950)
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (16, N'1611070520585', N'A003', N'Banh kem', 2, 500)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (17, N'1611070520585', N'A001', N'Dua leo', 3, 150)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (18, N'1611070520585', N'A002', N'Cam', 5, 300)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'A001', N'Dua leo', N'tuoi sach', N'upload\P20-min.jpg', 12, 150, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-01-19' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'A002', N'Cam', N'to tron', N'upload\p6-min.jpg', 15, 300, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-01-19' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'A003', N'Banh kem', N'dep mat, ngon', N'upload\p12-min.jpg', 4, 500, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-01-19' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'A004', N'Keo', N'ngon', N'upload\p15-min.jpg', 25, 100, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-01-19' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'B001', N'Coffe', N'dang, ngon', N'upload\abt-4.jpg', 60, 800, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-01-19' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'B006', N'Tra sua', N'ngon', N'upload\p3-min.jpg', 30, 900, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-01-19' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'C001', N'Bo sot hem', N'ngon tuyet', N'upload\p18-min.jpg', 20, 1256, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-01-19' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'C006', N'pizza', N're, ngon', N'upload\p11-min.jpg', 30, 956.5, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-01-19' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'D100', N'Che', N'ngot ngao', N'upload\p28-min.jpg', 22, 250, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-01-19' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'D125', N'Bia ', N'ngon', NULL, 9, 65, 1, CAST(N'2020-01-19' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[tblUser] ([userID], [fullName], [password], [role]) VALUES (N'admin', N'Manager', N'123456', N'admin')
INSERT [dbo].[tblUser] ([userID], [fullName], [password], [role]) VALUES (N'danhnlcse140655@fpt.edu.vn', N'danhnlcse140655@fpt.edu.vn', N'104107202551633131784', N'member')
INSERT [dbo].[tblUser] ([userID], [fullName], [password], [role]) VALUES (N'test', N'Tester', N'123456', N'member')
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([productCode])
REFERENCES [dbo].[tblProduct] ([productCode])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
USE [master]
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET  READ_WRITE 
GO
