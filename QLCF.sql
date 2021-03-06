USE [master]
GO
/****** Object:  Database [QuanLyQuanCafe]    Script Date: 11/06/2018 6:01:16 CH ******/
CREATE DATABASE [QuanLyQuanCafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyQuanCafe_DAT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLyQuanCafe_DAT.MDF' , SIZE = 3328KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyQuanCafe_LOG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLyQuanCafe_LOG.LDF' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyQuanCafe] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyQuanCafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanCafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyQuanCafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyQuanCafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyQuanCafe] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyQuanCafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyQuanCafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyQuanCafe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyQuanCafe] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyQuanCafe]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/06/2018 6:01:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](100) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL DEFAULT (N'Staff'),
	[Password] [varchar](100) NOT NULL DEFAULT ('123456'),
	[address] [nvarchar](100) NOT NULL,
	[phone] [int] NOT NULL,
	[gender] [bit] NOT NULL,
	[TypeAccount] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Food]    Script Date: 11/06/2018 6:01:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL DEFAULT (N'Đặt tên vào đi'),
	[price] [float] NOT NULL DEFAULT ((0)),
	[idFoodCategory] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 11/06/2018 6:01:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL DEFAULT (N'Đặt tên vào đi'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodOrder]    Script Date: 11/06/2018 6:01:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TimeCheckIn] [date] NOT NULL DEFAULT (getdate()),
	[TimeCheckOut] [date] NULL,
	[Status] [int] NOT NULL DEFAULT ((0)),
	[idFoodTable] [int] NOT NULL,
	[totalPrice] [float] NULL,
	[discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodTable]    Script Date: 11/06/2018 6:01:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](100) NOT NULL DEFAULT (N'Đặt tên vào đi'),
	[status] [nvarchar](100) NOT NULL DEFAULT (N'Trống'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/06/2018 6:01:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idFoodOrder] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[amount] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Username], [FullName], [Password], [address], [phone], [gender], [TypeAccount]) VALUES (N'huyhop', N'Huy Hợp', N'12345678', N'Hà Nội', 1648956325, 1, 1)
INSERT [dbo].[Account] ([Username], [FullName], [Password], [address], [phone], [gender], [TypeAccount]) VALUES (N'minhduc', N'Minh Đức', N'123456', N'Thanh Hóa', 95856258, 1, 1)
INSERT [dbo].[Account] ([Username], [FullName], [Password], [address], [phone], [gender], [TypeAccount]) VALUES (N'staff', N'Chính', N'1234563', N'HCM', 98989898, 1, 0)
INSERT [dbo].[Account] ([Username], [FullName], [Password], [address], [phone], [gender], [TypeAccount]) VALUES (N'tuanngoc', N'Tuấn Ngọc', N'123456', N'Hưng Yên', 975853528, 1, 0)
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [name], [price], [idFoodCategory]) VALUES (1, N'Cafe đen', 25000, 2)
INSERT [dbo].[Food] ([id], [name], [price], [idFoodCategory]) VALUES (2, N'Xúc xích', 10000, 1)
INSERT [dbo].[Food] ([id], [name], [price], [idFoodCategory]) VALUES (3, N'Cafe trắng', 30000, 2)
INSERT [dbo].[Food] ([id], [name], [price], [idFoodCategory]) VALUES (6, N'Coca đen', 11000, 2)
INSERT [dbo].[Food] ([id], [name], [price], [idFoodCategory]) VALUES (7, N'7Up Trắng', 10000, 2)
INSERT [dbo].[Food] ([id], [name], [price], [idFoodCategory]) VALUES (9, N'Nem chua rán', 30000, 3)
INSERT [dbo].[Food] ([id], [name], [price], [idFoodCategory]) VALUES (11, N'Bim bim', 5000, 3)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (1, N'Đồ ăn')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (2, N'Đồ uống')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (3, N'Đồ ăn vặt')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
SET IDENTITY_INSERT [dbo].[FoodOrder] ON 

INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (22, CAST(N'2018-05-29' AS Date), NULL, 1, 9, 30000, 0)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (23, CAST(N'2018-05-29' AS Date), NULL, 1, 8, 45000, 0)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (24, CAST(N'2018-05-29' AS Date), NULL, 1, 9, 10000, 0)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (25, CAST(N'2018-05-29' AS Date), NULL, 1, 12, 49500, 2)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (26, CAST(N'2018-05-29' AS Date), NULL, 0, 8, NULL, 10)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (27, CAST(N'2018-05-29' AS Date), NULL, 1, 12, 48000, 20)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (28, CAST(N'2018-05-29' AS Date), NULL, 1, 11, 54000, 10)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (29, CAST(N'2018-05-31' AS Date), NULL, 1, 9, 54000, 10)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (30, CAST(N'2018-05-31' AS Date), CAST(N'2018-05-31' AS Date), 1, 9, 135000, 0)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (31, CAST(N'2018-06-09' AS Date), CAST(N'2018-06-09' AS Date), 1, 9, 20000, 0)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (32, CAST(N'2018-06-09' AS Date), CAST(N'2018-06-09' AS Date), 1, 9, 18000, 10)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (33, CAST(N'2018-06-10' AS Date), CAST(N'2018-06-10' AS Date), 1, 9, 10000, 0)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (34, CAST(N'2018-06-11' AS Date), CAST(N'2018-06-11' AS Date), 1, 9, 60000, 0)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (35, CAST(N'2018-06-11' AS Date), CAST(N'2018-06-11' AS Date), 1, 9, 20000, 0)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (36, CAST(N'2018-06-11' AS Date), CAST(N'2018-06-11' AS Date), 1, 10, 20000, 0)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (37, CAST(N'2018-06-11' AS Date), CAST(N'2018-06-11' AS Date), 1, 10, 20000, 0)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (38, CAST(N'2018-06-11' AS Date), CAST(N'2018-06-11' AS Date), 1, 9, 50000, 0)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (39, CAST(N'2018-06-11' AS Date), CAST(N'2018-06-11' AS Date), 1, 9, 30000, 0)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (40, CAST(N'2018-06-11' AS Date), CAST(N'2018-06-11' AS Date), 1, 10, 40000, 0)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (41, CAST(N'2018-06-11' AS Date), CAST(N'2018-06-11' AS Date), 1, 9, 70000, 0)
INSERT [dbo].[FoodOrder] ([id], [TimeCheckIn], [TimeCheckOut], [Status], [idFoodTable], [totalPrice], [discount]) VALUES (42, CAST(N'2018-06-11' AS Date), CAST(N'2018-06-11' AS Date), 0, 10, NULL, 0)
SET IDENTITY_INSERT [dbo].[FoodOrder] OFF
SET IDENTITY_INSERT [dbo].[FoodTable] ON 

