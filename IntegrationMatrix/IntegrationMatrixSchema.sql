USE [master]
GO
/****** Object:  Database [IntegrationMatrix]    Script Date: 11/06/2009 13:17:36 ******/
CREATE DATABASE [IntegrationMatrix] ON  PRIMARY 
( NAME = N'IntegrationMatrix', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\IntegrationMatrix.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IntegrationMatrix_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\IntegrationMatrix_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO
EXEC dbo.sp_dbcmptlevel @dbname=N'IntegrationMatrix', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IntegrationMatrix].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [IntegrationMatrix] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET ARITHABORT OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [IntegrationMatrix] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IntegrationMatrix] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IntegrationMatrix] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IntegrationMatrix] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IntegrationMatrix] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IntegrationMatrix] SET  READ_WRITE 
GO
ALTER DATABASE [IntegrationMatrix] SET RECOVERY FULL 
GO
ALTER DATABASE [IntegrationMatrix] SET  MULTI_USER 
GO
ALTER DATABASE [IntegrationMatrix] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IntegrationMatrix] SET DB_CHAINING OFF 


USE [IntegrationMatrix]
GO
/****** Object:  Table [dbo].[CTI]    Script Date: 11/06/2009 13:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTI](
	[CTI_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_CTI] PRIMARY KEY CLUSTERED 
(
	[CTI_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[Feature]    Script Date: 11/06/2009 13:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[Feature_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FeatureGroup_ID] [int] NOT NULL,
	[FeatureSubGroup_ID] [int] NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[Feature_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [IntegrationMatrix]
GO
ALTER TABLE [dbo].[Feature]  WITH CHECK ADD  CONSTRAINT [FK_Feature_FeatureGroup] FOREIGN KEY([FeatureGroup_ID])
REFERENCES [dbo].[FeatureGroup] ([FeatureGroup_ID])
GO
ALTER TABLE [dbo].[Feature]  WITH CHECK ADD  CONSTRAINT [FK_Feature_FeatureSubGroup] FOREIGN KEY([FeatureSubGroup_ID])
REFERENCES [dbo].[FeatureSubGroup] ([FeatureSubGroup_ID])

/****** Object:  Table [dbo].[FeatureGroup]    Script Date: 11/06/2009 13:21:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeatureGroup](
	[FeatureGroup_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_FeatureGroup] PRIMARY KEY CLUSTERED 
(
	[FeatureGroup_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[FeatureSubGroup]    Script Date: 11/06/2009 13:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeatureSubGroup](
	[FeatureSubGroup_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_FeatureSubGroup] PRIMARY KEY CLUSTERED 
(
	[FeatureSubGroup_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


/****** Object:  Table [dbo].[Integration]    Script Date: 11/06/2009 13:22:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Integration](
	[Integration_ID] [int] IDENTITY(1,1) NOT NULL,
	[PBX_ID] [int] NOT NULL,
	[CTI_ID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
 CONSTRAINT [PK_Integration] PRIMARY KEY CLUSTERED 
(
	[Integration_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [IntegrationMatrix]
GO
ALTER TABLE [dbo].[Integration]  WITH CHECK ADD  CONSTRAINT [FK_Integration_CTI] FOREIGN KEY([CTI_ID])
REFERENCES [dbo].[CTI] ([CTI_ID])
GO
ALTER TABLE [dbo].[Integration]  WITH CHECK ADD  CONSTRAINT [FK_Integration_PBX] FOREIGN KEY([PBX_ID])
REFERENCES [dbo].[PBX] ([PBX_ID])

/****** Object:  Table [dbo].[Matrix]    Script Date: 11/06/2009 13:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matrix](
	[Matrix_ID] [int] IDENTITY(1,1) NOT NULL,
	[Integration_ID] [int] NOT NULL,
	[Feature_ID] [int] NOT NULL,
	[Status_ID] [int] NULL,
	[Note] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
 CONSTRAINT [PK_Matrix] PRIMARY KEY CLUSTERED 
(
	[Matrix_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Matrix] UNIQUE NONCLUSTERED 
(
	[Integration_ID] ASC,
	[Feature_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [IntegrationMatrix]
GO
ALTER TABLE [dbo].[Matrix]  WITH CHECK ADD  CONSTRAINT [FK_Matrix_Feature] FOREIGN KEY([Feature_ID])
REFERENCES [dbo].[Feature] ([Feature_ID])
GO
ALTER TABLE [dbo].[Matrix]  WITH CHECK ADD  CONSTRAINT [FK_Matrix_Integration] FOREIGN KEY([Integration_ID])
REFERENCES [dbo].[Integration] ([Integration_ID])
GO
ALTER TABLE [dbo].[Matrix]  WITH CHECK ADD  CONSTRAINT [FK_Matrix_Status] FOREIGN KEY([Status_ID])
REFERENCES [dbo].[Status] ([Status_ID])


/****** Object:  Table [dbo].[PBX]    Script Date: 11/06/2009 13:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PBX](
	[PBX_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PBXType_ID] [int] NOT NULL,
 CONSTRAINT [PK_PBX] PRIMARY KEY CLUSTERED 
(
	[PBX_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [IntegrationMatrix]
GO
ALTER TABLE [dbo].[PBX]  WITH CHECK ADD  CONSTRAINT [FK_PBX_PBXType] FOREIGN KEY([PBXType_ID])
REFERENCES [dbo].[PBXType] ([PBXType_ID])

/****** Object:  Table [dbo].[PBXType]    Script Date: 11/06/2009 13:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PBXType](
	[PBXType_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_PBXType] PRIMARY KEY CLUSTERED 
(
	[PBXType_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[Status]    Script Date: 11/06/2009 13:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Status_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  StoredProcedure [dbo].[GetCTIs]    Script Date: 11/06/2009 13:24:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	Get CTI Information
-- =============================================
CREATE PROCEDURE [dbo].[GetCTIs]	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    Select CTI_ID, [Name] from CTI Order By [Name]
END


/****** Object:  StoredProcedure [dbo].[GetIntegrationMatrix]    Script Date: 11/06/2009 13:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Description:	Get Integration Information
-- =============================================
CREATE PROCEDURE [dbo].[GetIntegrationMatrix]
	-- Add the parameters for the stored procedure here
	@PBXId int, 
	@CTIId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select fg.Name FeatureGroupName, 
          case when (fsg.Name <> '') then fsg.Name else 'Base Features' end  FeatureSubGroupName, 
          f.Name FeatureName,
          s.Name Status,
		  coalesce(m.Note,'') as Note
from IntegrationMatrix.dbo.Matrix m
join IntegrationMatrix.dbo.Integration i on m.Integration_ID=i.Integration_ID
join IntegrationMatrix.dbo.PBX p on p.PBX_ID=i.PBX_ID
join IntegrationMatrix.dbo.CTI c on c.CTI_ID=i.CTI_ID
join IntegrationMatrix.dbo.Feature f on f.Feature_ID=m.Feature_ID
join IntegrationMatrix.dbo.FeatureGroup fg on fg.FeatureGroup_ID=f.FeatureGroup_ID
join IntegrationMatrix.dbo.FeatureSubGroup fsg on fsg.FeatureSubGroup_ID=f.FeatureSubGroup_ID
join IntegrationMatrix.dbo.Status s on s.Status_ID=m.Status_ID
where p.PBX_ID=@PBXId
and c.CTI_ID=@CTIId
order by fg.FeatureGroup_ID, fsg.FeatureSubGroup_ID, f.Feature_ID

END


/****** Object:  StoredProcedure [dbo].[GetPBXs]    Script Date: 11/06/2009 13:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:Get PBXs information
-- =============================================
CREATE PROCEDURE [dbo].[GetPBXs] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;   
	Select PBX_ID, [Name] from PBX Order By [Name]
END
