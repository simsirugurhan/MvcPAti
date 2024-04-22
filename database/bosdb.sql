USE [master]
GO
/****** Object:  Database [PatiDostu]    Script Date: 22.04.2024 19:47:18 ******/
CREATE DATABASE [PatiDostu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PatiDostu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PatiDostu.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PatiDostu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PatiDostu_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PatiDostu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PatiDostu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PatiDostu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PatiDostu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PatiDostu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PatiDostu] SET ARITHABORT OFF 
GO
ALTER DATABASE [PatiDostu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PatiDostu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PatiDostu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PatiDostu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PatiDostu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PatiDostu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PatiDostu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PatiDostu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PatiDostu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PatiDostu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PatiDostu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PatiDostu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PatiDostu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PatiDostu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PatiDostu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PatiDostu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PatiDostu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PatiDostu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PatiDostu] SET  MULTI_USER 
GO
ALTER DATABASE [PatiDostu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PatiDostu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PatiDostu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PatiDostu] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PatiDostu] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PatiDostu]
GO
/****** Object:  Table [dbo].[FiyatAraligi]    Script Date: 22.04.2024 19:47:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FiyatAraligi](
	[Id] [uniqueidentifier] NOT NULL,
	[Ad] [nvarchar](max) NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_FiyatAraligi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hayvan]    Script Date: 22.04.2024 19:47:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hayvan](
	[Id] [uniqueidentifier] NOT NULL,
	[KulDetayID] [uniqueidentifier] NOT NULL,
	[TurID] [uniqueidentifier] NOT NULL,
	[YasID] [uniqueidentifier] NOT NULL,
	[Ad] [nvarchar](max) NOT NULL,
	[Aciklama] [nvarchar](max) NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_Hayvan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayvanCins]    Script Date: 22.04.2024 19:47:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayvanCins](
	[Id] [uniqueidentifier] NOT NULL,
	[Ad] [nvarchar](max) NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_HayvanCins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayvanCinsiyet]    Script Date: 22.04.2024 19:47:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayvanCinsiyet](
	[Id] [uniqueidentifier] NOT NULL,
	[Ad] [nvarchar](20) NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_HayvanCinsiyer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayvanGaleri]    Script Date: 22.04.2024 19:47:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayvanGaleri](
	[Id] [uniqueidentifier] NOT NULL,
	[HayvanID] [uniqueidentifier] NOT NULL,
	[Foto] [nvarchar](max) NOT NULL,
	[Sira] [int] NULL,
	[Tarih] [datetime] NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_HayvanGaleri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayvanTur]    Script Date: 22.04.2024 19:47:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayvanTur](
	[Id] [uniqueidentifier] NOT NULL,
	[HayCinsID] [uniqueidentifier] NOT NULL,
	[Ad] [nvarchar](max) NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_HayvanTur] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayvanYas]    Script Date: 22.04.2024 19:47:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayvanYas](
	[Id] [uniqueidentifier] NOT NULL,
	[Ad] [nvarchar](30) NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_HayvanYas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ilan]    Script Date: 22.04.2024 19:47:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ilan](
	[Id] [uniqueidentifier] NOT NULL,
	[TurID] [uniqueidentifier] NOT NULL,
	[HayvanID] [uniqueidentifier] NOT NULL,
	[KulDetayID] [uniqueidentifier] NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_Ilan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IlanTur]    Script Date: 22.04.2024 19:47:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IlanTur](
	[Id] [uniqueidentifier] NOT NULL,
	[Ad] [nvarchar](max) NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_IlanTur] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Iletisim]    Script Date: 22.04.2024 19:47:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Iletisim](
	[Id] [uniqueidentifier] NOT NULL,
	[AdSoyad] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Mesaj] [nvarchar](max) NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_Iletisim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 22.04.2024 19:47:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[Id] [uniqueidentifier] NOT NULL,
	[AdSoyad] [nvarchar](50) NOT NULL,
	[Telefon] [nvarchar](14) NOT NULL,
	[Konum] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Parola] [nvarchar](max) NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KullaniciDetay]    Script Date: 22.04.2024 19:47:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciDetay](
	[Id] [uniqueidentifier] NOT NULL,
	[KulID] [uniqueidentifier] NOT NULL,
	[TurID] [uniqueidentifier] NOT NULL,
	[FiyatID] [uniqueidentifier] NOT NULL,
	[AdSoyad] [nvarchar](max) NOT NULL,
	[Onay] [bit] NULL,
	[Belge] [nvarchar](max) NULL,
	[Website] [nvarchar](max) NULL,
	[Facebook] [nvarchar](max) NULL,
	[Twitter] [nvarchar](max) NULL,
	[Instagram] [nvarchar](max) NULL,
	[Tarih] [datetime] NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_KullaniciDetay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KullaniciTur]    Script Date: 22.04.2024 19:47:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciTur](
	[Id] [uniqueidentifier] NOT NULL,
	[Ad] [nvarchar](30) NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_KullaniciTur] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Otel]    Script Date: 22.04.2024 19:47:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Otel](
	[Id] [uniqueidentifier] NOT NULL,
	[KulDetayID] [uniqueidentifier] NOT NULL,
	[Yayin] [bit] NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_Otel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtelGaleri]    Script Date: 22.04.2024 19:47:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtelGaleri](
	[Id] [uniqueidentifier] NOT NULL,
	[KulDetayID] [uniqueidentifier] NOT NULL,
	[OtelID] [uniqueidentifier] NOT NULL,
	[Foto] [nvarchar](max) NOT NULL,
	[Sira] [int] NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_OtelGaleri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtelTur]    Script Date: 22.04.2024 19:47:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtelTur](
	[Id] [uniqueidentifier] NOT NULL,
	[OtelID] [uniqueidentifier] NOT NULL,
	[HayTurID] [uniqueidentifier] NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_OtelTur] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[FiyatAraligi] ([Id], [Ad], [Sil]) VALUES (N'eeb90305-34d8-48e8-8120-21e82dbdb56f', N'2500-5000₺', 0)
INSERT [dbo].[FiyatAraligi] ([Id], [Ad], [Sil]) VALUES (N'8247e08f-c9ca-4dd5-ae19-5241ceec6b58', N'500-1000₺', 0)
INSERT [dbo].[FiyatAraligi] ([Id], [Ad], [Sil]) VALUES (N'03227cd2-5969-4d70-888c-643bfaeeee1f', N'1000-2500₺', 0)
INSERT [dbo].[FiyatAraligi] ([Id], [Ad], [Sil]) VALUES (N'3db044b7-aef4-4c59-a833-6d9aceb81d96', N'5000₺ ve üstü', 0)
INSERT [dbo].[FiyatAraligi] ([Id], [Ad], [Sil]) VALUES (N'61c89624-1f65-46f6-b51e-e0e40ad47499', N'0-500₺', 0)
GO
INSERT [dbo].[HayvanCins] ([Id], [Ad], [Sil]) VALUES (N'7a5a9c81-1196-4f1f-9ab2-778c204cb7d9', N'Kedi', 0)
INSERT [dbo].[HayvanCins] ([Id], [Ad], [Sil]) VALUES (N'a2b420ed-33f6-4000-a235-b18e84705cac', N'Köpek', 0)
GO
INSERT [dbo].[HayvanCinsiyet] ([Id], [Ad], [Sil]) VALUES (N'425b5836-cb79-4483-b5bb-5947b8a6aa29', N'Dişi', 0)
INSERT [dbo].[HayvanCinsiyet] ([Id], [Ad], [Sil]) VALUES (N'25a774c4-bb5f-4948-8024-7995d29f7d66', N'Erkek', 0)
GO
INSERT [dbo].[HayvanTur] ([Id], [HayCinsID], [Ad], [Sil]) VALUES (N'7743ac82-4079-4c56-9412-196f3c9d16cf', N'7a5a9c81-1196-4f1f-9ab2-778c204cb7d9', N'İran Kedisi', 0)
INSERT [dbo].[HayvanTur] ([Id], [HayCinsID], [Ad], [Sil]) VALUES (N'758a43d4-d6c8-4135-92cf-2078dfc0bbdc', N'7a5a9c81-1196-4f1f-9ab2-778c204cb7d9', N'British Shorthair', 0)
INSERT [dbo].[HayvanTur] ([Id], [HayCinsID], [Ad], [Sil]) VALUES (N'4f70e375-f550-49bf-83c2-706324de9864', N'a2b420ed-33f6-4000-a235-b18e84705cac', N'Kaniş', 0)
INSERT [dbo].[HayvanTur] ([Id], [HayCinsID], [Ad], [Sil]) VALUES (N'70928c7f-6c37-4583-88f8-741314d2b02e', N'a2b420ed-33f6-4000-a235-b18e84705cac', N'Golden Retriever', 0)
INSERT [dbo].[HayvanTur] ([Id], [HayCinsID], [Ad], [Sil]) VALUES (N'9b376aa1-9082-4da4-86d7-76d2aa611c2d', N'7a5a9c81-1196-4f1f-9ab2-778c204cb7d9', N'Siyam Kedisi', 0)
INSERT [dbo].[HayvanTur] ([Id], [HayCinsID], [Ad], [Sil]) VALUES (N'a4e19763-0991-42c3-adbf-7a11ed409bbe', N'7a5a9c81-1196-4f1f-9ab2-778c204cb7d9', N'Van Kedisi', 0)
INSERT [dbo].[HayvanTur] ([Id], [HayCinsID], [Ad], [Sil]) VALUES (N'c247566e-70e1-42fb-a50c-a09be8b11f36', N'7a5a9c81-1196-4f1f-9ab2-778c204cb7d9', N'Chartreux', 0)
INSERT [dbo].[HayvanTur] ([Id], [HayCinsID], [Ad], [Sil]) VALUES (N'6f1e7132-8f07-42fc-ab4e-a76d445a835b', N'a2b420ed-33f6-4000-a235-b18e84705cac', N'Labrador Retriever', 0)
INSERT [dbo].[HayvanTur] ([Id], [HayCinsID], [Ad], [Sil]) VALUES (N'f67cfc9c-26c3-4b49-9e67-bc1466eceed2', N'7a5a9c81-1196-4f1f-9ab2-778c204cb7d9', N'Birman Kedisi', 0)
INSERT [dbo].[HayvanTur] ([Id], [HayCinsID], [Ad], [Sil]) VALUES (N'b5d9ec6a-6c0e-4e8e-9299-ce193a00cf2d', N'7a5a9c81-1196-4f1f-9ab2-778c204cb7d9', N'Bengal Kedisi', 0)
INSERT [dbo].[HayvanTur] ([Id], [HayCinsID], [Ad], [Sil]) VALUES (N'1b86236a-6087-4d43-aae1-d85b149ed472', N'a2b420ed-33f6-4000-a235-b18e84705cac', N'Fransız Bulldog', 0)
INSERT [dbo].[HayvanTur] ([Id], [HayCinsID], [Ad], [Sil]) VALUES (N'556fa4c9-7a4c-4eaf-9b3d-d860b7ae532a', N'7a5a9c81-1196-4f1f-9ab2-778c204cb7d9', N'American Shorthair', 0)
INSERT [dbo].[HayvanTur] ([Id], [HayCinsID], [Ad], [Sil]) VALUES (N'1efc6d2e-dcbc-4396-afd5-eb95bd7d9ed7', N'a2b420ed-33f6-4000-a235-b18e84705cac', N'Sivas Kangalı', 0)
GO
INSERT [dbo].[HayvanYas] ([Id], [Ad], [Sil]) VALUES (N'70efa9bd-8089-4885-a23f-43380a2cc687', N'6-12 ay', 0)
INSERT [dbo].[HayvanYas] ([Id], [Ad], [Sil]) VALUES (N'b745d5b1-6d63-4078-a0f6-46fb3ca57e6d', N'1-3 yaş', 0)
INSERT [dbo].[HayvanYas] ([Id], [Ad], [Sil]) VALUES (N'411fa34c-4830-428f-b908-e209392099c3', N'3-6 yaş', 0)
INSERT [dbo].[HayvanYas] ([Id], [Ad], [Sil]) VALUES (N'a202bec8-410f-42e1-88f6-ebb05dfd2654', N'6 yaş ve üzeri', 0)
INSERT [dbo].[HayvanYas] ([Id], [Ad], [Sil]) VALUES (N'6f4d0009-856f-4078-9a77-fcff256d4461', N'0-6 ay', 0)
GO
INSERT [dbo].[IlanTur] ([Id], [Ad], [Sil]) VALUES (N'192c5e81-8254-44d3-90c8-152adf501c49', N'Sahiplendirme', 0)
INSERT [dbo].[IlanTur] ([Id], [Ad], [Sil]) VALUES (N'd581ab66-a7e4-4f1d-92f6-73c7c0ffc680', N'Kayıp', 0)
GO
INSERT [dbo].[KullaniciTur] ([Id], [Ad], [Sil]) VALUES (N'df88a64f-203d-493b-9c28-82ee35cf51ca', N'Pati Dostu', 0)
INSERT [dbo].[KullaniciTur] ([Id], [Ad], [Sil]) VALUES (N'7f184667-c12f-4733-8156-87c5378f4845', N'Veteriner', 0)
INSERT [dbo].[KullaniciTur] ([Id], [Ad], [Sil]) VALUES (N'8a88dc29-2854-4193-a1c1-f08d602ced0c', N'Otel', 0)
GO
ALTER TABLE [dbo].[Hayvan]  WITH CHECK ADD  CONSTRAINT [FK_Hayvan_HayvanTur] FOREIGN KEY([TurID])
REFERENCES [dbo].[HayvanTur] ([Id])
GO
ALTER TABLE [dbo].[Hayvan] CHECK CONSTRAINT [FK_Hayvan_HayvanTur]
GO
ALTER TABLE [dbo].[Hayvan]  WITH CHECK ADD  CONSTRAINT [FK_Hayvan_HayvanYas] FOREIGN KEY([YasID])
REFERENCES [dbo].[HayvanYas] ([Id])
GO
ALTER TABLE [dbo].[Hayvan] CHECK CONSTRAINT [FK_Hayvan_HayvanYas]
GO
ALTER TABLE [dbo].[Hayvan]  WITH CHECK ADD  CONSTRAINT [FK_Hayvan_KullaniciDetay] FOREIGN KEY([KulDetayID])
REFERENCES [dbo].[KullaniciDetay] ([Id])
GO
ALTER TABLE [dbo].[Hayvan] CHECK CONSTRAINT [FK_Hayvan_KullaniciDetay]
GO
ALTER TABLE [dbo].[HayvanGaleri]  WITH CHECK ADD  CONSTRAINT [FK_HayvanGaleri_Hayvan] FOREIGN KEY([HayvanID])
REFERENCES [dbo].[Hayvan] ([Id])
GO
ALTER TABLE [dbo].[HayvanGaleri] CHECK CONSTRAINT [FK_HayvanGaleri_Hayvan]
GO
ALTER TABLE [dbo].[HayvanTur]  WITH CHECK ADD  CONSTRAINT [FK_HayvanTur_HayvanCins] FOREIGN KEY([HayCinsID])
REFERENCES [dbo].[HayvanCins] ([Id])
GO
ALTER TABLE [dbo].[HayvanTur] CHECK CONSTRAINT [FK_HayvanTur_HayvanCins]
GO
ALTER TABLE [dbo].[Ilan]  WITH CHECK ADD  CONSTRAINT [FK_Ilan_Hayvan] FOREIGN KEY([HayvanID])
REFERENCES [dbo].[Hayvan] ([Id])
GO
ALTER TABLE [dbo].[Ilan] CHECK CONSTRAINT [FK_Ilan_Hayvan]
GO
ALTER TABLE [dbo].[Ilan]  WITH CHECK ADD  CONSTRAINT [FK_Ilan_IlanTur] FOREIGN KEY([TurID])
REFERENCES [dbo].[IlanTur] ([Id])
GO
ALTER TABLE [dbo].[Ilan] CHECK CONSTRAINT [FK_Ilan_IlanTur]
GO
ALTER TABLE [dbo].[Ilan]  WITH CHECK ADD  CONSTRAINT [FK_Ilan_KullaniciDetay] FOREIGN KEY([KulDetayID])
REFERENCES [dbo].[KullaniciDetay] ([Id])
GO
ALTER TABLE [dbo].[Ilan] CHECK CONSTRAINT [FK_Ilan_KullaniciDetay]
GO
ALTER TABLE [dbo].[KullaniciDetay]  WITH CHECK ADD  CONSTRAINT [FK_KullaniciDetay_FiyatAraligi] FOREIGN KEY([FiyatID])
REFERENCES [dbo].[FiyatAraligi] ([Id])
GO
ALTER TABLE [dbo].[KullaniciDetay] CHECK CONSTRAINT [FK_KullaniciDetay_FiyatAraligi]
GO
ALTER TABLE [dbo].[KullaniciDetay]  WITH CHECK ADD  CONSTRAINT [FK_KullaniciDetay_Kullanici] FOREIGN KEY([KulID])
REFERENCES [dbo].[Kullanici] ([Id])
GO
ALTER TABLE [dbo].[KullaniciDetay] CHECK CONSTRAINT [FK_KullaniciDetay_Kullanici]
GO
ALTER TABLE [dbo].[KullaniciDetay]  WITH CHECK ADD  CONSTRAINT [FK_KullaniciDetay_KullaniciTur] FOREIGN KEY([TurID])
REFERENCES [dbo].[KullaniciTur] ([Id])
GO
ALTER TABLE [dbo].[KullaniciDetay] CHECK CONSTRAINT [FK_KullaniciDetay_KullaniciTur]
GO
ALTER TABLE [dbo].[Otel]  WITH CHECK ADD  CONSTRAINT [FK_Otel_KullaniciDetay] FOREIGN KEY([KulDetayID])
REFERENCES [dbo].[KullaniciDetay] ([Id])
GO
ALTER TABLE [dbo].[Otel] CHECK CONSTRAINT [FK_Otel_KullaniciDetay]
GO
ALTER TABLE [dbo].[OtelGaleri]  WITH CHECK ADD  CONSTRAINT [FK_OtelGaleri_KullaniciDetay] FOREIGN KEY([KulDetayID])
REFERENCES [dbo].[KullaniciDetay] ([Id])
GO
ALTER TABLE [dbo].[OtelGaleri] CHECK CONSTRAINT [FK_OtelGaleri_KullaniciDetay]
GO
ALTER TABLE [dbo].[OtelGaleri]  WITH CHECK ADD  CONSTRAINT [FK_OtelGaleri_Otel] FOREIGN KEY([OtelID])
REFERENCES [dbo].[Otel] ([Id])
GO
ALTER TABLE [dbo].[OtelGaleri] CHECK CONSTRAINT [FK_OtelGaleri_Otel]
GO
ALTER TABLE [dbo].[OtelTur]  WITH CHECK ADD  CONSTRAINT [FK_OtelTur_HayvanTur] FOREIGN KEY([HayTurID])
REFERENCES [dbo].[HayvanTur] ([Id])
GO
ALTER TABLE [dbo].[OtelTur] CHECK CONSTRAINT [FK_OtelTur_HayvanTur]
GO
ALTER TABLE [dbo].[OtelTur]  WITH CHECK ADD  CONSTRAINT [FK_OtelTur_Otel] FOREIGN KEY([OtelID])
REFERENCES [dbo].[Otel] ([Id])
GO
ALTER TABLE [dbo].[OtelTur] CHECK CONSTRAINT [FK_OtelTur_Otel]
GO
USE [master]
GO
ALTER DATABASE [PatiDostu] SET  READ_WRITE 
GO