INSERT [dbo].[FoodTable] ([id], [TableName], [status]) VALUES (7, N'Bàn 1', N'Trống')
INSERT [dbo].[FoodTable] ([id], [TableName], [status]) VALUES (8, N'Bàn 2', N'Có người')
INSERT [dbo].[FoodTable] ([id], [TableName], [status]) VALUES (9, N'Bàn 3', N'Trống')
INSERT [dbo].[FoodTable] ([id], [TableName], [status]) VALUES (10, N'Bàn 4', N'Có người')
INSERT [dbo].[FoodTable] ([id], [TableName], [status]) VALUES (11, N'Bàn 5', N'Trống')
INSERT [dbo].[FoodTable] ([id], [TableName], [status]) VALUES (12, N'Bàn 6', N'Trống')
SET IDENTITY_INSERT [dbo].[FoodTable] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (25, 22, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (26, 22, 1, 2)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (27, 23, 1, 2)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (28, 24, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (29, 25, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (30, 25, 1, 2)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (31, 26, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (32, 26, 1, 2)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (33, 27, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (34, 27, 1, 2)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (35, 28, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (36, 28, 1, 2)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (37, 29, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (38, 29, 1, 2)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (39, 30, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (40, 30, 1, 2)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (41, 31, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (43, 32, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (44, 33, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (45, 34, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (46, 34, 1, 2)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (47, 35, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (48, 36, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (49, 37, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (50, 38, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (51, 39, 2, 3)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (52, 26, 6, 10)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (53, 40, 2, 1)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (54, 40, 9, 2)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (55, 41, 2, 1)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (56, 41, 9, 2)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (57, 42, 2, 1)
INSERT [dbo].[OrderDetail] ([id], [idFoodOrder], [idFood], [amount]) VALUES (58, 42, 1, 2)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_idFoodCategory_Food] FOREIGN KEY([idFoodCategory])
REFERENCES [dbo].[FoodCategory] ([id])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_idFoodCategory_Food]
GO
ALTER TABLE [dbo].[FoodOrder]  WITH CHECK ADD  CONSTRAINT [FK_idFoodTable_FoodOrder] FOREIGN KEY([idFoodTable])
REFERENCES [dbo].[FoodTable] ([id])
GO
ALTER TABLE [dbo].[FoodOrder] CHECK CONSTRAINT [FK_idFoodTable_FoodOrder]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_idFood_OrderDetail] FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_idFood_OrderDetail]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_idFoodOrder_OrderDetail] FOREIGN KEY([idFoodOrder])
REFERENCES [dbo].[FoodOrder] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_idFoodOrder_OrderDetail]
GO
/****** Object:  StoredProcedure [dbo].[GetTableList]    Script Date: 11/06/2018 6:01:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetTableList]
AS
	SELECT * FROM dbo.FoodTable

GO
/****** Object:  StoredProcedure [dbo].[Pro_InsertOrderDetail]    Script Date: 11/06/2018 6:01:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Pro_InsertOrderDetail] @idFoodOrder INT, @idFood INT, @amount INT
AS
BEGIN
	DECLARE @IsOrderDetail INT
	DECLARE @FoodAmount INT = 1

	SELECT @IsOrderDetail = id, @FoodAmount = OrderDetail.amount 
		FROM OrderDetail 
		where idFoodOrder = @idFoodOrder AND idFood = @idFood
	IF(@IsOrderDetail > 0)
	BEGIN
		DECLARE @newAmount INT = @FoodAmount + @amount
		IF(@newAmount > 0)
			UPDATE OrderDetail SET amount = @FoodAmount + @amount
		ELSE
			DELETE OrderDetail WHERE idFoodOrder = @idFoodOrder AND idFood = @idFood
	END
	ELSE
	BEGIN
		INSERT OrderDetail(idFoodOrder, idFood, amount) values(@idFoodOrder, @idFood, @amount)
	END
END

GO
/****** Object:  StoredProcedure [dbo].[proc_InsertOrder]    Script Date: 11/06/2018 6:01:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_InsertOrder]
	@idTable INT, @discount INT
AS
BEGIN
	INSERT FoodOrder(TimeCheckIn, TimeCheckOut, Status, idFoodTable, discount) values(GETDATE(), GETDATE(), 0, @idTable, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[proc_InsertOrderDetail]    Script Date: 11/06/2018 6:01:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_InsertOrderDetail] @idFoodOrder INT, @idFood INT, @amount INT
AS
BEGIN
	DECLARE @IsOrderDetail INT
	DECLARE @FoodAmount INT = 1

	SELECT @IsOrderDetail = id, @FoodAmount = OrderDetail.amount 
		FROM OrderDetail 
		where idFoodOrder = @idFoodOrder AND idFood = @idFood
	IF(@IsOrderDetail > 0)
	BEGIN
		DECLARE @newAmount INT = @FoodAmount + @amount
		IF(@newAmount > 0)
			UPDATE OrderDetail SET amount = @FoodAmount + @amount where idFood = @idFood
		ELSE
			DELETE OrderDetail WHERE idFoodOrder = @idFoodOrder AND idFood = @idFood
	END
	ELSE
	BEGIN
		INSERT OrderDetail(idFoodOrder, idFood, amount) values(@idFoodOrder, @idFood, @amount)
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LayDSThongKeTheoNgay]    Script Date: 11/06/2018 6:01:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_LayDSThongKeTheoNgay] @TimeCheckIn date, @TimeCheckOut date
AS
BEGIN
	SELECT FoodTable.TableName, FoodOrder.totalPrice, TimeCheckIn, TimeCheckOut, discount
	FROM FoodTable, FoodOrder 
	WHERE FoodTable.id = FoodOrder.idFoodTable 
	AND TimeCheckIn >= @TimeCheckIn AND TimeCheckOut <= @TimeCheckOut AND FoodOrder.status = 1
END

GO
USE [master]
GO
ALTER DATABASE [QuanLyQuanCafe] SET  READ_WRITE 
GO
