USE [master]
GO
/****** Object:  Database [Toko_ESEMKA]    Script Date: 21/10/2018 20.11.59 ******/
CREATE DATABASE [Toko_ESEMKA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Toko_ESEMKA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Toko_ESEMKA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Toko_ESEMKA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Toko_ESEMKA_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Toko_ESEMKA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Toko_ESEMKA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Toko_ESEMKA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET ARITHABORT OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Toko_ESEMKA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Toko_ESEMKA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Toko_ESEMKA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Toko_ESEMKA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Toko_ESEMKA] SET  MULTI_USER 
GO
ALTER DATABASE [Toko_ESEMKA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Toko_ESEMKA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Toko_ESEMKA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Toko_ESEMKA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Toko_ESEMKA] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Toko_ESEMKA]
GO
/****** Object:  Table [dbo].[tb_barang]    Script Date: 21/10/2018 20.12.00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_barang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [varchar](50) NOT NULL,
	[Distributor] [varchar](50) NOT NULL,
	[HBeli] [varchar](50) NOT NULL,
	[HJual] [varchar](50) NOT NULL,
	[Kategori] [varchar](50) NOT NULL,
	[Stok] [int] NOT NULL,
 CONSTRAINT [PK_tb_barang] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Diskon]    Script Date: 21/10/2018 20.12.00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Diskon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [varchar](50) NOT NULL,
	[WaktuMulai] [datetime] NOT NULL,
	[WaktuAkhir] [datetime] NOT NULL,
	[Diskon] [int] NOT NULL,
	[DiskonMember] [int] NOT NULL,
 CONSTRAINT [PK_tb_Diskon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_member]    Script Date: 21/10/2018 20.12.00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_member](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [varchar](50) NOT NULL,
	[Alamat] [varchar](100) NOT NULL,
	[Hp] [varchar](13) NOT NULL,
	[TglGabung] [date] NOT NULL,
 CONSTRAINT [PK_tb_member] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_pasok]    Script Date: 21/10/2018 20.12.00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_pasok](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tambah] [int] NOT NULL,
	[Pembaruan] [date] NOT NULL,
	[id_barang] [int] NOT NULL,
 CONSTRAINT [PK_tb_pasok] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Transaksi]    Script Date: 21/10/2018 20.12.00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Transaksi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMember] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdBarang] [int] NOT NULL,
	[IdDiskon] [int] NOT NULL,
	[Jumlah] [varchar](50) NOT NULL,
	[Total] [varchar](50) NOT NULL,
	[Tanggal] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_Transaksi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_user]    Script Date: 21/10/2018 20.12.00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_user](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [varchar](50) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Position] [varchar](50) NOT NULL,
	[Hp] [varchar](13) NOT NULL,
 CONSTRAINT [PK_tb_user] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_barang] ON 

INSERT [dbo].[tb_barang] ([Id], [Nama], [Distributor], [HBeli], [HJual], [Kategori], [Stok]) VALUES (1, N'Ammar1', N'PT Bingung1', N'11000', N'13000', N'sampah', 2)
INSERT [dbo].[tb_barang] ([Id], [Nama], [Distributor], [HBeli], [HJual], [Kategori], [Stok]) VALUES (2, N'Pulpun', N'PT', N'1000', N'100000', N'AT', 10)
SET IDENTITY_INSERT [dbo].[tb_barang] OFF
SET IDENTITY_INSERT [dbo].[tb_member] ON 

INSERT [dbo].[tb_member] ([Id], [Nama], [Alamat], [Hp], [TglGabung]) VALUES (2, N'Ammard', N'Desa Jetisd', N'0857134486791', CAST(N'2018-06-08' AS Date))
INSERT [dbo].[tb_member] ([Id], [Nama], [Alamat], [Hp], [TglGabung]) VALUES (4, N'Ammar', N'Jetis', N'086713456789', CAST(N'2018-06-08' AS Date))
SET IDENTITY_INSERT [dbo].[tb_member] OFF
SET IDENTITY_INSERT [dbo].[tb_user] ON 

INSERT [dbo].[tb_user] ([Id], [Nama], [Username], [Password], [Position], [Hp]) VALUES (1, N'Ammar', N'ammar', N'dfjklap', N'Admin', N'085713444859')
INSERT [dbo].[tb_user] ([Id], [Nama], [Username], [Password], [Position], [Hp]) VALUES (2, N'Weaver', N'kasir', N'kasir', N'Kasir', N'087612345509')
INSERT [dbo].[tb_user] ([Id], [Nama], [Username], [Password], [Position], [Hp]) VALUES (5, N'tupil', N'dsdsds', N'232322', N'Admin', N'121212')
INSERT [dbo].[tb_user] ([Id], [Nama], [Username], [Password], [Position], [Hp]) VALUES (6, N'akak', N'wkwk', N'wkwkland', N'Admin', N'7970808')
SET IDENTITY_INSERT [dbo].[tb_user] OFF
ALTER TABLE [dbo].[tb_pasok]  WITH CHECK ADD  CONSTRAINT [FK_tb_pasok_tb_barang] FOREIGN KEY([id_barang])
REFERENCES [dbo].[tb_barang] ([Id])
GO
ALTER TABLE [dbo].[tb_pasok] CHECK CONSTRAINT [FK_tb_pasok_tb_barang]
GO
ALTER TABLE [dbo].[tb_Transaksi]  WITH CHECK ADD  CONSTRAINT [FK_tb_Transaksi_tb_barang] FOREIGN KEY([IdBarang])
REFERENCES [dbo].[tb_barang] ([Id])
GO
ALTER TABLE [dbo].[tb_Transaksi] CHECK CONSTRAINT [FK_tb_Transaksi_tb_barang]
GO
ALTER TABLE [dbo].[tb_Transaksi]  WITH CHECK ADD  CONSTRAINT [FK_tb_Transaksi_tb_Diskon] FOREIGN KEY([IdDiskon])
REFERENCES [dbo].[tb_Diskon] ([Id])
GO
ALTER TABLE [dbo].[tb_Transaksi] CHECK CONSTRAINT [FK_tb_Transaksi_tb_Diskon]
GO
ALTER TABLE [dbo].[tb_Transaksi]  WITH CHECK ADD  CONSTRAINT [FK_tb_Transaksi_tb_member] FOREIGN KEY([IdMember])
REFERENCES [dbo].[tb_member] ([Id])
GO
ALTER TABLE [dbo].[tb_Transaksi] CHECK CONSTRAINT [FK_tb_Transaksi_tb_member]
GO
ALTER TABLE [dbo].[tb_Transaksi]  WITH CHECK ADD  CONSTRAINT [FK_tb_Transaksi_tb_user] FOREIGN KEY([IdUser])
REFERENCES [dbo].[tb_user] ([Id])
GO
ALTER TABLE [dbo].[tb_Transaksi] CHECK CONSTRAINT [FK_tb_Transaksi_tb_user]
GO
USE [master]
GO
ALTER DATABASE [Toko_ESEMKA] SET  READ_WRITE 
GO
