USE [master]
GO
/****** Object:  Database [PatiDostu]    Script Date: 9.05.2024 16:34:15 ******/
CREATE DATABASE [PatiDostu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PatiDostu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PatiDostu.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[FiyatAraligi]    Script Date: 9.05.2024 16:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FiyatAraligi](
	[Id] [uniqueidentifier] NOT NULL,
	[Ad] [nvarchar](max) NOT NULL,
	[Sira] [int] NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_FiyatAraligi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hayvan]    Script Date: 9.05.2024 16:34:15 ******/
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
	[Tasma] [bit] NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_Hayvan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayvanCins]    Script Date: 9.05.2024 16:34:15 ******/
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
/****** Object:  Table [dbo].[HayvanCinsiyet]    Script Date: 9.05.2024 16:34:15 ******/
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
/****** Object:  Table [dbo].[HayvanGaleri]    Script Date: 9.05.2024 16:34:15 ******/
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
/****** Object:  Table [dbo].[HayvanTur]    Script Date: 9.05.2024 16:34:15 ******/
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
/****** Object:  Table [dbo].[HayvanYas]    Script Date: 9.05.2024 16:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayvanYas](
	[Id] [uniqueidentifier] NOT NULL,
	[Ad] [nvarchar](30) NOT NULL,
	[Sira] [int] NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_HayvanYas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ilan]    Script Date: 9.05.2024 16:34:15 ******/
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
	[Tamamlandi] [bit] NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_Ilan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IlanTur]    Script Date: 9.05.2024 16:34:15 ******/
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
/****** Object:  Table [dbo].[Iletisim]    Script Date: 9.05.2024 16:34:15 ******/
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
/****** Object:  Table [dbo].[Kullanici]    Script Date: 9.05.2024 16:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[Id] [uniqueidentifier] NOT NULL,
	[SehirID] [uniqueidentifier] NOT NULL,
	[AdSoyad] [nvarchar](50) NOT NULL,
	[Telefon] [nvarchar](14) NOT NULL,
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
/****** Object:  Table [dbo].[KullaniciDetay]    Script Date: 9.05.2024 16:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciDetay](
	[Id] [uniqueidentifier] NOT NULL,
	[KulID] [uniqueidentifier] NOT NULL,
	[TurID] [uniqueidentifier] NOT NULL,
	[FiyatID] [uniqueidentifier] NULL,
	[AdSoyad] [nvarchar](max) NULL,
	[ProfilFoto] [nvarchar](max) NULL,
	[Onay] [bit] NULL,
	[Belge] [nvarchar](max) NULL,
	[Aciklama] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[KullaniciTur]    Script Date: 9.05.2024 16:34:15 ******/
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
/****** Object:  Table [dbo].[Otel]    Script Date: 9.05.2024 16:34:15 ******/
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
/****** Object:  Table [dbo].[OtelGaleri]    Script Date: 9.05.2024 16:34:15 ******/
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
/****** Object:  Table [dbo].[OtelTarih]    Script Date: 9.05.2024 16:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtelTarih](
	[Id] [uniqueidentifier] NOT NULL,
	[OtelID] [uniqueidentifier] NOT NULL,
	[KapaliTarih] [datetime] NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_OtelTarih] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtelTur]    Script Date: 9.05.2024 16:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtelTur](
	[Id] [uniqueidentifier] NOT NULL,
	[OtelID] [uniqueidentifier] NOT NULL,
	[HayCinsID] [uniqueidentifier] NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_OtelTur] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sehir]    Script Date: 9.05.2024 16:34:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sehir](
	[Id] [uniqueidentifier] NOT NULL,
	[Plaka] [int] NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Sil] [bit] NOT NULL,
 CONSTRAINT [PK_Sehir] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[FiyatAraligi] ([Id], [Ad], [Sira], [Sil]) VALUES (N'eeb90305-34d8-48e8-8120-21e82dbdb56f', N'2500-5000₺', 4, 0)
INSERT [dbo].[FiyatAraligi] ([Id], [Ad], [Sira], [Sil]) VALUES (N'8247e08f-c9ca-4dd5-ae19-5241ceec6b58', N'500-1000₺', 2, 0)
INSERT [dbo].[FiyatAraligi] ([Id], [Ad], [Sira], [Sil]) VALUES (N'03227cd2-5969-4d70-888c-643bfaeeee1f', N'1000-2500₺', 3, 0)
INSERT [dbo].[FiyatAraligi] ([Id], [Ad], [Sira], [Sil]) VALUES (N'3db044b7-aef4-4c59-a833-6d9aceb81d96', N'5000₺ ve üstü', 5, 0)
INSERT [dbo].[FiyatAraligi] ([Id], [Ad], [Sira], [Sil]) VALUES (N'61c89624-1f65-46f6-b51e-e0e40ad47499', N'0-500₺', 1, 0)
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
INSERT [dbo].[HayvanYas] ([Id], [Ad], [Sira], [Sil]) VALUES (N'70efa9bd-8089-4885-a23f-43380a2cc687', N'6-12 ay', 2, 0)
INSERT [dbo].[HayvanYas] ([Id], [Ad], [Sira], [Sil]) VALUES (N'b745d5b1-6d63-4078-a0f6-46fb3ca57e6d', N'1-3 yaş', 3, 0)
INSERT [dbo].[HayvanYas] ([Id], [Ad], [Sira], [Sil]) VALUES (N'411fa34c-4830-428f-b908-e209392099c3', N'3-6 yaş', 4, 0)
INSERT [dbo].[HayvanYas] ([Id], [Ad], [Sira], [Sil]) VALUES (N'a202bec8-410f-42e1-88f6-ebb05dfd2654', N'6 yaş ve üzeri', 5, 0)
INSERT [dbo].[HayvanYas] ([Id], [Ad], [Sira], [Sil]) VALUES (N'6f4d0009-856f-4078-9a77-fcff256d4461', N'0-6 ay', 1, 0)
GO
INSERT [dbo].[IlanTur] ([Id], [Ad], [Sil]) VALUES (N'192c5e81-8254-44d3-90c8-152adf501c49', N'Sahiplendirme', 0)
INSERT [dbo].[IlanTur] ([Id], [Ad], [Sil]) VALUES (N'd581ab66-a7e4-4f1d-92f6-73c7c0ffc680', N'Kayıp', 0)
GO
INSERT [dbo].[KullaniciTur] ([Id], [Ad], [Sil]) VALUES (N'df88a64f-203d-493b-9c28-82ee35cf51ca', N'Pati Dostu', 0)
INSERT [dbo].[KullaniciTur] ([Id], [Ad], [Sil]) VALUES (N'7f184667-c12f-4733-8156-87c5378f4845', N'Veteriner', 0)
INSERT [dbo].[KullaniciTur] ([Id], [Ad], [Sil]) VALUES (N'8a88dc29-2854-4193-a1c1-f08d602ced0c', N'Otel', 0)
GO
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'afc0a38e-2351-4e80-9774-02af522a20de', 25, N'Erzurum', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'519ddd3f-6c1e-49c8-a1c3-047f70886c66', 68, N'Aksaray', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'49e6dde8-1db8-4158-aa6e-0e6b584a2c68', 19, N'Çorum', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'48824779-2a1f-4f21-ac88-1403a6a7f40d', 40, N'Kırşehir', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'3f7bcd44-eb00-41c5-a05c-16fbb23dd4ff', 16, N'Bursa', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'2b779ec3-db99-47f5-b238-1a8b97d37967', 27, N'Gaziantep', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'a8b630f8-4e20-47a1-8b59-1b474581e434', 33, N'Mersin', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'fea18935-29ca-457c-afda-215bf3bec417', 9, N'Aydın', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'58b95a77-40a1-4e25-bcf5-2718e351adc8', 64, N'Uşak', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'7df0c886-6768-4077-ab62-2b10fd509df9', 31, N'Hatay', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'08f53b1b-471e-4117-a504-2fff137407f4', 30, N'Hakkari', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'66e5d82d-fdd3-4e4c-953f-33754cae5aae', 39, N'Kırklareli', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'b504d32d-ab83-4e07-bbf8-3491d2e07f58', 15, N'Burdur', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'7568948e-def3-4b7d-b2a6-3e6fe40fc7b6', 6, N'Ankara', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'bda24511-f4c1-441a-8fe3-40599d7e7d16', 61, N'Trabzon', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'6a293bd2-edd1-43d9-b796-4096e9570b52', 76, N'Iğdır', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'6a28c247-c99e-42d1-b1a8-486402bf1496', 49, N'Muş', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'a0466595-374f-4b8b-a038-4ac084d1945e', 45, N'Manisa', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'4711ec4b-977e-4bbf-9b4e-4b47a6baa1ec', 69, N'Bayburt', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'09004e03-0a95-446d-97f9-4c776e61d81a', 79, N'Kilis', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'6e680220-307e-4b27-aff5-4d4fd7a9e238', 78, N'Karabük', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'571e1c47-1909-48c0-95a6-4f9fb66b2dc2', 57, N'Sinop', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'0b977aa8-14b5-4ba8-acf7-4ffe1b708102', 2, N'Adıyaman', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'733abb84-fa2f-4a6d-bea1-501c51008a11', 81, N'Düzce', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'dc6a63b3-003a-46f6-b749-5067e49e1ba1', 54, N'Sakarya', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'1998c540-a06a-4900-b075-5d941f178eb5', 43, N'Kütahya', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'0340c649-f5f2-45e9-bbca-5ddd45e84e1f', 12, N'Bingöl', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'2c81181b-c8bb-46e7-90f2-5e2129ceb08f', 36, N'Kars', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'dd76f5d9-883d-43de-be94-605e00aa8e49', 75, N'Ardahan', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'eeec5397-0fc8-4106-9cf7-654526c5edf6', 42, N'Konya', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'c2f6e269-4cb3-4336-8a22-68c13d60cafe', 3, N'Afyonkarahisar', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'c3d10b61-fc78-4462-919b-6b0dbe7317a8', 10, N'Balıkesir', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'52f90066-67f6-4e86-8261-6b78f3e79341', 48, N'Muğla', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'f3d53f1c-b4b3-4a42-82d1-6d2266deeeb4', 46, N'Kahramanmaraş', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'1dcc6d68-95f3-4f3e-907b-6dde619deebd', 65, N'Van', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'0898020a-a80e-4b3d-b387-6f5cced7661c', 21, N'Diyarbakır', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'24df3463-0ebf-422e-9c20-6f6fa3d2691e', 8, N'Artvin', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'8adf300f-0e00-4a1c-9fa6-7254f71cd73e', 52, N'Ordu', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'21e144f8-3461-47f8-8dc9-7368cf4e2283', 13, N'Bitlis', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'071c5dec-493d-4f2a-a355-7c9c64f91d3b', 47, N'Mardin', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'1bccba37-8dbd-4454-8764-7e5a4f192c51', 63, N'Şanlıurfa', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'bd1b9d36-0dd4-4200-83bb-7f0583a9948f', 24, N'Erzincan', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'd2b9b997-fbc2-499d-8b89-824bac097efe', 5, N'Amasya', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'5abac653-0448-4f69-9e5e-839557237980', 37, N'Kastamonu', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'31854601-1390-4c47-81c5-8577d641a377', 71, N'Kırıkkale', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'd24e56da-71ac-4990-ae50-8a2475bfd210', 66, N'Yozgat', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'7eca564e-deb5-4cbb-83fb-8d6f601e1982', 22, N'Edirne', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'25647432-cba2-42e2-84be-92c62d8e622c', 14, N'Bolu', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'899f7674-f5de-4326-8ca6-961d861b6fba', 74, N'Bartın', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'274faf65-f48d-4896-80d6-9916875bb3df', 62, N'Tunceli', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'1a462914-c726-45cc-ae39-9c548008dc6d', 80, N'Osmaniye', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'dca87594-770d-48a5-bd1b-9cb47ae4dcb5', 59, N'Tekirdağ', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'c72f6b09-59df-4c32-8855-9ea273fd6ef3', 70, N'Karaman', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'c5f36bea-2be0-4d5f-b043-9ecf28c22ec4', 38, N'Kayseri', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'3545ef89-7f15-4ad8-8b95-a41e46165c76', 4, N'Ağrı', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'0cf6efbb-b8ee-410c-95f7-a50c73e0284d', 55, N'Samsun', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'5dda04db-5821-42ea-a8b9-a92b7a846d79', 28, N'Giresun', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'e28054a6-450f-4785-8ca2-ad4d31a89596', 29, N'Gümüşhane', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'831d697c-b6d8-4af2-bb54-af9a1a300686', 53, N'Rize', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'1ef6eaa8-d6cd-40e2-8e8a-b0be8d9063cd', 50, N'Nevşehir', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'53f5edb9-06f9-40c9-8303-c4660e569900', 7, N'Antalya', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'b276279e-9a98-4dd0-b9aa-c53da5b45e41', 35, N'İzmir', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'56754670-ed45-4a0f-ba74-c968e9fb3ee8', 73, N'Şırnak', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'a5fef9de-b7a5-413b-8cb7-cdb5072b94dc', 1, N'Adana', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'a41e2b05-078f-426b-bfb1-d04d07ad5ae1', 67, N'Zonguldak', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'fe451b01-7ed3-47c6-acdd-d2beef2c0c66', 41, N'Kocaeli', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'371c19d6-9c5d-4a87-b234-d2cf3664e71e', 11, N'Bilecik', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'cd78d9a5-c4a2-4f4d-b754-d49a20358ba6', 44, N'Malatya', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'41534d06-abd4-474d-9887-ddfe6eb5b773', 18, N'Çankırı', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'74ec63bf-e912-42ec-8ed9-e0f9b1ac1247', 60, N'Tokat', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'da707205-1abe-4817-bdf8-e8e78fd28594', 23, N'Elazığ', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'f3aaba3d-7aaf-490f-86b3-ee85f11b909e', 34, N'İstanbul', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'c02733d7-90fe-405c-b2f1-f23c8f5f470a', 56, N'Siirt', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'a3816cbe-cac5-49f7-9c62-f325f7370e61', 32, N'Isparta', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'16cba50e-a2e5-44eb-ba4f-f6a2e8d8d112', 17, N'Çanakkale', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'9869609b-266f-4bf9-8f51-f97830e25532', 20, N'Denizli', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'a7709090-bce3-4cbf-bac3-f9bf23a44a2f', 58, N'Sivas', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'f8b24150-d05a-469a-9bad-fc52d9d10bdf', 26, N'Eskişehir', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'a17823cf-c052-4e1e-b4e1-fcbf0127eb17', 51, N'Niğde', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'73b35806-7784-4e77-ad2f-ff748a2c3c18', 77, N'Yalova', 0)
INSERT [dbo].[Sehir] ([Id], [Plaka], [Ad], [Sil]) VALUES (N'55038b50-cd55-4c64-a7ad-fff5638f9162', 72, N'Batman', 0)
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
ALTER TABLE [dbo].[Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_Sehir] FOREIGN KEY([SehirID])
REFERENCES [dbo].[Sehir] ([Id])
GO
ALTER TABLE [dbo].[Kullanici] CHECK CONSTRAINT [FK_Kullanici_Sehir]
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
ALTER TABLE [dbo].[OtelTarih]  WITH CHECK ADD  CONSTRAINT [FK_OtelTarih_Otel] FOREIGN KEY([OtelID])
REFERENCES [dbo].[Otel] ([Id])
GO
ALTER TABLE [dbo].[OtelTarih] CHECK CONSTRAINT [FK_OtelTarih_Otel]
GO
ALTER TABLE [dbo].[OtelTur]  WITH CHECK ADD  CONSTRAINT [FK_OtelTur_HayvanCins] FOREIGN KEY([HayCinsID])
REFERENCES [dbo].[HayvanCins] ([Id])
GO
ALTER TABLE [dbo].[OtelTur] CHECK CONSTRAINT [FK_OtelTur_HayvanCins]
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
