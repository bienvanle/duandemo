USE [master]
GO
/****** Object:  Database [bdmarketing]    Script Date: 12/28/2019 01:15:06 ******/
CREATE DATABASE [bdmarketing] ON  PRIMARY 
( NAME = N'bdmarketing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\bdmarketing.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bdmarketing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\bdmarketing_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bdmarketing] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bdmarketing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bdmarketing] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [bdmarketing] SET ANSI_NULLS OFF
GO
ALTER DATABASE [bdmarketing] SET ANSI_PADDING OFF
GO
ALTER DATABASE [bdmarketing] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [bdmarketing] SET ARITHABORT OFF
GO
ALTER DATABASE [bdmarketing] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [bdmarketing] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [bdmarketing] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [bdmarketing] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [bdmarketing] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [bdmarketing] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [bdmarketing] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [bdmarketing] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [bdmarketing] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [bdmarketing] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [bdmarketing] SET  DISABLE_BROKER
GO
ALTER DATABASE [bdmarketing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [bdmarketing] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [bdmarketing] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [bdmarketing] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [bdmarketing] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [bdmarketing] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [bdmarketing] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [bdmarketing] SET  READ_WRITE
GO
ALTER DATABASE [bdmarketing] SET RECOVERY SIMPLE
GO
ALTER DATABASE [bdmarketing] SET  MULTI_USER
GO
ALTER DATABASE [bdmarketing] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [bdmarketing] SET DB_CHAINING OFF
GO
USE [bdmarketing]
GO
/****** Object:  Table [dbo].[tb_user]    Script Date: 12/28/2019 01:15:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_user](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[u_name] [nvarchar](50) NOT NULL,
	[u_email] [nvarchar](50) NOT NULL,
	[u_password] [nvarchar](50) NOT NULL,
	[u_image] [nvarchar](max) NOT NULL,
	[u_contact] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[u_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[u_email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[u_contact] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_user] ON
INSERT [dbo].[tb_user] ([u_id], [u_name], [u_email], [u_password], [u_image], [u_contact]) VALUES (1, N'Ocean', N'lebien307@gmail.com', N'sea131311', N'~/Content/upload/217442383computer.jpg', N'0779553802')
INSERT [dbo].[tb_user] ([u_id], [u_name], [u_email], [u_password], [u_image], [u_contact]) VALUES (2, N'Khanh', N'khanh@gmail.com', N'123', N'~/Content/upload/14486787931.jpg', N'7854478855')
INSERT [dbo].[tb_user] ([u_id], [u_name], [u_email], [u_password], [u_image], [u_contact]) VALUES (3, N'Đạt', N'dat@gmail.com', N'123', N'~/Content/upload/6409652442.jpg', N'0158852447')
SET IDENTITY_INSERT [dbo].[tb_user] OFF
/****** Object:  Table [dbo].[db_admin]    Script Date: 12/28/2019 01:15:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_admin](
	[ad_id] [int] IDENTITY(1,1) NOT NULL,
	[ad_username] [nvarchar](50) NOT NULL,
	[ad_password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ad_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ad_username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[db_admin] ON
INSERT [dbo].[db_admin] ([ad_id], [ad_username], [ad_password]) VALUES (1, N'admin', N'123')
INSERT [dbo].[db_admin] ([ad_id], [ad_username], [ad_password]) VALUES (2, N'bien123', N'123')
SET IDENTITY_INSERT [dbo].[db_admin] OFF
/****** Object:  Table [dbo].[db_Category]    Script Date: 12/28/2019 01:15:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_Category](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [nvarchar](50) NOT NULL,
	[cat_image] [nvarchar](max) NOT NULL,
	[cat_fk_ad] [int] NULL,
	[cat_status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cat_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[db_Category] ON
INSERT [dbo].[db_Category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (1, N'Animals', N'~/Content/upload/780819768AnimalAmerica-australian-shepherd-1-min.png', 1, 1)
INSERT [dbo].[db_Category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (2, N'Home Appliances', N'~/Content/upload/2026884172dich vu lam viec.jpg', 1, 1)
INSERT [dbo].[db_Category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (3, N'Real Estate', N'~/Content/upload/1730696541re.jpg', 1, 1)
INSERT [dbo].[db_Category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (4, N'Vehicles', N'~/Content/upload/495074531xe may.jpg', 1, 1)
INSERT [dbo].[db_Category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (5, N'Job & services', N'~/Content/upload/495984059download.jpg', 1, 1)
INSERT [dbo].[db_Category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (6, N'Furniture', N'~/Content/upload/890138624fumiture.jpg', 1, 1)
INSERT [dbo].[db_Category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (7, N'Garments', N'~/Content/upload/2101836803hangmaymac.jpg', 1, 1)
INSERT [dbo].[db_Category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (8, N'Cosmetics', N'~/Content/upload/79866814coss.jpg', 1, 1)
INSERT [dbo].[db_Category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (9, N'Books', N'~/Content/upload/1668899418book.jpg', 1, 1)
INSERT [dbo].[db_Category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (10, N'Motobikes', N'~/Content/upload/827145322motonike.jpg', 1, 1)
INSERT [dbo].[db_Category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (11, N'Moblie', N'~/Content/upload/1477185553mOBIE.jpg', 1, 1)
INSERT [dbo].[db_Category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (12, N'Computer', N'~/Content/upload/2756440computer.jpg', 1, 1)
INSERT [dbo].[db_Category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (13, N'Table', N'~/Content/upload/678620548d111.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[db_Category] OFF
/****** Object:  Table [dbo].[product]    Script Date: 12/28/2019 01:15:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_name] [nvarchar](50) NOT NULL,
	[pro_image] [nvarchar](max) NOT NULL,
	[pro_des] [nvarchar](max) NOT NULL,
	[pro_price] [int] NULL,
	[pro_fk_cat] [int] NULL,
	[pro_fk_user] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[product] ON
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_image], [pro_des], [pro_price], [pro_fk_cat], [pro_fk_user]) VALUES (4, N'chuột', N'~/Content/upload/1277172593chuothamster.jpg', N'Cưng dễ thương', NULL, 1, 2)
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_image], [pro_des], [pro_price], [pro_fk_cat], [pro_fk_user]) VALUES (5, N'PKL', N'~/Content/upload/11235771833.png', N'Cực đẹp', 15000000, 10, 3)
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_image], [pro_des], [pro_price], [pro_fk_cat], [pro_fk_user]) VALUES (6, N'PKL', N'~/Content/upload/148192389aaa.jpg', N'Cực phẩm', 1448888888, 4, 3)
SET IDENTITY_INSERT [dbo].[product] OFF
/****** Object:  ForeignKey [FK__db_Catego__cat_f__1BFD2C07]    Script Date: 12/28/2019 01:15:07 ******/
ALTER TABLE [dbo].[db_Category]  WITH CHECK ADD FOREIGN KEY([cat_fk_ad])
REFERENCES [dbo].[db_admin] ([ad_id])
GO
/****** Object:  ForeignKey [FK__product__pro_fk___20C1E124]    Script Date: 12/28/2019 01:15:07 ******/
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([pro_fk_cat])
REFERENCES [dbo].[db_Category] ([cat_id])
GO
/****** Object:  ForeignKey [FK__product__pro_fk___21B6055D]    Script Date: 12/28/2019 01:15:07 ******/
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([pro_fk_user])
REFERENCES [dbo].[tb_user] ([u_id])
GO
