﻿USE [master]
GO
/****** Object:  Database [DynThings_1_2_0]    Script Date: 2017-09-22 12:35:17 PM ******/
--Database Name:   <DataBase_Name, varChar(50) DynThingsDB>


ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [<DataBase_Name, varChar(50), DynThingsDB>].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET ARITHABORT OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET  DISABLE_BROKER 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET RECOVERY FULL 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET  MULTI_USER 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET DB_CHAINING OFF 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'<DataBase_Name, varChar(50), DynThingsDB>', N'ON'
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET QUERY_STORE = OFF
GO
USE [<DataBase_Name, varChar(50), DynThingsDB>]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [<DataBase_Name, varChar(50), DynThingsDB>]
GO
/****** Object:  Table [dbo].[Endpoints]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endpoints](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[KeyPass] [uniqueidentifier] NOT NULL,
	[PinCode] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DeviceID] [bigint] NOT NULL,
	[TypeID] [bigint] NOT NULL,
	[ThingID] [bigint] NOT NULL,
	[IsNumericOnly] [bit] NOT NULL,
	[MinValue] [real] NULL,
	[MaxValue] [real] NULL,
	[LowRange] [real] NULL,
	[HighRange] [real] NULL,
	[LastIOID] [bigint] NULL,
	[LastIONumericValue] [real] NULL,
	[LastIOValue] [nvarchar](50) NULL,
	[LastIOTimeStamp] [datetime] NULL,
	[LastIOTimeStampUTC] [datetime] NULL,
	[ObjectStatusID] [int] NOT NULL,
 CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EndPointIOs]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EndPointIOs](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EndPointID] [bigint] NOT NULL,
	[IOTypeID] [bigint] NOT NULL,
	[EndPointTypeID] [bigint] NOT NULL,
	[Valu] [nvarchar](50) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[ExecTimeStamp] [datetime] NULL,
	[ScheduleTimeStamp] [datetime] NULL,
	[TimeStamp_UTC] [datetime] NULL,
	[ExecTimeStamp_UTC] [datetime] NULL,
	[ScheduleTimeStamp_UTC] [datetime] NULL,
	[ThingID] [bigint] NOT NULL,
 CONSTRAINT [PK_DeviceIOs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[VThingEnds]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VThingEnds]
AS
SELECT        e.ThingID, e.TypeID AS EndpointTypeID, ios.IOTypeID,
                             (SELECT        TOP (1) subIos.Valu
                                FROM            dbo.EndPointIOs AS subIos INNER JOIN
                                                         dbo.Endpoints AS subEnds ON subIos.EndPointID = subEnds.ID
                                WHERE        (subIos.ThingID = e.ThingID) AND (subIos.IOTypeID = ios.IOTypeID) AND (subEnds.TypeID = e.TypeID)
                                ORDER BY subIos.ID DESC) AS LastValue
FROM            dbo.Endpoints AS e INNER JOIN
                         dbo.EndPointIOs AS ios ON e.ID = ios.EndPointID
GROUP BY e.ThingID, ios.IOTypeID, e.TypeID

GO
/****** Object:  View [dbo].[VThingEndsValues]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VThingEndsValues]
AS
SELECT        ios.ThingID, e.TypeID AS EndPointTypeID, ios.IOTypeID,
                             (SELECT        Valu
                                FROM            dbo.EndPointIOs
                                WHERE        (ID = MAX(ios.ID)) AND (ios.ThingID = ThingID) AND (ios.EndPointTypeID = EndPointTypeID) AND (ios.IOTypeID = IOTypeID)) AS LastValue,
                             (SELECT        TOP (1) Valu
                                FROM            dbo.EndPointIOs AS EndPointIOs_1
                                WHERE        (ID < MAX(ios.ID)) AND (ios.ThingID = ThingID) AND (ios.EndPointTypeID = EndPointTypeID) AND (ios.IOTypeID = IOTypeID)
                                ORDER BY ID DESC) AS PreviewsValue
FROM            dbo.EndPointIOs AS ios INNER JOIN
                         dbo.Endpoints AS e ON ios.EndPointID = e.ID
GROUP BY ios.ThingID, e.TypeID, ios.IOTypeID, ios.EndPointTypeID

GO
/****** Object:  Table [dbo].[ThingExtenstions]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThingExtenstions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](50) NULL,
	[ThingCategoryID] [bigint] NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[DataTypeID] [int] NOT NULL,
	[IsList] [bit] NOT NULL,
 CONSTRAINT [PK_ThingExtenstions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Things]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Things](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[CategoryID] [bigint] NOT NULL,
	[CreateByUser] [nvarchar](50) NULL,
	[CreateTimeStamp] [datetime] NULL,
	[UTC_Diff] [int] NOT NULL,
	[ObjectStatusID] [int] NOT NULL,
 CONSTRAINT [PK_Things] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataTypes]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DataTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThingExtenstionValues]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThingExtenstionValues](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ThingExtenstionID] [bigint] NOT NULL,
	[ThingID] [bigint] NULL,
	[Valu] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_ThingExtenstionValues] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThingCategorys]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThingCategorys](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[IconID] [bigint] NULL,
	[Code] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThingTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[VThingExtensionValues]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VThingExtensionValues]
AS
SELECT        v.ID, tc.ID AS ThingCategoryID, tc.Title AS ThingCategoryTitle, t.ID AS ThingID, t.Title AS ThingTitle, e.Title AS ValueTitle, e.DataTypeID, dt.Title AS DataTypeTitle, e.IsList, v.Valu AS Value
FROM            dbo.ThingCategorys AS tc INNER JOIN
                         dbo.ThingExtenstionValues AS v INNER JOIN
                         dbo.ThingExtenstions AS e ON v.ThingExtenstionID = e.ID INNER JOIN
                         dbo.Things AS t ON v.ThingID = t.ID INNER JOIN
                         dbo.DataTypes AS dt ON e.DataTypeID = dt.ID ON tc.ID = e.ThingCategoryID AND tc.ID = t.CategoryID

GO
/****** Object:  Table [dbo].[AlertConditions]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlertConditions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AlertID] [bigint] NOT NULL,
	[ThingID] [bigint] NOT NULL,
	[IOTypeID] [bigint] NOT NULL,
	[EndPointTypeID] [bigint] NOT NULL,
	[ConditionTypeID] [bigint] NOT NULL,
	[ConditionValue] [nvarchar](50) NOT NULL,
	[IsMust] [bit] NOT NULL,
 CONSTRAINT [PK_AlertConditions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AlertConditionTypes]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlertConditionTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_Conditions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AlertLevels]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlertLevels](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_AlertLevels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Alerts]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alerts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Sunday] [bit] NOT NULL,
	[Monday] [bit] NOT NULL,
	[Tuesday] [bit] NOT NULL,
	[Wednesday] [bit] NOT NULL,
	[Thursday] [bit] NOT NULL,
	[Friday] [bit] NOT NULL,
	[Saturday] [bit] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
 CONSTRAINT [PK_Alerts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APIMethods]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIMethods](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MethodName] [nvarchar](50) NULL,
	[Controller] [nvarchar](50) NULL,
 CONSTRAINT [PK_APIMethods] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APIUtilisations]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIUtilisations](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AppID] [bigint] NULL,
	[Token] [uniqueidentifier] NULL,
	[StatusID] [int] NOT NULL,
	[MethodID] [bigint] NOT NULL,
	[TimeStampUTC] [smalldatetime] NOT NULL,
	[Notes] [nvarchar](100) NULL,
 CONSTRAINT [PK_APIUtilizations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppAPIEntitys]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppAPIEntitys](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AppID] [bigint] NOT NULL,
	[SystemEntityID] [bigint] NOT NULL,
 CONSTRAINT [PK_AppEntitys] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppEndpointTypes]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppEndpointTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[AppID] [bigint] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Measurement] [nvarchar](50) NOT NULL,
	[TypeCategoryID] [bigint] NOT NULL,
	[IconGUID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AppEndpointTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppMediaFiles]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppMediaFiles](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[AppID] [bigint] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AppMediaFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Apps]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apps](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[Key] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[CreatedByID] [nvarchar](128) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[StatusID] [int] NOT NULL,
	[IsStoreApp] [bit] NOT NULL,
	[DevelopedByName] [nvarchar](128) NULL,
	[StoreAppLastUpdate] [datetime] NULL,
	[Version] [float] NOT NULL,
 CONSTRAINT [PK_Apps] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppStatuss]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppStatuss](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](128) NULL,
 CONSTRAINT [PK_AppStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppThingCategorys]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppThingCategorys](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[AppID] [bigint] NOT NULL,
	[IconGUID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AppThingCategorys] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppThingExtenstions]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppThingExtenstions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[AppID] [bigint] NOT NULL,
	[AppThingCategoryCode] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[DataTypeID] [int] NOT NULL,
	[IsList] [bit] NOT NULL,
 CONSTRAINT [PK_AppThingExtenstions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppUserTokens]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserTokens](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AppID] [bigint] NULL,
	[AspNetUserID] [nvarchar](128) NULL,
	[Token] [uniqueidentifier] NULL,
	[ExpireDate] [smalldatetime] NULL,
	[CreateDate] [smalldatetime] NULL,
 CONSTRAINT [PK_AppUserTokens] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[LanguageID] [int] NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeviceCommands]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceCommands](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[DeviceID] [bigint] NULL,
	[CommandCode] [nvarchar](50) NULL,
	[OwnerID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Commands] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeviceIOs]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceIOs](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DeviceID] [bigint] NULL,
	[IOTypeID] [bigint] NULL,
	[Valu] [nvarchar](250) NULL,
	[TimeStamp] [datetime] NULL,
	[ExecTimeStamp] [datetime] NULL,
	[ScheduleTimeStamp] [datetime] NULL,
	[TimeStamp_UTC] [datetime] NULL,
	[ExecTimeStamp_UTC] [datetime] NULL,
	[ScheduleTimeStamp_UTC] [datetime] NULL,
 CONSTRAINT [PK_DeviceIOs_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Devices]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devices](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NULL,
	[KeyPass] [uniqueidentifier] NULL,
	[PinCode] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[StatusID] [bigint] NULL,
	[UTC_Diff] [int] NOT NULL,
	[IsConnectedDelay] [int] NOT NULL,
	[IsConnected] [bit] NOT NULL,
	[LastConnectionTimeStamp] [datetime] NULL,
 CONSTRAINT [PK_Devices_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeviceStatus]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceStatus](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_DeviceStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DynSettings]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DynSettings](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DBVersion] [real] NOT NULL,
	[DevelopmentMode] [bit] NOT NULL,
	[DefaultRecordsPerMaster] [int] NOT NULL,
	[DefaultRecordsPerChild] [int] NOT NULL,
	[PlatformKey] [uniqueidentifier] NOT NULL,
	[PublicAccess] [bit] NOT NULL,
	[PublicSignUP] [bit] NOT NULL,
	[EnableSystemLogger] [bit] NOT NULL,
	[App_TimeZone] [int] NOT NULL,
	[PlatformTitle] [nvarchar](128) NULL,
	[LastCentralSync] [datetime] NOT NULL,
	[DeploymentTimeStamp] [datetime] NOT NULL,
	[NotifcationMail] [nvarchar](50) NULL,
	[SMTPAddress] [nvarchar](50) NULL,
	[SMTPPort] [int] NULL,
	[MapKey] [VARCHAR](255) null
 CONSTRAINT [PK_DynSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EndPointCommands]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EndPointCommands](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[EndPointID] [bigint] NULL,
	[CommandCode] [nvarchar](50) NULL,
	[OwnerID] [nvarchar](50) NULL,
 CONSTRAINT [PK_EndPointCommands] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EndPointTypeCategorys]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EndPointTypeCategorys](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EndPointTypeCategorys] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EndPointTypes]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EndPointTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[measurement] [nvarchar](50) NULL,
	[TypeCategoryID] [bigint] NULL,
	[IconID] [bigint] NULL,
 CONSTRAINT [PK_EndPointTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IOTypes]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IOTypes](
	[ID] [bigint] NOT NULL,
	[IO] [nvarchar](12) NULL,
	[Title] [nvarchar](128) NULL,
 CONSTRAINT [PK_IO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LinkDevicesLocations]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinkDevicesLocations](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[LocationID] [bigint] NULL,
	[DeviceID] [bigint] NULL,
	[StartTimeStamp] [datetime] NULL,
	[EndTimeStamp] [datetime] NULL,
	[StartByUser] [nvarchar](128) NULL,
	[EndByUser] [nvarchar](128) NULL,
 CONSTRAINT [PK_LinkDevicesLocations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LinkLocationsLocationViews]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinkLocationsLocationViews](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[LocationID] [bigint] NOT NULL,
	[LocationViewID] [bigint] NOT NULL,
 CONSTRAINT [PK_LinkLocationsLocationViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LinkThingsLocations]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinkThingsLocations](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[LocationID] [bigint] NULL,
	[ThingID] [bigint] NULL,
	[CreateByUser] [nvarchar](50) NULL,
	[CreateTimeStamp] [datetime] NULL,
 CONSTRAINT [PK_LinkThingsLocations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LinkUsersAlerts]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinkUsersAlerts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[AlertID] [bigint] NOT NULL,
 CONSTRAINT [PK_LinkUsersAlerts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Locations]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[LongitudeY] [nvarchar](50) NOT NULL,
	[LatitudeX] [nvarchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
	[Status] [bigint] NOT NULL,
	[IconID] [bigint] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LocationViews]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationViews](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[OwnerID] [nvarchar](50) NOT NULL,
	[LocationViewTypeID] [bigint] NOT NULL,
	[X] [nvarchar](50) NOT NULL,
	[Y] [nvarchar](50) NOT NULL,
	[Z] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LocationViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LocationViewTypes]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationViewTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LocationViewTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MediaFiles]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaFiles](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_MediaFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResultMessages]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultMessages](
	[ID] [bigint] NOT NULL,
	[Message] [nvarchar](500) NULL,
	[IsError] [bit] NULL,
 CONSTRAINT [PK_ErrorMessages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SystemEntitys]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemEntitys](
	[ID] [bigint] NOT NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_AppEntites] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThingEnds]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThingEnds](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ThingID] [bigint] NULL,
	[EndPointTypeID] [bigint] NULL,
	[LastIOValue] [nvarchar](50) NULL,
	[LastIOID] [bigint] NULL,
	[LastIOTimeStamp] [datetime] NULL,
	[LastIOTimeStampUTC] [datetime] NULL,
 CONSTRAINT [PK_ThingEnds] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserNotifications]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserNotifications](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[IsRead] [bigint] NULL,
	[Txt] [nvarchar](512) NULL,
	[NotificationTypeID] [bigint] NULL,
	[RefID] [bigint] NULL,
	[AlertTimeStamp] [datetime] NULL,
	[IsEmailSent] [bit] NULL,
 CONSTRAINT [PK_UserNotifications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserNotificationTypes]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserNotificationTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](512) NULL,
 CONSTRAINT [PK_UserNotificationTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET IDENTITY_INSERT [dbo].[AlertConditionTypes] ON 
GO
INSERT [dbo].[AlertConditionTypes] ([ID], [Title]) VALUES (1, N'equal to')
GO
INSERT [dbo].[AlertConditionTypes] ([ID], [Title]) VALUES (2, N'not equal to')
GO
INSERT [dbo].[AlertConditionTypes] ([ID], [Title]) VALUES (3, N'greater than')
GO
INSERT [dbo].[AlertConditionTypes] ([ID], [Title]) VALUES (4, N'less than')
GO
SET IDENTITY_INSERT [dbo].[AlertConditionTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[AlertLevels] ON 

GO
INSERT [dbo].[AlertLevels] ([ID], [Title]) VALUES (1, N'Low')
GO
INSERT [dbo].[AlertLevels] ([ID], [Title]) VALUES (2, N'Medium')
GO
INSERT [dbo].[AlertLevels] ([ID], [Title]) VALUES (3, N'High')
GO
INSERT [dbo].[AlertLevels] ([ID], [Title]) VALUES (4, N'Critical')
GO
SET IDENTITY_INSERT [dbo].[AlertLevels] OFF
GO

SET IDENTITY_INSERT [dbo].[APIMethods] ON 
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (1, N'GetLocationViews', N'LocationViews')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (2, N'GetLocations', N'Locations')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (3, N'GetTokenInfo', N'Tokens')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (4, N'ValidateToken', N'Tokens')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (5, N'ValidateTokenEntityPermission', N'Tokens')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (6, N'GetNewToken', N'Tokens')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (7, N'GetInfo', N'Apps')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (8, N'GetDevices', N'Devices')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (9, N'GetThingEnds', N'ThingEnds')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (10, N'GetThings', N'Things')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (11, N'GetEndPoints', N'EndPoints')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (12, N'GetDeviceCommands', N'DeviceCommands')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (13, N'GetEndPointCommands', N'EndPointCommands')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (14, N'GetEndpointsWithWarnings', N'EndPoints')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (15, N'GetLocationsWithWarnings', N'Locations')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (16, N'GetWarnings', N'IOWarnings')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (17, N'GetLocationViewsWithWarnings', N'LocationViews')
GO
INSERT [dbo].[APIMethods] ([ID], [MethodName], [Controller]) VALUES (18, N'GetThingsWithWarnings', N'Things')
GO
SET IDENTITY_INSERT [dbo].[APIMethods] OFF
GO

INSERT [dbo].[AppStatuss] ([ID], [Title]) VALUES (1, N'New')
GO
INSERT [dbo].[AppStatuss] ([ID], [Title]) VALUES (2, N'Under Development')
GO
INSERT [dbo].[AppStatuss] ([ID], [Title]) VALUES (3, N'Published')
GO
INSERT [dbo].[AppStatuss] ([ID], [Title]) VALUES (4, N'UnPublished')
GO
INSERT [dbo].[AppStatuss] ([ID], [Title]) VALUES (5, N'Published - Changes')
GO

INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Monitor & Control')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'Monitor Only')
GO

SET IDENTITY_INSERT [dbo].[DataTypes] ON 
GO
INSERT [dbo].[DataTypes] ([ID], [Title]) VALUES (1, N'Text')
GO
INSERT [dbo].[DataTypes] ([ID], [Title]) VALUES (2, N'Number (no decimals)')
GO
INSERT [dbo].[DataTypes] ([ID], [Title]) VALUES (3, N'Number (with decimals)')
GO
INSERT [dbo].[DataTypes] ([ID], [Title]) VALUES (4, N'Date')
GO
INSERT [dbo].[DataTypes] ([ID], [Title]) VALUES (5, N'Time')
GO
INSERT [dbo].[DataTypes] ([ID], [Title]) VALUES (6, N'IP Address')
GO
INSERT [dbo].[DataTypes] ([ID], [Title]) VALUES (7, N'Boolean')
GO
INSERT [dbo].[DataTypes] ([ID], [Title]) VALUES (8, N'Geo Location')
GO
SET IDENTITY_INSERT [dbo].[DataTypes] OFF
GO

SET IDENTITY_INSERT [dbo].[DeviceStatus] ON 
GO
INSERT [dbo].[DeviceStatus] ([ID], [Title]) VALUES (1, N'New')
GO
INSERT [dbo].[DeviceStatus] ([ID], [Title]) VALUES (2, N'Connected')
GO
INSERT [dbo].[DeviceStatus] ([ID], [Title]) VALUES (3, N'Disonnected')
GO
INSERT [dbo].[DeviceStatus] ([ID], [Title]) VALUES (4, N'Deleted')
GO
SET IDENTITY_INSERT [dbo].[DeviceStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[DynSettings] ON 

GO
INSERT [dbo].[DynSettings] ([ID], [DBVersion], [DevelopmentMode], [DefaultRecordsPerMaster], [DefaultRecordsPerChild], [PlatformKey], [PublicAccess], [PublicSignUP], [EnableSystemLogger], [App_TimeZone], [PlatformTitle], [LastCentralSync], [DeploymentTimeStamp], [NotifcationMail], [SMTPAddress], [SMTPPort]) VALUES (1, 1.2, 1, 25, 5, newID(), 0, 1, 1, 4, N'', getDate(), GetDate(), N'', N'', 25)
GO
SET IDENTITY_INSERT [dbo].[DynSettings] OFF
GO

SET IDENTITY_INSERT [dbo].[EndPointTypeCategorys] ON 

GO
INSERT [dbo].[EndPointTypeCategorys] ([ID], [Title]) VALUES (1, N'Input Only')
GO
INSERT [dbo].[EndPointTypeCategorys] ([ID], [Title]) VALUES (2, N'Output Only')
GO
INSERT [dbo].[EndPointTypeCategorys] ([ID], [Title]) VALUES (3, N'Complex')
GO
SET IDENTITY_INSERT [dbo].[EndPointTypeCategorys] OFF
GO

INSERT [dbo].[IOTypes] ([ID], [IO], [Title]) VALUES (1, N'I', N'Input')
GO
INSERT [dbo].[IOTypes] ([ID], [IO], [Title]) VALUES (2, N'C', N'Command')
GO
INSERT [dbo].[IOTypes] ([ID], [IO], [Title]) VALUES (3, N'L', N'Log')
GO

SET IDENTITY_INSERT [dbo].[LocationViewTypes] ON
GO
INSERT [dbo].[LocationViewTypes] ([ID], [Title]) VALUES (1, N'Single Location')
GO
INSERT [dbo].[LocationViewTypes] ([ID], [Title]) VALUES (2, N'Thumbnails')
GO
INSERT [dbo].[LocationViewTypes] ([ID], [Title]) VALUES (3, N'Map')
GO
INSERT [dbo].[LocationViewTypes] ([ID], [Title]) VALUES (4, N'List')
GO
INSERT [dbo].[LocationViewTypes] ([ID], [Title]) VALUES (5, N'List & Map (Mobile: List only)')
GO
INSERT [dbo].[LocationViewTypes] ([ID], [Title]) VALUES (6, N'List & Map (Mobile: Map only)')
GO
SET IDENTITY_INSERT [dbo].[LocationViewTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[MediaFiles] ON 

GO
INSERT [dbo].[MediaFiles] ([ID], [GUID], [Title]) VALUES (1, N'd7527c05-abdd-4f8c-a734-89a67462a3ba', N'Sensor')
GO
INSERT [dbo].[MediaFiles] ([ID], [GUID], [Title]) VALUES (2, N'643fef15-2ef5-448a-9611-b02e1cc17746', N'Actuator')
GO
SET IDENTITY_INSERT [dbo].[MediaFiles] OFF
GO

INSERT [dbo].[ResultMessages] ([ID], [Message], [IsError]) VALUES (0, N'Ok', 0)
GO
INSERT [dbo].[ResultMessages] ([ID], [Message], [IsError]) VALUES (1, N'Generic Error', 1)
GO
INSERT [dbo].[ResultMessages] ([ID], [Message], [IsError]) VALUES (2, N'Device GUID not found', 1)
GO
INSERT [dbo].[ResultMessages] ([ID], [Message], [IsError]) VALUES (3, N'EndPoint GUID not Found', 1)
GO
INSERT [dbo].[ResultMessages] ([ID], [Message], [IsError]) VALUES (4, N'The selected LocationView is already attached to this record', 1)
GO
INSERT [dbo].[ResultMessages] ([ID], [Message], [IsError]) VALUES (5, N'The selected Location is already attached to this record', 1)
GO
INSERT [dbo].[SystemEntitys] ([ID], [Title]) VALUES (1, N'EndPoints')
GO
INSERT [dbo].[SystemEntitys] ([ID], [Title]) VALUES (2, N'EndPoints Commands')
GO
INSERT [dbo].[SystemEntitys] ([ID], [Title]) VALUES (3, N'EndPoints IOs')
GO
INSERT [dbo].[SystemEntitys] ([ID], [Title]) VALUES (4, N'Devices')
GO
INSERT [dbo].[SystemEntitys] ([ID], [Title]) VALUES (5, N'Devices Commands')
GO
INSERT [dbo].[SystemEntitys] ([ID], [Title]) VALUES (6, N'Devices IOs')
GO
INSERT [dbo].[SystemEntitys] ([ID], [Title]) VALUES (7, N'Locations')
GO
INSERT [dbo].[SystemEntitys] ([ID], [Title]) VALUES (8, N'Views')
GO
INSERT [dbo].[SystemEntitys] ([ID], [Title]) VALUES (9, N'Alerts')
GO
INSERT [dbo].[SystemEntitys] ([ID], [Title]) VALUES (10, N'Users')
GO
INSERT [dbo].[SystemEntitys] ([ID], [Title]) VALUES (11, N'Things')
GO
INSERT [dbo].[SystemEntitys] ([ID], [Title]) VALUES (12, N'ThingEnds')
GO
INSERT [dbo].[SystemEntitys] ([ID], [Title]) VALUES (13, N'IO Warnings')
GO

SET IDENTITY_INSERT [dbo].[UserNotificationTypes] ON 

GO
INSERT [dbo].[UserNotificationTypes] ([ID], [Title]) VALUES (1, N'Alert- EndPoint Input')
GO
SET IDENTITY_INSERT [dbo].[UserNotificationTypes] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2017-09-22 12:35:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2017-09-22 12:35:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2017-09-22 12:35:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 2017-09-22 12:35:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2017-09-22 12:35:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 2017-09-22 12:35:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AlertConditions]  WITH CHECK ADD  CONSTRAINT [FK__AlertCond__Alert__7720AD13] FOREIGN KEY([AlertID])
REFERENCES [dbo].[Alerts] ([ID])
GO
ALTER TABLE [dbo].[AlertConditions] CHECK CONSTRAINT [FK__AlertCond__Alert__7720AD13]
GO
ALTER TABLE [dbo].[AlertConditions]  WITH CHECK ADD  CONSTRAINT [FK__AlertCond__Condi__74444068] FOREIGN KEY([ConditionTypeID])
REFERENCES [dbo].[AlertConditionTypes] ([ID])
GO
ALTER TABLE [dbo].[AlertConditions] CHECK CONSTRAINT [FK__AlertCond__Condi__74444068]
GO
ALTER TABLE [dbo].[AlertConditions]  WITH CHECK ADD  CONSTRAINT [FK__AlertCond__EndPo__0662F0A3] FOREIGN KEY([EndPointTypeID])
REFERENCES [dbo].[EndPointTypes] ([ID])
GO
ALTER TABLE [dbo].[AlertConditions] CHECK CONSTRAINT [FK__AlertCond__EndPo__0662F0A3]
GO
ALTER TABLE [dbo].[AlertConditions]  WITH CHECK ADD  CONSTRAINT [FK__AlertCond__IOTyp__056ECC6A] FOREIGN KEY([IOTypeID])
REFERENCES [dbo].[IOTypes] ([ID])
GO
ALTER TABLE [dbo].[AlertConditions] CHECK CONSTRAINT [FK__AlertCond__IOTyp__056ECC6A]
GO
ALTER TABLE [dbo].[AlertConditions]  WITH CHECK ADD  CONSTRAINT [FK__AlertCond__Thing__762C88DA] FOREIGN KEY([ThingID])
REFERENCES [dbo].[Things] ([ID])
GO
ALTER TABLE [dbo].[AlertConditions] CHECK CONSTRAINT [FK__AlertCond__Thing__762C88DA]
GO
ALTER TABLE [dbo].[APIUtilisations]  WITH CHECK ADD  CONSTRAINT [FK__APIUtilis__Metho__4B622666] FOREIGN KEY([MethodID])
REFERENCES [dbo].[APIMethods] ([ID])
GO
ALTER TABLE [dbo].[APIUtilisations] CHECK CONSTRAINT [FK__APIUtilis__Metho__4B622666]
GO
ALTER TABLE [dbo].[AppAPIEntitys]  WITH CHECK ADD FOREIGN KEY([SystemEntityID])
REFERENCES [dbo].[SystemEntitys] ([ID])
GO
ALTER TABLE [dbo].[AppAPIEntitys]  WITH CHECK ADD  CONSTRAINT [FK__AppEntity__AppID__5EDF0F2E] FOREIGN KEY([AppID])
REFERENCES [dbo].[Apps] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AppAPIEntitys] CHECK CONSTRAINT [FK__AppEntity__AppID__5EDF0F2E]
GO
ALTER TABLE [dbo].[AppAPIEntitys]  WITH CHECK ADD FOREIGN KEY([SystemEntityID])
REFERENCES [dbo].[SystemEntitys] ([ID])
GO
ALTER TABLE [dbo].[AppEndpointTypes]  WITH CHECK ADD  CONSTRAINT [FK__AppEndpoi__AppID__2101D846] FOREIGN KEY([AppID])
REFERENCES [dbo].[Apps] ([ID])
GO
ALTER TABLE [dbo].[AppEndpointTypes] CHECK CONSTRAINT [FK__AppEndpoi__AppID__2101D846]
GO
ALTER TABLE [dbo].[AppEndpointTypes]  WITH CHECK ADD  CONSTRAINT [FK__AppEndpoi__TypeC__2F4FF79D] FOREIGN KEY([TypeCategoryID])
REFERENCES [dbo].[EndPointTypeCategorys] ([ID])
GO
ALTER TABLE [dbo].[AppEndpointTypes] CHECK CONSTRAINT [FK__AppEndpoi__TypeC__2F4FF79D]
GO
ALTER TABLE [dbo].[AppMediaFiles]  WITH CHECK ADD  CONSTRAINT [FK__AppMediaF__AppID__2E5BD364] FOREIGN KEY([AppID])
REFERENCES [dbo].[Apps] ([ID])
GO
ALTER TABLE [dbo].[AppMediaFiles] CHECK CONSTRAINT [FK__AppMediaF__AppID__2E5BD364]
GO
ALTER TABLE [dbo].[Apps]  WITH CHECK ADD  CONSTRAINT [FK__Apps__StatusID__4F9CCB9E] FOREIGN KEY([StatusID])
REFERENCES [dbo].[AppStatuss] ([ID])
GO
ALTER TABLE [dbo].[Apps] CHECK CONSTRAINT [FK__Apps__StatusID__4F9CCB9E]
GO
ALTER TABLE [dbo].[AppThingCategorys]  WITH CHECK ADD  CONSTRAINT [FK__AppThingC__AppID__1A54DAB7] FOREIGN KEY([AppID])
REFERENCES [dbo].[Apps] ([ID])
GO
ALTER TABLE [dbo].[AppThingCategorys] CHECK CONSTRAINT [FK__AppThingC__AppID__1A54DAB7]
GO
ALTER TABLE [dbo].[AppThingExtenstions]  WITH CHECK ADD  CONSTRAINT [FK__AppThingE__AppID__1960B67E] FOREIGN KEY([AppID])
REFERENCES [dbo].[Apps] ([ID])
GO
ALTER TABLE [dbo].[AppThingExtenstions] CHECK CONSTRAINT [FK__AppThingE__AppID__1960B67E]
GO
ALTER TABLE [dbo].[AppThingExtenstions]  WITH CHECK ADD  CONSTRAINT [FK__AppThingE__DataT__25C68D63] FOREIGN KEY([DataTypeID])
REFERENCES [dbo].[DataTypes] ([ID])
GO
ALTER TABLE [dbo].[AppThingExtenstions] CHECK CONSTRAINT [FK__AppThingE__DataT__25C68D63]
GO
ALTER TABLE [dbo].[AppUserTokens]  WITH CHECK ADD FOREIGN KEY([AppID])
REFERENCES [dbo].[Apps] ([ID])
GO
ALTER TABLE [dbo].[AppUserTokens]  WITH CHECK ADD FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[DeviceCommands]  WITH CHECK ADD  CONSTRAINT [FK__Commands__Device__4D94879B] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[Devices] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DeviceCommands] CHECK CONSTRAINT [FK__Commands__Device__4D94879B]
GO
ALTER TABLE [dbo].[DeviceIOs]  WITH CHECK ADD  CONSTRAINT [FK__DeviceIOs__Devic__19AACF41] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[Devices] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DeviceIOs] CHECK CONSTRAINT [FK__DeviceIOs__Devic__19AACF41]
GO
ALTER TABLE [dbo].[DeviceIOs]  WITH CHECK ADD FOREIGN KEY([IOTypeID])
REFERENCES [dbo].[IOTypes] ([ID])
GO
ALTER TABLE [dbo].[DeviceIOs]  WITH CHECK ADD FOREIGN KEY([IOTypeID])
REFERENCES [dbo].[IOTypes] ([ID])
GO
ALTER TABLE [dbo].[Devices]  WITH CHECK ADD  CONSTRAINT [FK__Devices__StatusI__01D345B0] FOREIGN KEY([StatusID])
REFERENCES [dbo].[DeviceStatus] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Devices] CHECK CONSTRAINT [FK__Devices__StatusI__01D345B0]
GO
ALTER TABLE [dbo].[EndPointCommands]  WITH CHECK ADD  CONSTRAINT [FK__EndPointC__EndPo__4222D4EF] FOREIGN KEY([EndPointID])
REFERENCES [dbo].[Endpoints] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EndPointCommands] CHECK CONSTRAINT [FK__EndPointC__EndPo__4222D4EF]
GO
ALTER TABLE [dbo].[EndPointIOs]  WITH CHECK ADD  CONSTRAINT [FK__EndPointI__EndPo__0E391C95] FOREIGN KEY([EndPointTypeID])
REFERENCES [dbo].[EndPointTypes] ([ID])
GO
ALTER TABLE [dbo].[EndPointIOs] CHECK CONSTRAINT [FK__EndPointI__EndPo__0E391C95]
GO
ALTER TABLE [dbo].[EndPointIOs]  WITH CHECK ADD  CONSTRAINT [FK__EndPointI__EndPo__149C0161] FOREIGN KEY([EndPointID])
REFERENCES [dbo].[Endpoints] ([ID])
GO
ALTER TABLE [dbo].[EndPointIOs] CHECK CONSTRAINT [FK__EndPointI__EndPo__149C0161]
GO
ALTER TABLE [dbo].[EndPointIOs]  WITH CHECK ADD  CONSTRAINT [FK__EndPointI__IOTyp__440B1D61] FOREIGN KEY([IOTypeID])
REFERENCES [dbo].[IOTypes] ([ID])
GO
ALTER TABLE [dbo].[EndPointIOs] CHECK CONSTRAINT [FK__EndPointI__IOTyp__440B1D61]
GO
ALTER TABLE [dbo].[EndPointIOs]  WITH CHECK ADD  CONSTRAINT [FK__EndPointI__Thing__7E02B4CC] FOREIGN KEY([ThingID])
REFERENCES [dbo].[Things] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EndPointIOs] CHECK CONSTRAINT [FK__EndPointI__Thing__7E02B4CC]
GO
ALTER TABLE [dbo].[Endpoints]  WITH CHECK ADD  CONSTRAINT [FK__Endpoints__Devic__00DF2177] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[Devices] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Endpoints] CHECK CONSTRAINT [FK__Endpoints__Devic__00DF2177]
GO
ALTER TABLE [dbo].[Endpoints]  WITH CHECK ADD  CONSTRAINT [FK__Endpoints__Thing__7EF6D905] FOREIGN KEY([ThingID])
REFERENCES [dbo].[Things] ([ID])
GO
ALTER TABLE [dbo].[Endpoints] CHECK CONSTRAINT [FK__Endpoints__Thing__7EF6D905]
GO
ALTER TABLE [dbo].[Endpoints]  WITH CHECK ADD  CONSTRAINT [FK__Endpoints__TypeI__45F365D3] FOREIGN KEY([TypeID])
REFERENCES [dbo].[EndPointTypes] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Endpoints] CHECK CONSTRAINT [FK__Endpoints__TypeI__45F365D3]
GO
ALTER TABLE [dbo].[EndPointTypes]  WITH CHECK ADD  CONSTRAINT [FK__EndPointT__TypeC__2A363CC5] FOREIGN KEY([TypeCategoryID])
REFERENCES [dbo].[EndPointTypeCategorys] ([ID])
GO
ALTER TABLE [dbo].[EndPointTypes] CHECK CONSTRAINT [FK__EndPointT__TypeC__2A363CC5]
GO
ALTER TABLE [dbo].[EndPointTypes]  WITH CHECK ADD  CONSTRAINT [FK__EndPointT__TypeC__47DBAE45] FOREIGN KEY([TypeCategoryID])
REFERENCES [dbo].[EndPointTypeCategorys] ([ID])
GO
ALTER TABLE [dbo].[EndPointTypes] CHECK CONSTRAINT [FK__EndPointT__TypeC__47DBAE45]
GO
ALTER TABLE [dbo].[LinkDevicesLocations]  WITH CHECK ADD  CONSTRAINT [FK__LinkDevic__Devic__48CFD27E] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[Devices] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LinkDevicesLocations] CHECK CONSTRAINT [FK__LinkDevic__Devic__48CFD27E]
GO
ALTER TABLE [dbo].[LinkDevicesLocations]  WITH CHECK ADD FOREIGN KEY([EndByUser])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[LinkDevicesLocations]  WITH CHECK ADD FOREIGN KEY([EndByUser])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[LinkDevicesLocations]  WITH CHECK ADD  CONSTRAINT [FK__LinkDevic__Locat__49C3F6B7] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LinkDevicesLocations] CHECK CONSTRAINT [FK__LinkDevic__Locat__49C3F6B7]
GO
ALTER TABLE [dbo].[LinkDevicesLocations]  WITH CHECK ADD FOREIGN KEY([StartByUser])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[LinkDevicesLocations]  WITH CHECK ADD FOREIGN KEY([StartByUser])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[LinkLocationsLocationViews]  WITH CHECK ADD  CONSTRAINT [FK__LinkLocat__Locat__35BCFE0A] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LinkLocationsLocationViews] CHECK CONSTRAINT [FK__LinkLocat__Locat__35BCFE0A]
GO
ALTER TABLE [dbo].[LinkLocationsLocationViews]  WITH CHECK ADD  CONSTRAINT [FK__LinkLocat__Locat__36B12243] FOREIGN KEY([LocationViewID])
REFERENCES [dbo].[LocationViews] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LinkLocationsLocationViews] CHECK CONSTRAINT [FK__LinkLocat__Locat__36B12243]
GO
ALTER TABLE [dbo].[LinkThingsLocations]  WITH CHECK ADD FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([ID])
GO
ALTER TABLE [dbo].[LinkThingsLocations]  WITH CHECK ADD FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([ID])
GO
ALTER TABLE [dbo].[LinkThingsLocations]  WITH CHECK ADD  CONSTRAINT [FK__LinkThing__Thing__0697FACD] FOREIGN KEY([ThingID])
REFERENCES [dbo].[Things] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LinkThingsLocations] CHECK CONSTRAINT [FK__LinkThing__Thing__0697FACD]
GO
ALTER TABLE [dbo].[LinkUsersAlerts]  WITH CHECK ADD  CONSTRAINT [FK__LinkUsers__Alert__7EC1CEDB] FOREIGN KEY([AlertID])
REFERENCES [dbo].[Alerts] ([ID])
GO
ALTER TABLE [dbo].[LinkUsersAlerts] CHECK CONSTRAINT [FK__LinkUsers__Alert__7EC1CEDB]
GO
ALTER TABLE [dbo].[LinkUsersAlerts]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[LinkUsersAlerts]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[LocationViews]  WITH CHECK ADD  CONSTRAINT [FK__LocationV__Locat__286302EC] FOREIGN KEY([LocationViewTypeID])
REFERENCES [dbo].[LocationViewTypes] ([ID])
GO
ALTER TABLE [dbo].[LocationViews] CHECK CONSTRAINT [FK__LocationV__Locat__286302EC]
GO
ALTER TABLE [dbo].[ThingCategorys]  WITH CHECK ADD  CONSTRAINT [FK__ThingCate__IconI__25DB9BFC] FOREIGN KEY([IconID])
REFERENCES [dbo].[MediaFiles] ([ID])
GO
ALTER TABLE [dbo].[ThingCategorys] CHECK CONSTRAINT [FK__ThingCate__IconI__25DB9BFC]
GO
ALTER TABLE [dbo].[ThingCategorys]  WITH CHECK ADD  CONSTRAINT [FK__ThingCate__IconI__2EFAF1E2] FOREIGN KEY([IconID])
REFERENCES [dbo].[MediaFiles] ([ID])
GO
ALTER TABLE [dbo].[ThingCategorys] CHECK CONSTRAINT [FK__ThingCate__IconI__2EFAF1E2]
GO
ALTER TABLE [dbo].[ThingEnds]  WITH CHECK ADD  CONSTRAINT [FK__ThingEnds__EndPo__7F36D027] FOREIGN KEY([EndPointTypeID])
REFERENCES [dbo].[EndPointTypes] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ThingEnds] CHECK CONSTRAINT [FK__ThingEnds__EndPo__7F36D027]
GO
ALTER TABLE [dbo].[ThingEnds]  WITH CHECK ADD FOREIGN KEY([LastIOID])
REFERENCES [dbo].[EndPointIOs] ([ID])
GO
ALTER TABLE [dbo].[ThingEnds]  WITH CHECK ADD  CONSTRAINT [FK__ThingEnds__Thing__7E42ABEE] FOREIGN KEY([ThingID])
REFERENCES [dbo].[Things] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ThingEnds] CHECK CONSTRAINT [FK__ThingEnds__Thing__7E42ABEE]
GO
ALTER TABLE [dbo].[ThingExtenstions]  WITH CHECK ADD  CONSTRAINT [FK__ThingExte__DataT__5C8CB268] FOREIGN KEY([DataTypeID])
REFERENCES [dbo].[DataTypes] ([ID])
GO
ALTER TABLE [dbo].[ThingExtenstions] CHECK CONSTRAINT [FK__ThingExte__DataT__5C8CB268]
GO
ALTER TABLE [dbo].[ThingExtenstions]  WITH CHECK ADD  CONSTRAINT [FK__ThingExte__Thing__6339AFF7] FOREIGN KEY([ThingCategoryID])
REFERENCES [dbo].[ThingCategorys] ([ID])
GO
ALTER TABLE [dbo].[ThingExtenstions] CHECK CONSTRAINT [FK__ThingExte__Thing__6339AFF7]
GO
ALTER TABLE [dbo].[ThingExtenstionValues]  WITH CHECK ADD  CONSTRAINT [FK__ThingExte__Thing__5D80D6A1] FOREIGN KEY([ThingExtenstionID])
REFERENCES [dbo].[ThingExtenstions] ([ID])
GO
ALTER TABLE [dbo].[ThingExtenstionValues] CHECK CONSTRAINT [FK__ThingExte__Thing__5D80D6A1]
GO
ALTER TABLE [dbo].[ThingExtenstionValues]  WITH CHECK ADD FOREIGN KEY([ThingID])
REFERENCES [dbo].[Things] ([ID])
GO
ALTER TABLE [dbo].[Things]  WITH CHECK ADD  CONSTRAINT [FK__Things__Category__662B2B3B] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ThingCategorys] ([ID])
GO
ALTER TABLE [dbo].[Things] CHECK CONSTRAINT [FK__Things__Category__662B2B3B]
GO
ALTER TABLE [dbo].[UserNotifications]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[AttachEndPointTypeToThing]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AttachEndPointTypeToThing]
@EndPointTypeID bigint
,@ThingID bigint
as
begin
	if not exists (select * from ThingEnds where EndPointTypeID = @EndPointTypeID and ThingID = @ThingID)
	begin
	insert into ThingEnds (ThingID,EndPointTypeID)
	values(@ThingID,@EndPointTypeID)

	end
	
end

GO
/****** Object:  StoredProcedure [dbo].[GetLocationsWithWarnings]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[GetLocationsWithWarnings]
@ViewID bigint
as
begin
	
	select distinct l.ID from Locations l 
		inner join LinkLocationsLocationViews lv on l.ID = lv.LocationID
		inner join LinkThingsLocations lt on l.ID = lt.LocationID
		inner join [Endpoints] e on e.ThingID = lt.ThingID
		where lv.LocationViewID = @ViewID  
			and e.IsNumericOnly = 1 
			and (e.LastIONumericValue >= e.HighRange or  e.LastIONumericValue <= e.LowRange)

end

GO
/****** Object:  StoredProcedure [dbo].[GetThingEnds]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[GetThingEnds]
@LocationID bigint = null,
@ThingID bigint = null ,
@ThingCategoryID bigint = null,
@EndPointID bigint = null,
@EndPointTypeID bigint = null



as
begin
	

select loc.ID as 'LocationID'
	,loc.Title as 'LocationTitle'

	,t.ID as 'ThingID'
	,t.Title as 'ThingTitle'
	,tC.ID as 'ThingCategoryID'
	,tC.Title as 'ThingCategoryTitle'



	--,e.ID as 'EndPointID'
	--,e.Title as 'EndPointTitle'
	,eT.ID as 'EndPointTypeID'
	,eT.Title as 'EndPointTypeTitle'
	,eT.measurement as 'EndPointMeasurement'
	,et.IconID
	,d.ID as 'DeviceID'
	,d.Title as 'DeviceTitle'
	--,(if ((DATEADD(HOUR,d.UTC_Diff,d.LastConnectionTimeStamp) > GETUTCDATE()),'Connected','NotConnected'
	,(
		CAST(
             CASE 
                  WHEN DATEADD(SECOND,d.IsConnectedDelay, d.LastConnectionTimeStamp) > DATEADD(HOUR,d.UTC_Diff, GETUTCDATE())
                     THEN 1 
                  ELSE 0 
             END AS bit)
	) as 'IsConnected'
	--,(select top(1) Valu from EndPointIOs i where t.ID = i.ThingID and i.IOTypeID = 1 order by ExecTimeStamp desc) as 'LastSubmitValue'
	,max(ios.ID) as 'LastIOID'
	,(select top(1) valu from EndPointIOs where id = MAX(ios.ID) and IOTypeID = 1 order by id desc) as 'LastIOValue'
	,(select top(1) ExecTimeStamp from EndPointIOs where id = MAX(ios.ID) and IOTypeID = 1 order by id desc) as 'LastIOTimeStamp'

from 
	[EndPointIOs] ios
	,[endpoints] e
	,[EndPointTypes] eT
	,[Things] t
	,[ThingCategorys] tC
	,[LinkThingsLocations] l
	,[Locations] loc
	,[Devices] d
 where 
	ios.EndPointID = e.ID
	and e.TypeID = eT.ID
	--and e.DeviceID = d.ID
	and t.ID = l.ThingID
	and t.ID = ios.ThingID
	and l.LocationID = loc.ID
	and t.CategoryID = tC.ID
	and d.ID = e.DeviceID

	and (@LocationID IS NULL or l.LocationID like @LocationID)
	and (@ThingID IS NULL or t.ID like @ThingID)
	and (@ThingCategoryID IS NULL or t.CategoryID like @ThingCategoryID)
	--and (@DeviceID IS NULL or d.ID like @DeviceID)
	and (@EndPointID IS NULL or e.ID like @EndPointID)
	and (@EndPointTypeID IS NULL or e.TypeID like @EndPointTypeID)

	and ios.IOTypeID = 1

group by loc.ID
	,loc.Title
	,t.ID 
	,t.Title
	,tC.ID
	,tC.Title 
	--,e.ID 
	--,e.Title 
	,eT.ID 
	,eT.Title 
	,eT.measurement
	,et.IconID
	,d.id
	,d.Title
	,d.LastConnectionTimeStamp
	,d.IsConnectedDelay
	,d.UTC_Diff
end
GO
/****** Object:  StoredProcedure [dbo].[GetThingExtenstions]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetThingExtenstions]
@ThingID bigint,
@SearchFor nvarchar(50)
as
begin

	declare @ThingCategoryID bigint
	select @ThingCategoryID = CategoryID from Things where ID = @ThingID

	select 
		t.ID as 'ThingID',
		t.Title as 'ThingTitle' ,
		t.CategoryID,
		tc.Title as 'ThingCategoryTitle',
		te.ID as 'ThingExtenstionID',
		te.GUID as 'ThingExtenstionGUID',
		te.Code as 'ThingExtenstionCode',
		te.Title as 'ThingExtenstionTitle',
		te.DataTypeID,
		dt.Title as 'DataTypeTitle',
		te.IsList as 'IsList',
		v.ID as 'ValueID',
		v.Valu as 'Value'
	from 
		Things t,
		ThingExtenstions te,
		ThingExtenstionValues v,
		DataTypes dt,
		ThingCategorys tc

	where 
		t.CategoryID = te.ThingCategoryID
		and te.ID = v.ThingExtenstionID
		and t.CategoryID = tc.ID
		and t.ID = v.ThingID
		and t.ID = @ThingID
		and te.DataTypeID = dt.ID
		and ( (te.Title like '%' + @SearchFor +'%') or (te.Code like '%' + @SearchFor +'%') or (v.Valu like '%' + @SearchFor +'%') )
		union (
		
		select t.ID,t.Title,t.CategoryID,tc.Title as 'ThingCategoryTitle',te.ID,te.GUID,te.Code,te.Title,te.DataTypeID,dt.Title,te.IsList,0,N''
	from 
		ThingCategorys tc,
		Things t,
		ThingExtenstions te,
		DataTypes dt

	where 
		t.CategoryID = te.ThingCategoryID
		and t.CategoryID = tc.ID
		and te.DataTypeID = dt.ID
		and te.ID not in (select ThingExtenstionID from ThingExtenstionValues where ThingID = @ThingID)
		and t.ID = @ThingID		
		and ( (te.Title like '%' + @SearchFor +'%') or (te.Code like '%' + @SearchFor +'%') )	
		)

end


GO
/****** Object:  StoredProcedure [dbo].[INFO_Database]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[INFO_Database]
as
begin
	select  
		DBVersion
	from DynSettings 
		


end

GO
/****** Object:  StoredProcedure [dbo].[INFO_Server]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[INFO_Server]
as
begin
	select 
		SERVERPROPERTY('ServerName') as 'ServerName'
		,SERVERPROPERTY('Edition') as 'Edition'
		,SERVERPROPERTY('EngineEdition') as 'EngineEdition'
		,SERVERPROPERTY('ProductLevel') as 'ProductLevel'
		,SERVERPROPERTY('MachineName') as 'MachineName'
		,SERVERPROPERTY('IsHadrEnabled') as 'IsHadrEnabled'
		,SERVERPROPERTY('HadrManagerStatus') as 'HadrManagerStatus'
		,SERVERPROPERTY('IsClustered') as 'IsClustered'


end

GO
/****** Object:  StoredProcedure [dbo].[PublishApp]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PublishApp]
@AppID bigint
--,@userID nvarchar(128)
as
begin

--Insert new MediaFiles
insert into MediaFiles (guid,Title)
	select guid,title from appmediafiles appMF where AppID = @AppID and [guid] not in (select [guid] from MediaFiles)
--Update existing MediaFiles
update MediaFiles set 
	Title = appMF.[Title]
	from MediaFiles as mf
		inner join appMediaFiles as appMF on mf.[guid] = appMF.[guid]
		where appMF.appid = @AppID

--Insert new EndPointTypes
insert into EndPointTypes (Code,Title,measurement,TypeCategoryID,IconID)
	(select appEndTyp.Code,appEndTyp.Title,appEndTyp.Measurement,appEndTyp.TypeCategoryID,mf.ID 
		from AppEndpointTypes appEndTyp, MediaFiles mf 
		where appEndTyp.IconGUID = mf.GUID and appEndTyp.AppID = @AppID and Code not in (select code from EndPointTypes ) )
--Update Existing EndPointTypes
update EndPointTypes set 
	Title = appEt.[Title],measurement = appEt.measurement,TypeCategoryID = appEt.TypeCategoryID,IconID =mf.ID 
	from EndPointTypes as et
		inner join AppEndpointTypes as appEt on et.Code = appEt.Code
		inner join MediaFiles as mf on mf.GUID = appEt.IconGUID
		where appEt.appid = @AppID

--Insert new ThingCategories
insert into ThingCategorys (Title,IconID,Code)
	(select appCat.Title,mf.ID , appCat.Code  
		from AppThingCategorys appCat, MediaFiles mf
		where appCat.IconGUID = mf.GUID and appCat.AppID = @AppID and appCat.Code not in (select code from ThingCategorys)
	)
--Update existing ThingCategories
update ThingCategorys set
	Title = appThnCat.Title, IconID = mf.ID
	from ThingCategorys as thnCat
		inner join AppThingCategorys as appThnCat on appThnCat.Code = thnCat.Code
		inner join MediaFiles as mf on mf.GUID = appThnCat.IconGUID 
		where appThnCat.AppID = @AppID

--Insert new ThingExtenstions
insert into ThingExtenstions (GUID,ThingCategoryID,Title,DataTypeID,IsList)
	(select appThnExt.GUID,  thnCat.ID    , appThnExt.Title,appThnExt.DataTypeID,appThnExt.IsList
		from AppThingExtenstions appThnExt, ThingCategorys thnCat
		where appThnExt.Code not in (select code from ThingExtenstions)
		 and appThnExt.AppID = @AppID
		 and appThnExt.AppThingCategoryCode = thnCat.Code
	)
--Update existing ThingExtenstions	
update ThingExtenstions set
	ThingCategoryID = thnCat.ID , Title = appThnExt.Title , DataTypeID = appThnExt.DataTypeID, IsList = appThnExt.IsList 
	from ThingCategorys thnExt
		inner join AppThingExtenstions as appThnExt on appThnExt.Code = thnExt.Code
		inner join ThingCategorys as thnCat on thnCat.Code = appThnExt.AppThingCategoryCode
		where appThnExt.AppID = @AppID

--update Apps set StatusID = 2 where id = @AppID


end

GO
/****** Object:  StoredProcedure [dbo].[ResetDB]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  procedure [dbo].[ResetDB]
as
begin

truncate table [dbo].[UserNotifications]
truncate table [dbo].[LinkUsersAlerts]
truncate table  [dbo].[AlertConditions]
truncate table [dbo].[Alerts]

truncate table [dbo].[LinkLocationsLocationViews]
truncate table  [dbo].[LocationViews]
truncate table  [dbo].[LinkDevicesLocations]
truncate table  [dbo].[LinkThingsLocations]
truncate table [dbo].[Locations]

truncate table [dbo].[EndPointIOs]
truncate table [dbo].[EndPointCommands]
truncate table [dbo].[Endpoints]
truncate table [dbo].[EndPointTypes]
truncate table [dbo].[EndPointTypeCategorys]


truncate table [dbo].[DeviceIOs]
truncate table [dbo].[DeviceCommands]
truncate table [dbo].[Devices]



truncate table usernotifications
truncate table LinkDevicesLocations
truncate table LinkLocationsLocationViews
truncate table LinkThingsLocations
truncate table LinkUsersAlerts


truncate table [dbo].[Things]
truncate table [dbo].[ThingCategorys]


truncate table [dbo].[MediaFiles]


truncate table  [dbo].[Apps]

truncate table [dbo].[AspNetUserRoles]
truncate table [dbo].[AspNetRoles]
truncate table [dbo].[AspNetUsers]



end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_CpH_Last24Hours]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Rpt_CpH_Last24Hours] 
 as
 begin
 SET NOCOUNT ON


 select '1' as 'ObjectCode', 
	'EndPoints' as 'Object',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-1,GETUTCDATE())  and GETUTCDATE())as '1',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-2,GETUTCDATE())  and DATEADD(HOUR,-1,GETUTCDATE()))as '2',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-3,GETUTCDATE())  and DATEADD(HOUR,-2,GETUTCDATE()))as '3',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-4,GETUTCDATE())  and DATEADD(HOUR,-3,GETUTCDATE()))as '4',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-5,GETUTCDATE())  and DATEADD(HOUR,-4,GETUTCDATE()))as '5',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-6,GETUTCDATE())  and DATEADD(HOUR,-5,GETUTCDATE()))as '6',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-7,GETUTCDATE())  and DATEADD(HOUR,-6,GETUTCDATE()))as '7',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-8,GETUTCDATE())  and DATEADD(HOUR,-7,GETUTCDATE()))as '8',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-9,GETUTCDATE())  and DATEADD(HOUR,-8,GETUTCDATE()))as '9',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-10,GETUTCDATE())  and DATEADD(HOUR,-9,GETUTCDATE()))as '10',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-11,GETUTCDATE())  and DATEADD(HOUR,-10,GETUTCDATE()))as '11',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-12,GETUTCDATE())  and DATEADD(HOUR,-11,GETUTCDATE()))as '12',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-13,GETUTCDATE())  and DATEADD(HOUR,-12,GETUTCDATE()))as '13',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-14,GETUTCDATE())  and DATEADD(HOUR,-13,GETUTCDATE()))as '14',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-15,GETUTCDATE())  and DATEADD(HOUR,-14,GETUTCDATE()))as '15',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-16,GETUTCDATE())  and DATEADD(HOUR,-15,GETUTCDATE()))as '16',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-17,GETUTCDATE())  and DATEADD(HOUR,-16,GETUTCDATE()))as '17',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-18,GETUTCDATE())  and DATEADD(HOUR,-17,GETUTCDATE()))as '18',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-19,GETUTCDATE())  and DATEADD(HOUR,-18,GETUTCDATE()))as '19',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-20,GETUTCDATE())  and DATEADD(HOUR,-19,GETUTCDATE()))as '20',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-21,GETUTCDATE())  and DATEADD(HOUR,-20,GETUTCDATE()))as '21',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-22,GETUTCDATE())  and DATEADD(HOUR,-21,GETUTCDATE()))as '22',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-23,GETUTCDATE())  and DATEADD(HOUR,-22,GETUTCDATE()))as '23',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-24,GETUTCDATE())  and DATEADD(HOUR,-23,GETUTCDATE()))as '24'

	

union all
(
 select '2' as 'ObjectCode', 
	'Devices' as 'Object',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-1,GETUTCDATE())  and GETUTCDATE())as '1',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-2,GETUTCDATE())  and DATEADD(HOUR,-1,GETUTCDATE()))as '2',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-3,GETUTCDATE())  and DATEADD(HOUR,-2,GETUTCDATE()))as '3',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-4,GETUTCDATE())  and DATEADD(HOUR,-3,GETUTCDATE()))as '4',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-5,GETUTCDATE())  and DATEADD(HOUR,-4,GETUTCDATE()))as '5',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-6,GETUTCDATE())  and DATEADD(HOUR,-5,GETUTCDATE()))as '6',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-7,GETUTCDATE())  and DATEADD(HOUR,-6,GETUTCDATE()))as '7',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-8,GETUTCDATE())  and DATEADD(HOUR,-7,GETUTCDATE()))as '8',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-9,GETUTCDATE())  and DATEADD(HOUR,-8,GETUTCDATE()))as '9',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-10,GETUTCDATE())  and DATEADD(HOUR,-9,GETUTCDATE()))as '10',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-11,GETUTCDATE())  and DATEADD(HOUR,-10,GETUTCDATE()))as '11',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-12,GETUTCDATE())  and DATEADD(HOUR,-11,GETUTCDATE()))as '12',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-13,GETUTCDATE())  and DATEADD(HOUR,-12,GETUTCDATE()))as '13',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-14,GETUTCDATE())  and DATEADD(HOUR,-13,GETUTCDATE()))as '14',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-15,GETUTCDATE())  and DATEADD(HOUR,-14,GETUTCDATE()))as '15',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-16,GETUTCDATE())  and DATEADD(HOUR,-15,GETUTCDATE()))as '16',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-17,GETUTCDATE())  and DATEADD(HOUR,-16,GETUTCDATE()))as '17',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-18,GETUTCDATE())  and DATEADD(HOUR,-17,GETUTCDATE()))as '18',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-19,GETUTCDATE())  and DATEADD(HOUR,-18,GETUTCDATE()))as '19',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-20,GETUTCDATE())  and DATEADD(HOUR,-19,GETUTCDATE()))as '20',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-21,GETUTCDATE())  and DATEADD(HOUR,-20,GETUTCDATE()))as '21',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-22,GETUTCDATE())  and DATEADD(HOUR,-21,GETUTCDATE()))as '22',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-23,GETUTCDATE())  and DATEADD(HOUR,-22,GETUTCDATE()))as '23',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-24,GETUTCDATE())  and DATEADD(HOUR,-23,GETUTCDATE()))as '24'

	
)
end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_CpH_Last60Minutes]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Rpt_CpH_Last60Minutes] 
 as
 begin
 SET NOCOUNT ON


 select '1' as 'ObjectCode', 
	'EndPoints' as 'Object',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-1,GETUTCDATE())  and GETUTCDATE())as '1',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-2,GETUTCDATE())  and DATEADD(minute,-1,GETUTCDATE()))as '2',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-3,GETUTCDATE())  and DATEADD(minute,-2,GETUTCDATE()))as '3',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-4,GETUTCDATE())  and DATEADD(minute,-3,GETUTCDATE()))as '4',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-5,GETUTCDATE())  and DATEADD(minute,-4,GETUTCDATE()))as '5',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-6,GETUTCDATE())  and DATEADD(minute,-5,GETUTCDATE()))as '6',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-7,GETUTCDATE())  and DATEADD(minute,-6,GETUTCDATE()))as '7',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-8,GETUTCDATE())  and DATEADD(minute,-7,GETUTCDATE()))as '8',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-9,GETUTCDATE())  and DATEADD(minute,-8,GETUTCDATE()))as '9',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-10,GETUTCDATE())  and DATEADD(minute,-9,GETUTCDATE()))as '10',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-11,GETUTCDATE())  and DATEADD(minute,-10,GETUTCDATE()))as '11',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-12,GETUTCDATE())  and DATEADD(minute,-11,GETUTCDATE()))as '12',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-13,GETUTCDATE())  and DATEADD(minute,-12,GETUTCDATE()))as '13',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-14,GETUTCDATE())  and DATEADD(minute,-13,GETUTCDATE()))as '14',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-15,GETUTCDATE())  and DATEADD(minute,-14,GETUTCDATE()))as '15',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-16,GETUTCDATE())  and DATEADD(minute,-15,GETUTCDATE()))as '16',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-17,GETUTCDATE())  and DATEADD(minute,-16,GETUTCDATE()))as '17',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-18,GETUTCDATE())  and DATEADD(minute,-17,GETUTCDATE()))as '18',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-19,GETUTCDATE())  and DATEADD(minute,-18,GETUTCDATE()))as '19',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-20,GETUTCDATE())  and DATEADD(minute,-19,GETUTCDATE()))as '20',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-21,GETUTCDATE())  and DATEADD(minute,-20,GETUTCDATE()))as '21',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-22,GETUTCDATE())  and DATEADD(minute,-21,GETUTCDATE()))as '22',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-23,GETUTCDATE())  and DATEADD(minute,-22,GETUTCDATE()))as '23',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-24,GETUTCDATE())  and DATEADD(minute,-23,GETUTCDATE()))as '24',

		(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-25,GETUTCDATE())  and DATEADD(minute,-24,GETUTCDATE()))as '25',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-26,GETUTCDATE())  and DATEADD(minute,-25,GETUTCDATE()))as '26',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-27,GETUTCDATE())  and DATEADD(minute,-26,GETUTCDATE()))as '27',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-28,GETUTCDATE())  and DATEADD(minute,-27,GETUTCDATE()))as '28',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-29,GETUTCDATE())  and DATEADD(minute,-28,GETUTCDATE()))as '29',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-30,GETUTCDATE())  and DATEADD(minute,-29,GETUTCDATE()))as '30',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-31,GETUTCDATE())  and DATEADD(minute,-30,GETUTCDATE()))as '31',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-32,GETUTCDATE())  and DATEADD(minute,-31,GETUTCDATE()))as '32',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-33,GETUTCDATE())  and DATEADD(minute,-32,GETUTCDATE()))as '33',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-34,GETUTCDATE())  and DATEADD(minute,-33,GETUTCDATE()))as '34',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-35,GETUTCDATE())  and DATEADD(minute,-34,GETUTCDATE()))as '35',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-36,GETUTCDATE())  and DATEADD(minute,-35,GETUTCDATE()))as '36',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-37,GETUTCDATE())  and DATEADD(minute,-36,GETUTCDATE()))as '37',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-38,GETUTCDATE())  and DATEADD(minute,-37,GETUTCDATE()))as '38',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-39,GETUTCDATE())  and DATEADD(minute,-38,GETUTCDATE()))as '39',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-40,GETUTCDATE())  and DATEADD(minute,-39,GETUTCDATE()))as '40',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-41,GETUTCDATE())  and DATEADD(minute,-40,GETUTCDATE()))as '41',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-42,GETUTCDATE())  and DATEADD(minute,-41,GETUTCDATE()))as '42',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-43,GETUTCDATE())  and DATEADD(minute,-42,GETUTCDATE()))as '43',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-44,GETUTCDATE())  and DATEADD(minute,-43,GETUTCDATE()))as '44',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-45,GETUTCDATE())  and DATEADD(minute,-44,GETUTCDATE()))as '45',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-46,GETUTCDATE())  and DATEADD(minute,-45,GETUTCDATE()))as '46',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-47,GETUTCDATE())  and DATEADD(minute,-46,GETUTCDATE()))as '47',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-48,GETUTCDATE())  and DATEADD(minute,-47,GETUTCDATE()))as '48',

		(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-49,GETUTCDATE())  and DATEADD(minute,-48,GETUTCDATE()))as '49',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-50,GETUTCDATE())  and DATEADD(minute,-49,GETUTCDATE()))as '50',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-51,GETUTCDATE())  and DATEADD(minute,-50,GETUTCDATE()))as '51',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-52,GETUTCDATE())  and DATEADD(minute,-51,GETUTCDATE()))as '52',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-53,GETUTCDATE())  and DATEADD(minute,-52,GETUTCDATE()))as '53',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-54,GETUTCDATE())  and DATEADD(minute,-53,GETUTCDATE()))as '54',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-55,GETUTCDATE())  and DATEADD(minute,-54,GETUTCDATE()))as '55',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-56,GETUTCDATE())  and DATEADD(minute,-55,GETUTCDATE()))as '56',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-57,GETUTCDATE())  and DATEADD(minute,-56,GETUTCDATE()))as '57',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-58,GETUTCDATE())  and DATEADD(minute,-57,GETUTCDATE()))as '58',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-59,GETUTCDATE())  and DATEADD(minute,-58,GETUTCDATE()))as '59',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-60,GETUTCDATE())  and DATEADD(minute,-59,GETUTCDATE()))as '60'


union all
(
 select '2' as 'ObjectCode', 
	'Devices' as 'Object',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-1,GETUTCDATE())  and GETUTCDATE())as '1',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-2,GETUTCDATE())  and DATEADD(minute,-1,GETUTCDATE()))as '2',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-3,GETUTCDATE())  and DATEADD(minute,-2,GETUTCDATE()))as '3',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-4,GETUTCDATE())  and DATEADD(minute,-3,GETUTCDATE()))as '4',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-5,GETUTCDATE())  and DATEADD(minute,-4,GETUTCDATE()))as '5',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-6,GETUTCDATE())  and DATEADD(minute,-5,GETUTCDATE()))as '6',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-7,GETUTCDATE())  and DATEADD(minute,-6,GETUTCDATE()))as '7',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-8,GETUTCDATE())  and DATEADD(minute,-7,GETUTCDATE()))as '8',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-9,GETUTCDATE())  and DATEADD(minute,-8,GETUTCDATE()))as '9',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-10,GETUTCDATE())  and DATEADD(minute,-9,GETUTCDATE()))as '10',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-11,GETUTCDATE())  and DATEADD(minute,-10,GETUTCDATE()))as '11',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-12,GETUTCDATE())  and DATEADD(minute,-11,GETUTCDATE()))as '12',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-13,GETUTCDATE())  and DATEADD(minute,-12,GETUTCDATE()))as '13',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-14,GETUTCDATE())  and DATEADD(minute,-13,GETUTCDATE()))as '14',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-15,GETUTCDATE())  and DATEADD(minute,-14,GETUTCDATE()))as '15',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-16,GETUTCDATE())  and DATEADD(minute,-15,GETUTCDATE()))as '16',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-17,GETUTCDATE())  and DATEADD(minute,-16,GETUTCDATE()))as '17',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-18,GETUTCDATE())  and DATEADD(minute,-17,GETUTCDATE()))as '18',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-19,GETUTCDATE())  and DATEADD(minute,-18,GETUTCDATE()))as '19',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-20,GETUTCDATE())  and DATEADD(minute,-19,GETUTCDATE()))as '20',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-21,GETUTCDATE())  and DATEADD(minute,-20,GETUTCDATE()))as '21',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-22,GETUTCDATE())  and DATEADD(minute,-21,GETUTCDATE()))as '22',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-23,GETUTCDATE())  and DATEADD(minute,-22,GETUTCDATE()))as '23',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-24,GETUTCDATE())  and DATEADD(minute,-23,GETUTCDATE()))as '24',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-25,GETUTCDATE())  and DATEADD(minute,-24,GETUTCDATE()))as '25',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-26,GETUTCDATE())  and DATEADD(minute,-25,GETUTCDATE()))as '26',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-27,GETUTCDATE())  and DATEADD(minute,-26,GETUTCDATE()))as '27',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-28,GETUTCDATE())  and DATEADD(minute,-27,GETUTCDATE()))as '28',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-29,GETUTCDATE())  and DATEADD(minute,-28,GETUTCDATE()))as '29',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-30,GETUTCDATE())  and DATEADD(minute,-29,GETUTCDATE()))as '30',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-31,GETUTCDATE())  and DATEADD(minute,-30,GETUTCDATE()))as '31',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-32,GETUTCDATE())  and DATEADD(minute,-31,GETUTCDATE()))as '32',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-33,GETUTCDATE())  and DATEADD(minute,-32,GETUTCDATE()))as '33',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-34,GETUTCDATE())  and DATEADD(minute,-33,GETUTCDATE()))as '34',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-35,GETUTCDATE())  and DATEADD(minute,-34,GETUTCDATE()))as '35',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-36,GETUTCDATE())  and DATEADD(minute,-35,GETUTCDATE()))as '36',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-37,GETUTCDATE())  and DATEADD(minute,-36,GETUTCDATE()))as '37',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-38,GETUTCDATE())  and DATEADD(minute,-37,GETUTCDATE()))as '38',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-39,GETUTCDATE())  and DATEADD(minute,-38,GETUTCDATE()))as '39',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-40,GETUTCDATE())  and DATEADD(minute,-39,GETUTCDATE()))as '40',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-41,GETUTCDATE())  and DATEADD(minute,-40,GETUTCDATE()))as '41',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-42,GETUTCDATE())  and DATEADD(minute,-41,GETUTCDATE()))as '42',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-43,GETUTCDATE())  and DATEADD(minute,-42,GETUTCDATE()))as '43',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-44,GETUTCDATE())  and DATEADD(minute,-43,GETUTCDATE()))as '44',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-45,GETUTCDATE())  and DATEADD(minute,-44,GETUTCDATE()))as '45',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-46,GETUTCDATE())  and DATEADD(minute,-45,GETUTCDATE()))as '46',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-47,GETUTCDATE())  and DATEADD(minute,-46,GETUTCDATE()))as '47',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-48,GETUTCDATE())  and DATEADD(minute,-47,GETUTCDATE()))as '48',

		(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-49,GETUTCDATE())  and DATEADD(minute,-48,GETUTCDATE()))as '49',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-50,GETUTCDATE())  and DATEADD(minute,-49,GETUTCDATE()))as '50',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-51,GETUTCDATE())  and DATEADD(minute,-50,GETUTCDATE()))as '51',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-52,GETUTCDATE())  and DATEADD(minute,-51,GETUTCDATE()))as '52',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-53,GETUTCDATE())  and DATEADD(minute,-52,GETUTCDATE()))as '53',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-54,GETUTCDATE())  and DATEADD(minute,-53,GETUTCDATE()))as '54',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-55,GETUTCDATE())  and DATEADD(minute,-54,GETUTCDATE()))as '55',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-56,GETUTCDATE())  and DATEADD(minute,-55,GETUTCDATE()))as '56',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-57,GETUTCDATE())  and DATEADD(minute,-56,GETUTCDATE()))as '57',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-58,GETUTCDATE())  and DATEADD(minute,-57,GETUTCDATE()))as '58',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-59,GETUTCDATE())  and DATEADD(minute,-58,GETUTCDATE()))as '59',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-60,GETUTCDATE())  and DATEADD(minute,-59,GETUTCDATE()))as '60'
)
end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_EndPoint_IOs_Days]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Rpt_EndPoint_IOs_Days] 
 @EPID bigint
 as
 begin
 SET NOCOUNT ON
 select ID,Title,'Min' as 'Fx',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00'  and GetDate() and EndPointID = @EPID and [TypeID] = 1)as '1',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '2',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '3',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '4',
	
			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '5',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '6',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '7',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '8',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '9',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '10',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '11',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '12',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '13',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '14',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '15',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '16',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '17',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '18',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '19',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '20',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '21',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '22',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '23',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '24',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '25',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '26',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '27',


	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '28',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '29',


	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-30,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '30'

from [Endpoints] e where e.ID = @EPID

union all

(
select ID,Title,'max' as 'Fx',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00'  and GetDate() and EndPointID = @EPID and [TypeID] = 1)as '1',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '2',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '3',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '4',
	
			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '5',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '6',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '7',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '8',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '9',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '10',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '11',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '12',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '13',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '14',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '15',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '16',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '17',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '18',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '19',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '20',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '21',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '22',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '23',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '24',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '25',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '26',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '27',


	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '28',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '29',


	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-30,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '30'

from [Endpoints] e where e.ID = @EPID

)
union all
(
select ID,Title,'avg' as 'Fx',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00'  and GetDate() and EndPointID = @EPID and [TypeID] = 1)as '1',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '2',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '3',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '4',
	
			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '5',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '6',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '7',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '8',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '9',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '10',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '11',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '12',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '13',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '14',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '15',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '16',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '17',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '18',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '19',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '20',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '21',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '22',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '23',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '24',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '25',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '26',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '27',


	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '28',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '29',


	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-30,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '30'

from [Endpoints] e where e.ID = @EPID

)
end


GO
/****** Object:  StoredProcedure [dbo].[Rpt_EndPoint_IOs_HOURs]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Rpt_EndPoint_IOs_HOURs] 
 @EPID bigint
 as
 begin
 SET NOCOUNT ON

	declare @EPTimeZone int 
	select @EPTimeZone =   d.UTC_Diff from [endpoints] e, devices d where  e.DeviceID = d.ID and  e.id = @EPID
	declare @StartTime datetime
	set @StartTime = dateadd(HOUR,@EPTimeZone,GETUTCDATE() )

 select ID,Title,'Min' as 'Fx',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-1,@StartTime)  and DATEADD(HOUR,-0,@StartTime) and EndPointID = @EPID)as '1',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-2,@StartTime)  and DATEADD(HOUR,-1,@StartTime) and EndPointID = @EPID)as '2',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-3,@StartTime)  and DATEADD(HOUR,-2,@StartTime) and EndPointID = @EPID)as '3',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-4,@StartTime)  and DATEADD(HOUR,-3,@StartTime) and EndPointID = @EPID)as '4',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-5,@StartTime)  and DATEADD(HOUR,-4,@StartTime) and EndPointID = @EPID)as '5',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-6,@StartTime)  and DATEADD(HOUR,-5,@StartTime) and EndPointID = @EPID)as '6',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-7,@StartTime)  and DATEADD(HOUR,-6,@StartTime) and EndPointID = @EPID)as '7',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-8,@StartTime)  and DATEADD(HOUR,-7,@StartTime) and EndPointID = @EPID)as '8',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-9,@StartTime)  and DATEADD(HOUR,-8,@StartTime) and EndPointID = @EPID)as '9',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-10,@StartTime)  and DATEADD(HOUR,-9,@StartTime) and EndPointID = @EPID)as '10',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-11,@StartTime)  and DATEADD(HOUR,-10,@StartTime) and EndPointID = @EPID)as '11',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-12,@StartTime)  and DATEADD(HOUR,-11,@StartTime) and EndPointID = @EPID)as '12',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-13,@StartTime)  and DATEADD(HOUR,-12,@StartTime) and EndPointID = @EPID)as '13',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-14,@StartTime)  and DATEADD(HOUR,-13,@StartTime) and EndPointID = @EPID)as '14',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-15,@StartTime)  and DATEADD(HOUR,-14,@StartTime) and EndPointID = @EPID)as '15',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-16,@StartTime)  and DATEADD(HOUR,-15,@StartTime) and EndPointID = @EPID)as '16',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-17,@StartTime)  and DATEADD(HOUR,-16,@StartTime) and EndPointID = @EPID)as '17',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-18,@StartTime)  and DATEADD(HOUR,-17,@StartTime) and EndPointID = @EPID)as '18',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-19,@StartTime)  and DATEADD(HOUR,-18,@StartTime) and EndPointID = @EPID)as '19',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-20,@StartTime)  and DATEADD(HOUR,-19,@StartTime) and EndPointID = @EPID)as '20',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-21,@StartTime)  and DATEADD(HOUR,-20,@StartTime) and EndPointID = @EPID)as '21',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-22,@StartTime)  and DATEADD(HOUR,-21,@StartTime) and EndPointID = @EPID)as '22',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-23,@StartTime)  and DATEADD(HOUR,-22,@StartTime) and EndPointID = @EPID)as '23',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-24,@StartTime)  and DATEADD(HOUR,-23,@StartTime) and EndPointID = @EPID)as '24'


from [Endpoints] e where e.ID = @EPID

union all

(
select ID,Title,'max' as 'Fx',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-1,@StartTime)  and DATEADD(HOUR,-0,@StartTime) and EndPointID = @EPID)as '1',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-2,@StartTime)  and DATEADD(HOUR,-1,@StartTime) and EndPointID = @EPID)as '2',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-3,@StartTime)  and DATEADD(HOUR,-2,@StartTime) and EndPointID = @EPID)as '3',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-4,@StartTime)  and DATEADD(HOUR,-3,@StartTime) and EndPointID = @EPID)as '41',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-5,@StartTime)  and DATEADD(HOUR,-4,@StartTime) and EndPointID = @EPID)as '5',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-6,@StartTime)  and DATEADD(HOUR,-5,@StartTime) and EndPointID = @EPID)as '6',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-7,@StartTime)  and DATEADD(HOUR,-6,@StartTime) and EndPointID = @EPID)as '7',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-8,@StartTime)  and DATEADD(HOUR,-7,@StartTime) and EndPointID = @EPID)as '8',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-9,@StartTime)  and DATEADD(HOUR,-8,@StartTime) and EndPointID = @EPID)as '9',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-10,@StartTime)  and DATEADD(HOUR,-9,@StartTime) and EndPointID = @EPID)as '10',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-11,@StartTime)  and DATEADD(HOUR,-10,@StartTime) and EndPointID = @EPID)as '11',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-12,@StartTime)  and DATEADD(HOUR,-11,@StartTime) and EndPointID = @EPID)as '12',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-13,@StartTime)  and DATEADD(HOUR,-12,@StartTime) and EndPointID = @EPID)as '13',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-14,@StartTime)  and DATEADD(HOUR,-13,@StartTime) and EndPointID = @EPID)as '14',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-15,@StartTime)  and DATEADD(HOUR,-14,@StartTime) and EndPointID = @EPID)as '15',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-16,@StartTime)  and DATEADD(HOUR,-15,@StartTime) and EndPointID = @EPID)as '16',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-17,@StartTime)  and DATEADD(HOUR,-16,@StartTime) and EndPointID = @EPID)as '17',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-18,@StartTime)  and DATEADD(HOUR,-17,@StartTime) and EndPointID = @EPID)as '18',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-19,@StartTime)  and DATEADD(HOUR,-18,@StartTime) and EndPointID = @EPID)as '19',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-20,@StartTime)  and DATEADD(HOUR,-19,@StartTime) and EndPointID = @EPID)as '20',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-21,@StartTime)  and DATEADD(HOUR,-20,@StartTime) and EndPointID = @EPID)as '21',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-22,@StartTime)  and DATEADD(HOUR,-21,@StartTime) and EndPointID = @EPID)as '22',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-23,@StartTime)  and DATEADD(HOUR,-22,@StartTime) and EndPointID = @EPID)as '23',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-24,@StartTime)  and DATEADD(HOUR,-23,@StartTime) and EndPointID = @EPID)as '24'



from [Endpoints] e where e.ID = @EPID

)
union all
(
select ID,Title,'avg' as 'Fx',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-1,@StartTime)  and DATEADD(HOUR,-0,@StartTime) and EndPointID = @EPID)as '1',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-2,@StartTime)  and DATEADD(HOUR,-1,@StartTime) and EndPointID = @EPID)as '2',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-3,@StartTime)  and DATEADD(HOUR,-2,@StartTime) and EndPointID = @EPID)as '3',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-4,@StartTime)  and DATEADD(HOUR,-3,@StartTime) and EndPointID = @EPID)as '41',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-5,@StartTime)  and DATEADD(HOUR,-4,@StartTime) and EndPointID = @EPID)as '5',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-6,@StartTime)  and DATEADD(HOUR,-5,@StartTime) and EndPointID = @EPID)as '6',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-7,@StartTime)  and DATEADD(HOUR,-6,@StartTime) and EndPointID = @EPID)as '7',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-8,@StartTime)  and DATEADD(HOUR,-7,@StartTime) and EndPointID = @EPID)as '8',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-9,@StartTime)  and DATEADD(HOUR,-8,@StartTime) and EndPointID = @EPID)as '9',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-10,@StartTime)  and DATEADD(HOUR,-9,@StartTime) and EndPointID = @EPID)as '10',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-11,@StartTime)  and DATEADD(HOUR,-10,@StartTime) and EndPointID = @EPID)as '11',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-12,@StartTime)  and DATEADD(HOUR,-11,@StartTime) and EndPointID = @EPID)as '12',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-13,@StartTime)  and DATEADD(HOUR,-12,@StartTime) and EndPointID = @EPID)as '13',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-14,@StartTime)  and DATEADD(HOUR,-13,@StartTime) and EndPointID = @EPID)as '14',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-15,@StartTime)  and DATEADD(HOUR,-14,@StartTime) and EndPointID = @EPID)as '15',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-16,@StartTime)  and DATEADD(HOUR,-15,@StartTime) and EndPointID = @EPID)as '16',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-17,@StartTime)  and DATEADD(HOUR,-16,@StartTime) and EndPointID = @EPID)as '17',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-18,@StartTime)  and DATEADD(HOUR,-17,@StartTime) and EndPointID = @EPID)as '18',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-19,@StartTime)  and DATEADD(HOUR,-18,@StartTime) and EndPointID = @EPID)as '19',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-20,@StartTime)  and DATEADD(HOUR,-19,@StartTime) and EndPointID = @EPID)as '20',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-21,@StartTime)  and DATEADD(HOUR,-20,@StartTime) and EndPointID = @EPID)as '21',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-22,@StartTime)  and DATEADD(HOUR,-21,@StartTime) and EndPointID = @EPID)as '22',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-23,@StartTime)  and DATEADD(HOUR,-22,@StartTime) and EndPointID = @EPID)as '23',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(HOUR,-24,@StartTime)  and DATEADD(HOUR,-23,@StartTime) and EndPointID = @EPID)as '24'



from [Endpoints] e where e.ID = @EPID

)
end


GO
/****** Object:  StoredProcedure [dbo].[Rpt_EndPoint_IOs_Minutes]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[Rpt_EndPoint_IOs_Minutes] 
 @EPID bigint
 as
 begin
 SET NOCOUNT ON

	declare @EPTimeZone int 
	select @EPTimeZone =  d.UTC_Diff from [endpoints] e, devices d where  e.DeviceID = d.ID and  e.id = @EPID
 declare @StartTime datetime
 set @StartTime = dateadd(HOUR,@EPTimeZone,GETUTCDATE() )

 select ID,Title,'Min' as 'Fx',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-1,@StartTime)  and DATEADD(minute,-0,@StartTime) and EndPointID = @EPID)as '1',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-2,@StartTime)  and DATEADD(minute,-1,@StartTime) and EndPointID = @EPID)as '2',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-3,@StartTime)  and DATEADD(minute,-2,@StartTime) and EndPointID = @EPID)as '3',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-4,@StartTime)  and DATEADD(minute,-3,@StartTime) and EndPointID = @EPID)as '4',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-5,@StartTime)  and DATEADD(minute,-4,@StartTime) and EndPointID = @EPID)as '5',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-6,@StartTime)  and DATEADD(minute,-5,@StartTime) and EndPointID = @EPID)as '6',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-7,@StartTime)  and DATEADD(minute,-6,@StartTime) and EndPointID = @EPID)as '7',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-8,@StartTime)  and DATEADD(minute,-7,@StartTime) and EndPointID = @EPID)as '8',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-9,@StartTime)  and DATEADD(minute,-8,@StartTime) and EndPointID = @EPID)as '9',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-10,@StartTime)  and DATEADD(minute,-9,@StartTime) and EndPointID = @EPID)as '10',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-11,@StartTime)  and DATEADD(minute,-10,@StartTime) and EndPointID = @EPID)as '11',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-12,@StartTime)  and DATEADD(minute,-11,@StartTime) and EndPointID = @EPID)as '12',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-13,@StartTime)  and DATEADD(minute,-12,@StartTime) and EndPointID = @EPID)as '13',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-14,@StartTime)  and DATEADD(minute,-13,@StartTime) and EndPointID = @EPID)as '14',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-15,@StartTime)  and DATEADD(minute,-14,@StartTime) and EndPointID = @EPID)as '15',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-16,@StartTime)  and DATEADD(minute,-15,@StartTime) and EndPointID = @EPID)as '16',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-17,@StartTime)  and DATEADD(minute,-16,@StartTime) and EndPointID = @EPID)as '17',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-18,@StartTime)  and DATEADD(minute,-17,@StartTime) and EndPointID = @EPID)as '18',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-19,@StartTime)  and DATEADD(minute,-18,@StartTime) and EndPointID = @EPID)as '19',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-20,@StartTime)  and DATEADD(minute,-19,@StartTime) and EndPointID = @EPID)as '20',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-21,@StartTime)  and DATEADD(minute,-20,@StartTime) and EndPointID = @EPID)as '21',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-22,@StartTime)  and DATEADD(minute,-21,@StartTime) and EndPointID = @EPID)as '22',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-23,@StartTime)  and DATEADD(minute,-22,@StartTime) and EndPointID = @EPID)as '23',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-24,@StartTime)  and DATEADD(minute,-23,@StartTime) and EndPointID = @EPID)as '24',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-25,@StartTime)  and DATEADD(minute,-24,@StartTime) and EndPointID = @EPID)as '25',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-26,@StartTime)  and DATEADD(minute,-25,@StartTime) and EndPointID = @EPID)as '26',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-27,@StartTime)  and DATEADD(minute,-26,@StartTime) and EndPointID = @EPID)as '27',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-28,@StartTime)  and DATEADD(minute,-27,@StartTime) and EndPointID = @EPID)as '28',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-29,@StartTime)  and DATEADD(minute,-28,@StartTime) and EndPointID = @EPID)as '29',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-30,@StartTime)  and DATEADD(minute,-29,@StartTime) and EndPointID = @EPID)as '30',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-31,@StartTime)  and DATEADD(minute,-30,@StartTime) and EndPointID = @EPID)as '31',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-32,@StartTime)  and DATEADD(minute,-31,@StartTime) and EndPointID = @EPID)as '32',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-33,@StartTime)  and DATEADD(minute,-32,@StartTime) and EndPointID = @EPID)as '33',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-34,@StartTime)  and DATEADD(minute,-33,@StartTime) and EndPointID = @EPID)as '34',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-35,@StartTime)  and DATEADD(minute,-34,@StartTime) and EndPointID = @EPID)as '35',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-36,@StartTime)  and DATEADD(minute,-35,@StartTime) and EndPointID = @EPID)as '36',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-37,@StartTime)  and DATEADD(minute,-36,@StartTime) and EndPointID = @EPID)as '37',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-38,@StartTime)  and DATEADD(minute,-37,@StartTime) and EndPointID = @EPID)as '38',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-39,@StartTime)  and DATEADD(minute,-38,@StartTime) and EndPointID = @EPID)as '39',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-40,@StartTime)  and DATEADD(minute,-39,@StartTime) and EndPointID = @EPID)as '40',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-41,@StartTime)  and DATEADD(minute,-40,@StartTime) and EndPointID = @EPID)as '41',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-42,@StartTime)  and DATEADD(minute,-41,@StartTime) and EndPointID = @EPID)as '42',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-43,@StartTime)  and DATEADD(minute,-42,@StartTime) and EndPointID = @EPID)as '43',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-44,@StartTime)  and DATEADD(minute,-43,@StartTime) and EndPointID = @EPID)as '44',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-45,@StartTime)  and DATEADD(minute,-44,@StartTime) and EndPointID = @EPID)as '45',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-46,@StartTime)  and DATEADD(minute,-45,@StartTime) and EndPointID = @EPID)as '46',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-47,@StartTime)  and DATEADD(minute,-46,@StartTime) and EndPointID = @EPID)as '47',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-48,@StartTime)  and DATEADD(minute,-47,@StartTime) and EndPointID = @EPID)as '48',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-49,@StartTime)  and DATEADD(minute,-48,@StartTime) and EndPointID = @EPID)as '49',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-50,@StartTime)  and DATEADD(minute,-49,@StartTime) and EndPointID = @EPID)as '50',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-51,@StartTime)  and DATEADD(minute,-50,@StartTime) and EndPointID = @EPID)as '51',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-52,@StartTime)  and DATEADD(minute,-51,@StartTime) and EndPointID = @EPID)as '52',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-53,@StartTime)  and DATEADD(minute,-52,@StartTime) and EndPointID = @EPID)as '53',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-54,@StartTime)  and DATEADD(minute,-53,@StartTime) and EndPointID = @EPID)as '54',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-55,@StartTime)  and DATEADD(minute,-54,@StartTime) and EndPointID = @EPID)as '55',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-56,@StartTime)  and DATEADD(minute,-55,@StartTime) and EndPointID = @EPID)as '56',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-57,@StartTime)  and DATEADD(minute,-56,@StartTime) and EndPointID = @EPID)as '57',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-58,@StartTime)  and DATEADD(minute,-57,@StartTime) and EndPointID = @EPID)as '58',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-59,@StartTime)  and DATEADD(minute,-58,@StartTime) and EndPointID = @EPID)as '59',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-60,@StartTime)  and DATEADD(minute,-59,@StartTime) and EndPointID = @EPID)as '60'


from [Endpoints] e where e.ID = @EPID

union all

(
select ID,Title,'max' as 'Fx',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-1,@StartTime)  and DATEADD(minute,-0,@StartTime) and EndPointID = @EPID)as '1',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-2,@StartTime)  and DATEADD(minute,-1,@StartTime) and EndPointID = @EPID)as '2',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-3,@StartTime)  and DATEADD(minute,-2,@StartTime) and EndPointID = @EPID)as '3',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-4,@StartTime)  and DATEADD(minute,-3,@StartTime) and EndPointID = @EPID)as '4',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-5,@StartTime)  and DATEADD(minute,-4,@StartTime) and EndPointID = @EPID)as '5',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-6,@StartTime)  and DATEADD(minute,-5,@StartTime) and EndPointID = @EPID)as '6',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-7,@StartTime)  and DATEADD(minute,-6,@StartTime) and EndPointID = @EPID)as '7',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-8,@StartTime)  and DATEADD(minute,-7,@StartTime) and EndPointID = @EPID)as '8',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-9,@StartTime)  and DATEADD(minute,-8,@StartTime) and EndPointID = @EPID)as '9',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-10,@StartTime)  and DATEADD(minute,-9,@StartTime) and EndPointID = @EPID)as '10',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-11,@StartTime)  and DATEADD(minute,-10,@StartTime) and EndPointID = @EPID)as '11',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-12,@StartTime)  and DATEADD(minute,-11,@StartTime) and EndPointID = @EPID)as '12',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-13,@StartTime)  and DATEADD(minute,-12,@StartTime) and EndPointID = @EPID)as '13',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-14,@StartTime)  and DATEADD(minute,-13,@StartTime) and EndPointID = @EPID)as '14',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-15,@StartTime)  and DATEADD(minute,-14,@StartTime) and EndPointID = @EPID)as '15',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-16,@StartTime)  and DATEADD(minute,-15,@StartTime) and EndPointID = @EPID)as '16',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-17,@StartTime)  and DATEADD(minute,-16,@StartTime) and EndPointID = @EPID)as '17',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-18,@StartTime)  and DATEADD(minute,-17,@StartTime) and EndPointID = @EPID)as '18',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-19,@StartTime)  and DATEADD(minute,-18,@StartTime) and EndPointID = @EPID)as '19',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-20,@StartTime)  and DATEADD(minute,-19,@StartTime) and EndPointID = @EPID)as '20',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-21,@StartTime)  and DATEADD(minute,-20,@StartTime) and EndPointID = @EPID)as '21',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-22,@StartTime)  and DATEADD(minute,-21,@StartTime) and EndPointID = @EPID)as '22',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-23,@StartTime)  and DATEADD(minute,-22,@StartTime) and EndPointID = @EPID)as '23',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-24,@StartTime)  and DATEADD(minute,-23,@StartTime) and EndPointID = @EPID)as '24',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-25,@StartTime)  and DATEADD(minute,-24,@StartTime) and EndPointID = @EPID)as '25',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-26,@StartTime)  and DATEADD(minute,-25,@StartTime) and EndPointID = @EPID)as '26',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-27,@StartTime)  and DATEADD(minute,-26,@StartTime) and EndPointID = @EPID)as '27',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-28,@StartTime)  and DATEADD(minute,-27,@StartTime) and EndPointID = @EPID)as '28',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-29,@StartTime)  and DATEADD(minute,-28,@StartTime) and EndPointID = @EPID)as '29',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-30,@StartTime)  and DATEADD(minute,-29,@StartTime) and EndPointID = @EPID)as '30',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-31,@StartTime)  and DATEADD(minute,-30,@StartTime) and EndPointID = @EPID)as '31',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-32,@StartTime)  and DATEADD(minute,-31,@StartTime) and EndPointID = @EPID)as '32',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-33,@StartTime)  and DATEADD(minute,-32,@StartTime) and EndPointID = @EPID)as '33',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-34,@StartTime)  and DATEADD(minute,-33,@StartTime) and EndPointID = @EPID)as '34',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-35,@StartTime)  and DATEADD(minute,-34,@StartTime) and EndPointID = @EPID)as '35',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-36,@StartTime)  and DATEADD(minute,-35,@StartTime) and EndPointID = @EPID)as '36',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-37,@StartTime)  and DATEADD(minute,-36,@StartTime) and EndPointID = @EPID)as '37',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-38,@StartTime)  and DATEADD(minute,-37,@StartTime) and EndPointID = @EPID)as '38',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-39,@StartTime)  and DATEADD(minute,-38,@StartTime) and EndPointID = @EPID)as '39',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-40,@StartTime)  and DATEADD(minute,-39,@StartTime) and EndPointID = @EPID)as '40',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-41,@StartTime)  and DATEADD(minute,-40,@StartTime) and EndPointID = @EPID)as '41',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-42,@StartTime)  and DATEADD(minute,-41,@StartTime) and EndPointID = @EPID)as '42',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-43,@StartTime)  and DATEADD(minute,-42,@StartTime) and EndPointID = @EPID)as '43',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-44,@StartTime)  and DATEADD(minute,-43,@StartTime) and EndPointID = @EPID)as '44',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-45,@StartTime)  and DATEADD(minute,-44,@StartTime) and EndPointID = @EPID)as '45',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-46,@StartTime)  and DATEADD(minute,-45,@StartTime) and EndPointID = @EPID)as '46',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-47,@StartTime)  and DATEADD(minute,-46,@StartTime) and EndPointID = @EPID)as '47',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-48,@StartTime)  and DATEADD(minute,-47,@StartTime) and EndPointID = @EPID)as '48',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-49,@StartTime)  and DATEADD(minute,-48,@StartTime) and EndPointID = @EPID)as '49',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-50,@StartTime)  and DATEADD(minute,-49,@StartTime) and EndPointID = @EPID)as '50',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-51,@StartTime)  and DATEADD(minute,-50,@StartTime) and EndPointID = @EPID)as '51',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-52,@StartTime)  and DATEADD(minute,-51,@StartTime) and EndPointID = @EPID)as '52',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-53,@StartTime)  and DATEADD(minute,-52,@StartTime) and EndPointID = @EPID)as '53',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-54,@StartTime)  and DATEADD(minute,-53,@StartTime) and EndPointID = @EPID)as '54',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-55,@StartTime)  and DATEADD(minute,-54,@StartTime) and EndPointID = @EPID)as '55',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-56,@StartTime)  and DATEADD(minute,-55,@StartTime) and EndPointID = @EPID)as '56',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-57,@StartTime)  and DATEADD(minute,-56,@StartTime) and EndPointID = @EPID)as '57',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-58,@StartTime)  and DATEADD(minute,-57,@StartTime) and EndPointID = @EPID)as '58',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-59,@StartTime)  and DATEADD(minute,-58,@StartTime) and EndPointID = @EPID)as '59',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-60,@StartTime)  and DATEADD(minute,-59,@StartTime) and EndPointID = @EPID)as '60'

from [Endpoints] e where e.ID = @EPID

)
union all
(
select ID,Title,'avg' as 'Fx',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-1,@StartTime)  and DATEADD(minute,-0,@StartTime) and EndPointID = @EPID)as '1',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-2,@StartTime)  and DATEADD(minute,-1,@StartTime) and EndPointID = @EPID)as '2',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-3,@StartTime)  and DATEADD(minute,-2,@StartTime) and EndPointID = @EPID)as '3',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-4,@StartTime)  and DATEADD(minute,-3,@StartTime) and EndPointID = @EPID)as '4',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-5,@StartTime)  and DATEADD(minute,-4,@StartTime) and EndPointID = @EPID)as '5',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-6,@StartTime)  and DATEADD(minute,-5,@StartTime) and EndPointID = @EPID)as '6',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-7,@StartTime)  and DATEADD(minute,-6,@StartTime) and EndPointID = @EPID)as '7',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-8,@StartTime)  and DATEADD(minute,-7,@StartTime) and EndPointID = @EPID)as '8',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-9,@StartTime)  and DATEADD(minute,-8,@StartTime) and EndPointID = @EPID)as '9',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-10,@StartTime)  and DATEADD(minute,-9,@StartTime) and EndPointID = @EPID)as '10',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-11,@StartTime)  and DATEADD(minute,-10,@StartTime) and EndPointID = @EPID)as '11',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-12,@StartTime)  and DATEADD(minute,-11,@StartTime) and EndPointID = @EPID)as '12',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-13,@StartTime)  and DATEADD(minute,-12,@StartTime) and EndPointID = @EPID)as '13',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-14,@StartTime)  and DATEADD(minute,-13,@StartTime) and EndPointID = @EPID)as '14',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-15,@StartTime)  and DATEADD(minute,-14,@StartTime) and EndPointID = @EPID)as '15',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-16,@StartTime)  and DATEADD(minute,-15,@StartTime) and EndPointID = @EPID)as '16',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-17,@StartTime)  and DATEADD(minute,-16,@StartTime) and EndPointID = @EPID)as '17',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-18,@StartTime)  and DATEADD(minute,-17,@StartTime) and EndPointID = @EPID)as '18',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-19,@StartTime)  and DATEADD(minute,-18,@StartTime) and EndPointID = @EPID)as '19',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-20,@StartTime)  and DATEADD(minute,-19,@StartTime) and EndPointID = @EPID)as '20',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-21,@StartTime)  and DATEADD(minute,-20,@StartTime) and EndPointID = @EPID)as '21',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-22,@StartTime)  and DATEADD(minute,-21,@StartTime) and EndPointID = @EPID)as '22',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-23,@StartTime)  and DATEADD(minute,-22,@StartTime) and EndPointID = @EPID)as '23',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-24,@StartTime)  and DATEADD(minute,-23,@StartTime) and EndPointID = @EPID)as '24',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-25,@StartTime)  and DATEADD(minute,-24,@StartTime) and EndPointID = @EPID)as '25',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-26,@StartTime)  and DATEADD(minute,-25,@StartTime) and EndPointID = @EPID)as '26',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-27,@StartTime)  and DATEADD(minute,-26,@StartTime) and EndPointID = @EPID)as '27',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-28,@StartTime)  and DATEADD(minute,-27,@StartTime) and EndPointID = @EPID)as '28',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-29,@StartTime)  and DATEADD(minute,-28,@StartTime) and EndPointID = @EPID)as '29',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-30,@StartTime)  and DATEADD(minute,-29,@StartTime) and EndPointID = @EPID)as '30',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-31,@StartTime)  and DATEADD(minute,-30,@StartTime) and EndPointID = @EPID)as '31',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-32,@StartTime)  and DATEADD(minute,-31,@StartTime) and EndPointID = @EPID)as '32',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-33,@StartTime)  and DATEADD(minute,-32,@StartTime) and EndPointID = @EPID)as '33',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-34,@StartTime)  and DATEADD(minute,-33,@StartTime) and EndPointID = @EPID)as '34',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-35,@StartTime)  and DATEADD(minute,-34,@StartTime) and EndPointID = @EPID)as '35',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-36,@StartTime)  and DATEADD(minute,-35,@StartTime) and EndPointID = @EPID)as '36',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-37,@StartTime)  and DATEADD(minute,-36,@StartTime) and EndPointID = @EPID)as '37',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-38,@StartTime)  and DATEADD(minute,-37,@StartTime) and EndPointID = @EPID)as '38',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-39,@StartTime)  and DATEADD(minute,-38,@StartTime) and EndPointID = @EPID)as '39',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-40,@StartTime)  and DATEADD(minute,-39,@StartTime) and EndPointID = @EPID)as '40',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-41,@StartTime)  and DATEADD(minute,-40,@StartTime) and EndPointID = @EPID)as '41',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-42,@StartTime)  and DATEADD(minute,-41,@StartTime) and EndPointID = @EPID)as '42',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-43,@StartTime)  and DATEADD(minute,-42,@StartTime) and EndPointID = @EPID)as '43',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-44,@StartTime)  and DATEADD(minute,-43,@StartTime) and EndPointID = @EPID)as '44',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-45,@StartTime)  and DATEADD(minute,-44,@StartTime) and EndPointID = @EPID)as '45',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-46,@StartTime)  and DATEADD(minute,-45,@StartTime) and EndPointID = @EPID)as '46',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-47,@StartTime)  and DATEADD(minute,-46,@StartTime) and EndPointID = @EPID)as '47',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-48,@StartTime)  and DATEADD(minute,-47,@StartTime) and EndPointID = @EPID)as '48',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-49,@StartTime)  and DATEADD(minute,-48,@StartTime) and EndPointID = @EPID)as '49',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-50,@StartTime)  and DATEADD(minute,-49,@StartTime) and EndPointID = @EPID)as '50',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-51,@StartTime)  and DATEADD(minute,-50,@StartTime) and EndPointID = @EPID)as '51',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-52,@StartTime)  and DATEADD(minute,-51,@StartTime) and EndPointID = @EPID)as '52',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-53,@StartTime)  and DATEADD(minute,-52,@StartTime) and EndPointID = @EPID)as '53',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-54,@StartTime)  and DATEADD(minute,-53,@StartTime) and EndPointID = @EPID)as '54',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-55,@StartTime)  and DATEADD(minute,-54,@StartTime) and EndPointID = @EPID)as '55',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-56,@StartTime)  and DATEADD(minute,-55,@StartTime) and EndPointID = @EPID)as '56',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-57,@StartTime)  and DATEADD(minute,-56,@StartTime) and EndPointID = @EPID)as '57',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-58,@StartTime)  and DATEADD(minute,-57,@StartTime) and EndPointID = @EPID)as '58',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-59,@StartTime)  and DATEADD(minute,-58,@StartTime) and EndPointID = @EPID)as '59',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between DATEADD(minute,-60,@StartTime)  and DATEADD(minute,-59,@StartTime) and EndPointID = @EPID)as '60'



from [Endpoints] e where e.ID = @EPID

)
end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_EndPoint_IOs_MonthAVG]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Rpt_EndPoint_IOs_MonthAVG] 
 @EPID bigint
 as
 begin
 SET NOCOUNT ON
 select ID,Title, 

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '1-1-2016' and '1-31-2016' and EndPointID = @EPID)as '1',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '2-1-2016' and '2-28-2016' and EndPointID = @EPID)as '2',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '3-1-2016' and '3-31-2016' and EndPointID = @EPID)as '3',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '4-1-2016' and '4-30-2016' and EndPointID = @EPID)as '4',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '5-1-2016' and '5-31-2016' and EndPointID = @EPID)as '5',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '6-1-2016' and '6-30-2016' and EndPointID = @EPID)as '6',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '7-1-2016' and '7-30-2016' and EndPointID = @EPID)as '7',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '8-1-2016' and '8-31-2016' and EndPointID = @EPID)as '8',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '9-1-2016' and '9-30-2016' and EndPointID = @EPID)as '9',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '10-1-2016' and '10-31-2016' and EndPointID = @EPID)as '10',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '11-1-2016' and '11-30-2016' and EndPointID = @EPID)as '11',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '12-1-2016' and '12-31-2016' and EndPointID = @EPID)as '12'

from [Endpoints] e where e.ID = @EPID
end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_EndPoint_IOs_MonthMAX]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Rpt_EndPoint_IOs_MonthMAX] 
 @EPID bigint
 as
 begin
 SET NOCOUNT ON
 select ID,Title, 

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '1-1-2016' and '1-31-2016' and EndPointID = @EPID)as '1',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '2-1-2016' and '2-28-2016' and EndPointID = @EPID)as '2',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '3-1-2016' and '3-31-2016' and EndPointID = @EPID)as '3',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '4-1-2016' and '4-30-2016' and EndPointID = @EPID)as '4',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '5-1-2016' and '5-31-2016' and EndPointID = @EPID)as '5',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '6-1-2016' and '6-30-2016' and EndPointID = @EPID)as '6',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '7-1-2016' and '7-30-2016' and EndPointID = @EPID)as '7',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '8-1-2016' and '8-31-2016' and EndPointID = @EPID)as '8',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '9-1-2016' and '9-30-2016' and EndPointID = @EPID)as '9',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '10-1-2016' and '10-31-2016' and EndPointID = @EPID)as '10',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '11-1-2016' and '11-30-2016' and EndPointID = @EPID)as '11',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between '12-1-2016' and '12-31-2016' and EndPointID = @EPID)as '12'

from [Endpoints] e where e.ID = @EPID
end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_EndPoint_IOs_Months]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Rpt_EndPoint_IOs_Months] 
 @EPID bigint,
 @Year nvarchar(4)
 as
 begin
 SET NOCOUNT ON
 select ID,Title,'Min' as 'Fx',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 1 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '1',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 2 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '2',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 3 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '3',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 4 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '4',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 5 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '5',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 6 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '6',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 7 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '7',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 8 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '8',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 9 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '9',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 10 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '10',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 11 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '11',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 12 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '12'

from [Endpoints] e where e.ID = @EPID

union all(

  select ID,Title,'max' as 'Fx',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 1 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '1',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 2 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '2',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 3 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '3',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 4 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '4',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 5 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '5',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 6 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '6',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 7 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '7',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 8 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '8',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 9 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '9',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 10 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '10',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 11 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '11',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 12 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '12'

from [Endpoints] e where e.ID = @EPID

)union all(

  select ID,Title,'avg' as 'Fx',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 1 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '1',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 2 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '2',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 3 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '3',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 4 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '4',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 5 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '5',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 6 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '6',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 7 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '7',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 8 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '8',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 9 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '9',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 10 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '10',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 11 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '11',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 12 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '12'

from [Endpoints] e where e.ID = @EPID

)
end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_EndPointAndDevices_IOsCount_Minutes]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Rpt_EndPointAndDevices_IOsCount_Minutes] 
 as
 begin
 SET NOCOUNT ON


 select '1' as 'ObjectCode', 
	'EndPoints' as 'Object',

	(select count(valu)from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-1,GETUTCDATE())  and GETUTCDATE())as '1',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-2,GETUTCDATE())  and DATEADD(minute,-1,GETUTCDATE()))as '2',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-3,GETUTCDATE())  and DATEADD(minute,-2,GETUTCDATE()))as '3',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-4,GETUTCDATE())  and DATEADD(minute,-3,GETUTCDATE()))as '4',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-5,GETUTCDATE())  and DATEADD(minute,-4,GETUTCDATE()))as '5',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-6,GETUTCDATE())  and DATEADD(minute,-5,GETUTCDATE()))as '6',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-7,GETUTCDATE())  and DATEADD(minute,-6,GETUTCDATE()))as '7',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-8,GETUTCDATE())  and DATEADD(minute,-7,GETUTCDATE()))as '8',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-9,GETUTCDATE())  and DATEADD(minute,-8,GETUTCDATE()))as '9',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-10,GETUTCDATE())  and DATEADD(minute,-9,GETUTCDATE()))as '10',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-11,GETUTCDATE())  and DATEADD(minute,-10,GETUTCDATE()))as '11',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-12,GETUTCDATE())  and DATEADD(minute,-11,GETUTCDATE()))as '12',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-13,GETUTCDATE())  and DATEADD(minute,-12,GETUTCDATE()))as '13',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-14,GETUTCDATE())  and DATEADD(minute,-13,GETUTCDATE()))as '14',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-15,GETUTCDATE())  and DATEADD(minute,-14,GETUTCDATE()))as '15',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-16,GETUTCDATE())  and DATEADD(minute,-15,GETUTCDATE()))as '16',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-17,GETUTCDATE())  and DATEADD(minute,-16,GETUTCDATE()))as '17',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-18,GETUTCDATE())  and DATEADD(minute,-17,GETUTCDATE()))as '18',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-19,GETUTCDATE())  and DATEADD(minute,-18,GETUTCDATE()))as '19',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-20,GETUTCDATE())  and DATEADD(minute,-19,GETUTCDATE()))as '20',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-21,GETUTCDATE())  and DATEADD(minute,-20,GETUTCDATE()))as '21',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-22,GETUTCDATE())  and DATEADD(minute,-21,GETUTCDATE()))as '22',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-23,GETUTCDATE())  and DATEADD(minute,-22,GETUTCDATE()))as '23',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-24,GETUTCDATE())  and DATEADD(minute,-23,GETUTCDATE()))as '24',

		(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-25,GETUTCDATE())  and DATEADD(minute,-24,GETUTCDATE()))as '25',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-26,GETUTCDATE())  and DATEADD(minute,-25,GETUTCDATE()))as '26',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-27,GETUTCDATE())  and DATEADD(minute,-26,GETUTCDATE()))as '27',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-28,GETUTCDATE())  and DATEADD(minute,-27,GETUTCDATE()))as '28',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-29,GETUTCDATE())  and DATEADD(minute,-28,GETUTCDATE()))as '29',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-30,GETUTCDATE())  and DATEADD(minute,-29,GETUTCDATE()))as '30',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-31,GETUTCDATE())  and DATEADD(minute,-30,GETUTCDATE()))as '31',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-32,GETUTCDATE())  and DATEADD(minute,-31,GETUTCDATE()))as '32',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-33,GETUTCDATE())  and DATEADD(minute,-32,GETUTCDATE()))as '33',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-34,GETUTCDATE())  and DATEADD(minute,-33,GETUTCDATE()))as '34',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-35,GETUTCDATE())  and DATEADD(minute,-34,GETUTCDATE()))as '35',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-36,GETUTCDATE())  and DATEADD(minute,-35,GETUTCDATE()))as '36',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-37,GETUTCDATE())  and DATEADD(minute,-36,GETUTCDATE()))as '37',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-38,GETUTCDATE())  and DATEADD(minute,-37,GETUTCDATE()))as '38',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-39,GETUTCDATE())  and DATEADD(minute,-38,GETUTCDATE()))as '39',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-40,GETUTCDATE())  and DATEADD(minute,-39,GETUTCDATE()))as '40',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-41,GETUTCDATE())  and DATEADD(minute,-40,GETUTCDATE()))as '41',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-42,GETUTCDATE())  and DATEADD(minute,-41,GETUTCDATE()))as '42',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-43,GETUTCDATE())  and DATEADD(minute,-42,GETUTCDATE()))as '43',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-44,GETUTCDATE())  and DATEADD(minute,-43,GETUTCDATE()))as '44',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-45,GETUTCDATE())  and DATEADD(minute,-44,GETUTCDATE()))as '45',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-46,GETUTCDATE())  and DATEADD(minute,-45,GETUTCDATE()))as '46',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-47,GETUTCDATE())  and DATEADD(minute,-46,GETUTCDATE()))as '47',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-48,GETUTCDATE())  and DATEADD(minute,-47,GETUTCDATE()))as '48',

		(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-49,GETUTCDATE())  and DATEADD(minute,-48,GETUTCDATE()))as '49',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-50,GETUTCDATE())  and DATEADD(minute,-49,GETUTCDATE()))as '50',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-51,GETUTCDATE())  and DATEADD(minute,-50,GETUTCDATE()))as '51',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-52,GETUTCDATE())  and DATEADD(minute,-51,GETUTCDATE()))as '52',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-53,GETUTCDATE())  and DATEADD(minute,-52,GETUTCDATE()))as '53',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-54,GETUTCDATE())  and DATEADD(minute,-53,GETUTCDATE()))as '54',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-55,GETUTCDATE())  and DATEADD(minute,-54,GETUTCDATE()))as '55',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-56,GETUTCDATE())  and DATEADD(minute,-55,GETUTCDATE()))as '56',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-57,GETUTCDATE())  and DATEADD(minute,-56,GETUTCDATE()))as '57',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-58,GETUTCDATE())  and DATEADD(minute,-57,GETUTCDATE()))as '58',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-59,GETUTCDATE())  and DATEADD(minute,-58,GETUTCDATE()))as '59',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-60,GETUTCDATE())  and DATEADD(minute,-59,GETUTCDATE()))as '60'


union all
(
 select '2' as 'ObjectCode', 
	'Devices' as 'Object',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-1,GETUTCDATE())  and GETUTCDATE())as '1',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-2,GETUTCDATE())  and DATEADD(minute,-1,GETUTCDATE()))as '2',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-3,GETUTCDATE())  and DATEADD(minute,-2,GETUTCDATE()))as '3',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-4,GETUTCDATE())  and DATEADD(minute,-3,GETUTCDATE()))as '4',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-5,GETUTCDATE())  and DATEADD(minute,-4,GETUTCDATE()))as '5',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-6,GETUTCDATE())  and DATEADD(minute,-5,GETUTCDATE()))as '6',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-7,GETUTCDATE())  and DATEADD(minute,-6,GETUTCDATE()))as '7',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-8,GETUTCDATE())  and DATEADD(minute,-7,GETUTCDATE()))as '8',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-9,GETUTCDATE())  and DATEADD(minute,-8,GETUTCDATE()))as '9',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-10,GETUTCDATE())  and DATEADD(minute,-9,GETUTCDATE()))as '10',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-11,GETUTCDATE())  and DATEADD(minute,-10,GETUTCDATE()))as '11',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-12,GETUTCDATE())  and DATEADD(minute,-11,GETUTCDATE()))as '12',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-13,GETUTCDATE())  and DATEADD(minute,-12,GETUTCDATE()))as '13',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-14,GETUTCDATE())  and DATEADD(minute,-13,GETUTCDATE()))as '14',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-15,GETUTCDATE())  and DATEADD(minute,-14,GETUTCDATE()))as '15',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-16,GETUTCDATE())  and DATEADD(minute,-15,GETUTCDATE()))as '16',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-17,GETUTCDATE())  and DATEADD(minute,-16,GETUTCDATE()))as '17',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-18,GETUTCDATE())  and DATEADD(minute,-17,GETUTCDATE()))as '18',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-19,GETUTCDATE())  and DATEADD(minute,-18,GETUTCDATE()))as '19',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-20,GETUTCDATE())  and DATEADD(minute,-19,GETUTCDATE()))as '20',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-21,GETUTCDATE())  and DATEADD(minute,-20,GETUTCDATE()))as '21',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-22,GETUTCDATE())  and DATEADD(minute,-21,GETUTCDATE()))as '22',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-23,GETUTCDATE())  and DATEADD(minute,-22,GETUTCDATE()))as '23',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-24,GETUTCDATE())  and DATEADD(minute,-23,GETUTCDATE()))as '24',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-25,GETUTCDATE())  and DATEADD(minute,-24,GETUTCDATE()))as '25',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-26,GETUTCDATE())  and DATEADD(minute,-25,GETUTCDATE()))as '26',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-27,GETUTCDATE())  and DATEADD(minute,-26,GETUTCDATE()))as '27',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-28,GETUTCDATE())  and DATEADD(minute,-27,GETUTCDATE()))as '28',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-29,GETUTCDATE())  and DATEADD(minute,-28,GETUTCDATE()))as '29',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-30,GETUTCDATE())  and DATEADD(minute,-29,GETUTCDATE()))as '30',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-31,GETUTCDATE())  and DATEADD(minute,-30,GETUTCDATE()))as '31',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-32,GETUTCDATE())  and DATEADD(minute,-31,GETUTCDATE()))as '32',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-33,GETUTCDATE())  and DATEADD(minute,-32,GETUTCDATE()))as '33',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-34,GETUTCDATE())  and DATEADD(minute,-33,GETUTCDATE()))as '34',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-35,GETUTCDATE())  and DATEADD(minute,-34,GETUTCDATE()))as '35',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-36,GETUTCDATE())  and DATEADD(minute,-35,GETUTCDATE()))as '36',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-37,GETUTCDATE())  and DATEADD(minute,-36,GETUTCDATE()))as '37',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-38,GETUTCDATE())  and DATEADD(minute,-37,GETUTCDATE()))as '38',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-39,GETUTCDATE())  and DATEADD(minute,-38,GETUTCDATE()))as '39',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-40,GETUTCDATE())  and DATEADD(minute,-39,GETUTCDATE()))as '40',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-41,GETUTCDATE())  and DATEADD(minute,-40,GETUTCDATE()))as '41',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-42,GETUTCDATE())  and DATEADD(minute,-41,GETUTCDATE()))as '42',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-43,GETUTCDATE())  and DATEADD(minute,-42,GETUTCDATE()))as '43',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-44,GETUTCDATE())  and DATEADD(minute,-43,GETUTCDATE()))as '44',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-45,GETUTCDATE())  and DATEADD(minute,-44,GETUTCDATE()))as '45',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-46,GETUTCDATE())  and DATEADD(minute,-45,GETUTCDATE()))as '46',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-47,GETUTCDATE())  and DATEADD(minute,-46,GETUTCDATE()))as '47',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-48,GETUTCDATE())  and DATEADD(minute,-47,GETUTCDATE()))as '48',

		(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-49,GETUTCDATE())  and DATEADD(minute,-48,GETUTCDATE()))as '49',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-50,GETUTCDATE())  and DATEADD(minute,-49,GETUTCDATE()))as '50',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-51,GETUTCDATE())  and DATEADD(minute,-50,GETUTCDATE()))as '51',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-52,GETUTCDATE())  and DATEADD(minute,-51,GETUTCDATE()))as '52',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-53,GETUTCDATE())  and DATEADD(minute,-52,GETUTCDATE()))as '53',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-54,GETUTCDATE())  and DATEADD(minute,-53,GETUTCDATE()))as '54',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-55,GETUTCDATE())  and DATEADD(minute,-54,GETUTCDATE()))as '55',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-56,GETUTCDATE())  and DATEADD(minute,-55,GETUTCDATE()))as '56',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-57,GETUTCDATE())  and DATEADD(minute,-56,GETUTCDATE()))as '57',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-58,GETUTCDATE())  and DATEADD(minute,-57,GETUTCDATE()))as '58',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-59,GETUTCDATE())  and DATEADD(minute,-58,GETUTCDATE()))as '59',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-60,GETUTCDATE())  and DATEADD(minute,-59,GETUTCDATE()))as '60'
)
end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_LastHoursConnections]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Rpt_LastHoursConnections]
as
begin
	select (
		select count(valu)  from EndPointIOs
		where [execTimeStamp_utc] between DATEADD(HOUR,-1,GETUTCDATE())  and GETUTCDATE())
		as 'EndPointConnections',

		(select count(valu)  from DeviceIOs
		where [execTimeStamp_utc] between DATEADD(HOUR,-1,GETUTCDATE())  and GETUTCDATE()
		) as 'DeviceConnections',

		(select count(id)  from APIUtilisations
		where [TimeStampUTC] between DATEADD(HOUR,-1,GETUTCDATE())  and GETUTCDATE()
		) as 'APIConnections'
end

exec Rpt_LastHoursConnections
GO
/****** Object:  StoredProcedure [dbo].[Rpt_ThingEnd_IOs_Days]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[Rpt_ThingEnd_IOs_Days] 
 @ThingID bigint,
 @TypeID bigint
 as
 begin
 SET NOCOUNT ON

	declare @EPTimeZone int 
	select @EPTimeZone =  4
 declare @StartTime datetime
 set @StartTime = dateadd(hour,@EPTimeZone,GETUTCDATE() )

 select ID,Title,'Min' as 'Fx',

	(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-1,@StartTime)  and DATEADD(Day,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-2,@StartTime)  and DATEADD(Day,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-3,@StartTime)  and DATEADD(Day,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-4,@StartTime)  and DATEADD(Day,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-5,@StartTime)  and DATEADD(Day,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-6,@StartTime)  and DATEADD(Day,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-7,@StartTime)  and DATEADD(Day,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-8,@StartTime)  and DATEADD(Day,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-9,@StartTime)  and DATEADD(Day,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-10,@StartTime)  and DATEADD(Day,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-11,@StartTime)  and DATEADD(Day,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-12,@StartTime)  and DATEADD(Day,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-13,@StartTime)  and DATEADD(Day,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-14,@StartTime)  and DATEADD(Day,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-15,@StartTime)  and DATEADD(Day,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-16,@StartTime)  and DATEADD(Day,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-17,@StartTime)  and DATEADD(Day,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-18,@StartTime)  and DATEADD(Day,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-19,@StartTime)  and DATEADD(Day,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-20,@StartTime)  and DATEADD(Day,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-21,@StartTime)  and DATEADD(Day,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-22,@StartTime)  and DATEADD(Day,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-23,@StartTime)  and DATEADD(Day,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-24,@StartTime)  and DATEADD(Day,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24',
	
(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-25,@StartTime)  and DATEADD(Day,-24,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '25',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-26,@StartTime)  and DATEADD(Day,-25,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '26',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-27,@StartTime)  and DATEADD(Day,-26,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '27',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-28,@StartTime)  and DATEADD(Day,-27,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '28',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-29,@StartTime)  and DATEADD(Day,-28,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '29',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-30,@StartTime)  and DATEADD(Day,-29,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '30'

from 
	Things t
where 
	t.ID = @ThingID

	union all (

	 select ID,Title,'Max' as 'Fx',

	(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-1,@StartTime)  and DATEADD(Day,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-2,@StartTime)  and DATEADD(Day,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-3,@StartTime)  and DATEADD(Day,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-4,@StartTime)  and DATEADD(Day,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-5,@StartTime)  and DATEADD(Day,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-6,@StartTime)  and DATEADD(Day,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-7,@StartTime)  and DATEADD(Day,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-8,@StartTime)  and DATEADD(Day,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-9,@StartTime)  and DATEADD(Day,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-10,@StartTime)  and DATEADD(Day,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-11,@StartTime)  and DATEADD(Day,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-12,@StartTime)  and DATEADD(Day,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-13,@StartTime)  and DATEADD(Day,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-14,@StartTime)  and DATEADD(Day,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-15,@StartTime)  and DATEADD(Day,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-16,@StartTime)  and DATEADD(Day,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-17,@StartTime)  and DATEADD(Day,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-18,@StartTime)  and DATEADD(Day,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-19,@StartTime)  and DATEADD(Day,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-20,@StartTime)  and DATEADD(Day,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-21,@StartTime)  and DATEADD(Day,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-22,@StartTime)  and DATEADD(Day,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-23,@StartTime)  and DATEADD(Day,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-24,@StartTime)  and DATEADD(Day,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-25,@StartTime)  and DATEADD(Day,-24,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '25',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-26,@StartTime)  and DATEADD(Day,-25,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '26',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-27,@StartTime)  and DATEADD(Day,-26,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '27',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-28,@StartTime)  and DATEADD(Day,-27,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '28',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-29,@StartTime)  and DATEADD(Day,-28,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '29',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-30,@StartTime)  and DATEADD(Day,-29,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '30'


from 
	Things t
where 
	t.ID = @ThingID

	)union all (

	 select ID,Title,'avg' as 'Fx',

	(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-1,@StartTime)  and DATEADD(Day,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-2,@StartTime)  and DATEADD(Day,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-3,@StartTime)  and DATEADD(Day,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-4,@StartTime)  and DATEADD(Day,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-5,@StartTime)  and DATEADD(Day,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-6,@StartTime)  and DATEADD(Day,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-7,@StartTime)  and DATEADD(Day,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-8,@StartTime)  and DATEADD(Day,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-9,@StartTime)  and DATEADD(Day,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-10,@StartTime)  and DATEADD(Day,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-11,@StartTime)  and DATEADD(Day,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-12,@StartTime)  and DATEADD(Day,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-13,@StartTime)  and DATEADD(Day,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-14,@StartTime)  and DATEADD(Day,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-15,@StartTime)  and DATEADD(Day,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-16,@StartTime)  and DATEADD(Day,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-17,@StartTime)  and DATEADD(Day,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-18,@StartTime)  and DATEADD(Day,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-19,@StartTime)  and DATEADD(Day,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-20,@StartTime)  and DATEADD(Day,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-21,@StartTime)  and DATEADD(Day,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-22,@StartTime)  and DATEADD(Day,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-23,@StartTime)  and DATEADD(Day,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-24,@StartTime)  and DATEADD(Day,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-25,@StartTime)  and DATEADD(Day,-24,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '25',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-26,@StartTime)  and DATEADD(Day,-25,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '26',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-27,@StartTime)  and DATEADD(Day,-26,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '27',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-28,@StartTime)  and DATEADD(Day,-27,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '28',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-29,@StartTime)  and DATEADD(Day,-28,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '29',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-30,@StartTime)  and DATEADD(Day,-29,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '30'

	
from 
	Things t
where 
	t.ID = @ThingID

	) union all (

	 select ID,Title,'count' as 'Fx',

	(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-1,@StartTime)  and DATEADD(Day,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-2,@StartTime)  and DATEADD(Day,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-3,@StartTime)  and DATEADD(Day,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-4,@StartTime)  and DATEADD(Day,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-5,@StartTime)  and DATEADD(Day,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-6,@StartTime)  and DATEADD(Day,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-7,@StartTime)  and DATEADD(Day,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-8,@StartTime)  and DATEADD(Day,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-9,@StartTime)  and DATEADD(Day,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-10,@StartTime)  and DATEADD(Day,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-11,@StartTime)  and DATEADD(Day,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-12,@StartTime)  and DATEADD(Day,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-13,@StartTime)  and DATEADD(Day,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-14,@StartTime)  and DATEADD(Day,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-15,@StartTime)  and DATEADD(Day,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-16,@StartTime)  and DATEADD(Day,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-17,@StartTime)  and DATEADD(Day,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-18,@StartTime)  and DATEADD(Day,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-19,@StartTime)  and DATEADD(Day,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-20,@StartTime)  and DATEADD(Day,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-21,@StartTime)  and DATEADD(Day,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-22,@StartTime)  and DATEADD(Day,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-23,@StartTime)  and DATEADD(Day,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-24,@StartTime)  and DATEADD(Day,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-25,@StartTime)  and DATEADD(Day,-24,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '25',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-26,@StartTime)  and DATEADD(Day,-25,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '26',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-27,@StartTime)  and DATEADD(Day,-26,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '27',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-28,@StartTime)  and DATEADD(Day,-27,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '28',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-29,@StartTime)  and DATEADD(Day,-28,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '29',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(Day,-30,@StartTime)  and DATEADD(Day,-29,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '30'

from 
	Things t
where 
	t.ID = @ThingID

	)



end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_ThingEnd_IOs_Hours]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[Rpt_ThingEnd_IOs_Hours] 
 @ThingID bigint,
 @TypeID bigint
 as
 begin
 SET NOCOUNT ON

	declare @EPTimeZone int 
	select @EPTimeZone =  4
 declare @StartTime datetime
 set @StartTime = dateadd(HOUR,@EPTimeZone,GETUTCDATE() )

 select ID,Title,'Min' as 'Fx',

	(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-1,@StartTime)  and DATEADD(hour,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-2,@StartTime)  and DATEADD(hour,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-3,@StartTime)  and DATEADD(hour,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-4,@StartTime)  and DATEADD(hour,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-5,@StartTime)  and DATEADD(hour,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-6,@StartTime)  and DATEADD(hour,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-7,@StartTime)  and DATEADD(hour,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-8,@StartTime)  and DATEADD(hour,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-9,@StartTime)  and DATEADD(hour,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-10,@StartTime)  and DATEADD(hour,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-11,@StartTime)  and DATEADD(hour,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-12,@StartTime)  and DATEADD(hour,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-13,@StartTime)  and DATEADD(hour,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-14,@StartTime)  and DATEADD(hour,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-15,@StartTime)  and DATEADD(hour,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-16,@StartTime)  and DATEADD(hour,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-17,@StartTime)  and DATEADD(hour,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-18,@StartTime)  and DATEADD(hour,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-19,@StartTime)  and DATEADD(hour,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-20,@StartTime)  and DATEADD(hour,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-21,@StartTime)  and DATEADD(hour,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-22,@StartTime)  and DATEADD(hour,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-23,@StartTime)  and DATEADD(hour,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-24,@StartTime)  and DATEADD(hour,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24'
	
from 
	Things t
where 
	t.ID = @ThingID

	union all (

	 select ID,Title,'Max' as 'Fx',

	(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-1,@StartTime)  and DATEADD(hour,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-2,@StartTime)  and DATEADD(hour,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-3,@StartTime)  and DATEADD(hour,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-4,@StartTime)  and DATEADD(hour,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-5,@StartTime)  and DATEADD(hour,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-6,@StartTime)  and DATEADD(hour,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-7,@StartTime)  and DATEADD(hour,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-8,@StartTime)  and DATEADD(hour,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-9,@StartTime)  and DATEADD(hour,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-10,@StartTime)  and DATEADD(hour,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-11,@StartTime)  and DATEADD(hour,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-12,@StartTime)  and DATEADD(hour,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-13,@StartTime)  and DATEADD(hour,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-14,@StartTime)  and DATEADD(hour,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-15,@StartTime)  and DATEADD(hour,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-16,@StartTime)  and DATEADD(hour,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-17,@StartTime)  and DATEADD(hour,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-18,@StartTime)  and DATEADD(hour,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-19,@StartTime)  and DATEADD(hour,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-20,@StartTime)  and DATEADD(hour,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-21,@StartTime)  and DATEADD(hour,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-22,@StartTime)  and DATEADD(hour,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-23,@StartTime)  and DATEADD(hour,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-24,@StartTime)  and DATEADD(hour,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24'
from 
	Things t
where 
	t.ID = @ThingID

	)union all (

	 select ID,Title,'avg' as 'Fx',

	(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-1,@StartTime)  and DATEADD(hour,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-2,@StartTime)  and DATEADD(hour,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-3,@StartTime)  and DATEADD(hour,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-4,@StartTime)  and DATEADD(hour,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-5,@StartTime)  and DATEADD(hour,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-6,@StartTime)  and DATEADD(hour,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-7,@StartTime)  and DATEADD(hour,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-8,@StartTime)  and DATEADD(hour,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-9,@StartTime)  and DATEADD(hour,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-10,@StartTime)  and DATEADD(hour,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-11,@StartTime)  and DATEADD(hour,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-12,@StartTime)  and DATEADD(hour,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-13,@StartTime)  and DATEADD(hour,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-14,@StartTime)  and DATEADD(hour,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-15,@StartTime)  and DATEADD(hour,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-16,@StartTime)  and DATEADD(hour,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-17,@StartTime)  and DATEADD(hour,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-18,@StartTime)  and DATEADD(hour,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-19,@StartTime)  and DATEADD(hour,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-20,@StartTime)  and DATEADD(hour,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-21,@StartTime)  and DATEADD(hour,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-22,@StartTime)  and DATEADD(hour,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-23,@StartTime)  and DATEADD(hour,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-24,@StartTime)  and DATEADD(hour,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24'
	
from 
	Things t
where 
	t.ID = @ThingID

	) union all (

	 select ID,Title,'count' as 'Fx',

	(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-1,@StartTime)  and DATEADD(hour,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-2,@StartTime)  and DATEADD(hour,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-3,@StartTime)  and DATEADD(hour,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-4,@StartTime)  and DATEADD(hour,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-5,@StartTime)  and DATEADD(hour,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-6,@StartTime)  and DATEADD(hour,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-7,@StartTime)  and DATEADD(hour,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-8,@StartTime)  and DATEADD(hour,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-9,@StartTime)  and DATEADD(hour,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-10,@StartTime)  and DATEADD(hour,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-11,@StartTime)  and DATEADD(hour,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-12,@StartTime)  and DATEADD(hour,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-13,@StartTime)  and DATEADD(hour,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-14,@StartTime)  and DATEADD(hour,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-15,@StartTime)  and DATEADD(hour,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-16,@StartTime)  and DATEADD(hour,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-17,@StartTime)  and DATEADD(hour,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-18,@StartTime)  and DATEADD(hour,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-19,@StartTime)  and DATEADD(hour,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-20,@StartTime)  and DATEADD(hour,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-21,@StartTime)  and DATEADD(hour,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-22,@StartTime)  and DATEADD(hour,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-23,@StartTime)  and DATEADD(hour,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(hour,-24,@StartTime)  and DATEADD(hour,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24'
from 
	Things t
where 
	t.ID = @ThingID

	)



end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_ThingEnd_IOs_Minutes]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[Rpt_ThingEnd_IOs_Minutes] 
 @ThingID bigint,
 @TypeID bigint
 as
 begin
 SET NOCOUNT ON

	declare @EPTimeZone int 
	select @EPTimeZone =  4
 declare @StartTime datetime
 set @StartTime = dateadd(HOUR,@EPTimeZone,GETUTCDATE() )

 select ID,Title,'Min' as 'Fx',

	(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-1,@StartTime)  and DATEADD(minute,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-2,@StartTime)  and DATEADD(minute,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-3,@StartTime)  and DATEADD(minute,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-4,@StartTime)  and DATEADD(minute,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-5,@StartTime)  and DATEADD(minute,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-6,@StartTime)  and DATEADD(minute,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-7,@StartTime)  and DATEADD(minute,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-8,@StartTime)  and DATEADD(minute,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-9,@StartTime)  and DATEADD(minute,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-10,@StartTime)  and DATEADD(minute,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-11,@StartTime)  and DATEADD(minute,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-12,@StartTime)  and DATEADD(minute,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-13,@StartTime)  and DATEADD(minute,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-14,@StartTime)  and DATEADD(minute,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-15,@StartTime)  and DATEADD(minute,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-16,@StartTime)  and DATEADD(minute,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-17,@StartTime)  and DATEADD(minute,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-18,@StartTime)  and DATEADD(minute,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-19,@StartTime)  and DATEADD(minute,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-20,@StartTime)  and DATEADD(minute,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-21,@StartTime)  and DATEADD(minute,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-22,@StartTime)  and DATEADD(minute,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-23,@StartTime)  and DATEADD(minute,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-24,@StartTime)  and DATEADD(minute,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24',

	(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-25,@StartTime)  and DATEADD(minute,-24,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '25',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-26,@StartTime)  and DATEADD(minute,-25,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '26',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-27,@StartTime)  and DATEADD(minute,-26,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '27',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-28,@StartTime)  and DATEADD(minute,-27,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '28',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-29,@StartTime)  and DATEADD(minute,-28,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '29',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-30,@StartTime)  and DATEADD(minute,-29,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '30',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-31,@StartTime)  and DATEADD(minute,-30,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '31',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-32,@StartTime)  and DATEADD(minute,-31,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '32',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-33,@StartTime)  and DATEADD(minute,-32,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '33',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-34,@StartTime)  and DATEADD(minute,-33,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '34',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-35,@StartTime)  and DATEADD(minute,-34,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '35',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-36,@StartTime)  and DATEADD(minute,-35,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '36',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-37,@StartTime)  and DATEADD(minute,-36,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '37',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-38,@StartTime)  and DATEADD(minute,-37,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '38',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-39,@StartTime)  and DATEADD(minute,-38,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '39',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-40,@StartTime)  and DATEADD(minute,-39,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '40',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-41,@StartTime)  and DATEADD(minute,-40,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '41',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-42,@StartTime)  and DATEADD(minute,-41,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '42',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-43,@StartTime)  and DATEADD(minute,-42,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '43',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-44,@StartTime)  and DATEADD(minute,-43,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '44',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-45,@StartTime)  and DATEADD(minute,-44,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '45',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-46,@StartTime)  and DATEADD(minute,-45,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '46',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-47,@StartTime)  and DATEADD(minute,-46,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '47',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-48,@StartTime)  and DATEADD(minute,-47,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '48',

	(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-49,@StartTime)  and DATEADD(minute,-48,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '49',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-50,@StartTime)  and DATEADD(minute,-49,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '50',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-51,@StartTime)  and DATEADD(minute,-50,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '51',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-52,@StartTime)  and DATEADD(minute,-51,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '52',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-53,@StartTime)  and DATEADD(minute,-52,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '53',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-54,@StartTime)  and DATEADD(minute,-53,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '54',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-55,@StartTime)  and DATEADD(minute,-54,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '55',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-56,@StartTime)  and DATEADD(minute,-55,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '56',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-57,@StartTime)  and DATEADD(minute,-56,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '57',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-58,@StartTime)  and DATEADD(minute,-57,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '58',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-59,@StartTime)  and DATEADD(minute,-58,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '59',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-60,@StartTime)  and DATEADD(minute,-59,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '60'
	
from 
	Things t
where 
	t.ID = @ThingID

	union all (

	 select ID,Title,'Max' as 'Fx',

	(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-1,@StartTime)  and DATEADD(minute,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-2,@StartTime)  and DATEADD(minute,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-3,@StartTime)  and DATEADD(minute,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-4,@StartTime)  and DATEADD(minute,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-5,@StartTime)  and DATEADD(minute,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-6,@StartTime)  and DATEADD(minute,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-7,@StartTime)  and DATEADD(minute,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-8,@StartTime)  and DATEADD(minute,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-9,@StartTime)  and DATEADD(minute,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-10,@StartTime)  and DATEADD(minute,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-11,@StartTime)  and DATEADD(minute,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-12,@StartTime)  and DATEADD(minute,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-13,@StartTime)  and DATEADD(minute,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-14,@StartTime)  and DATEADD(minute,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-15,@StartTime)  and DATEADD(minute,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-16,@StartTime)  and DATEADD(minute,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-17,@StartTime)  and DATEADD(minute,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-18,@StartTime)  and DATEADD(minute,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-19,@StartTime)  and DATEADD(minute,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-20,@StartTime)  and DATEADD(minute,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-21,@StartTime)  and DATEADD(minute,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-22,@StartTime)  and DATEADD(minute,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-23,@StartTime)  and DATEADD(minute,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-24,@StartTime)  and DATEADD(minute,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24',

	(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-25,@StartTime)  and DATEADD(minute,-24,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '25',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-26,@StartTime)  and DATEADD(minute,-25,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '26',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-27,@StartTime)  and DATEADD(minute,-26,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '27',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-28,@StartTime)  and DATEADD(minute,-27,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '28',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-29,@StartTime)  and DATEADD(minute,-28,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '29',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-30,@StartTime)  and DATEADD(minute,-29,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '30',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-31,@StartTime)  and DATEADD(minute,-30,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '31',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-32,@StartTime)  and DATEADD(minute,-31,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '32',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-33,@StartTime)  and DATEADD(minute,-32,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '33',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-34,@StartTime)  and DATEADD(minute,-33,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '34',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-35,@StartTime)  and DATEADD(minute,-34,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '35',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-36,@StartTime)  and DATEADD(minute,-35,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '36',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-37,@StartTime)  and DATEADD(minute,-36,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '37',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-38,@StartTime)  and DATEADD(minute,-37,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '38',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-39,@StartTime)  and DATEADD(minute,-38,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '39',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-40,@StartTime)  and DATEADD(minute,-39,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '40',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-41,@StartTime)  and DATEADD(minute,-40,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '41',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-42,@StartTime)  and DATEADD(minute,-41,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '42',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-43,@StartTime)  and DATEADD(minute,-42,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '43',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-44,@StartTime)  and DATEADD(minute,-43,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '44',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-45,@StartTime)  and DATEADD(minute,-44,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '45',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-46,@StartTime)  and DATEADD(minute,-45,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '46',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-47,@StartTime)  and DATEADD(minute,-46,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '47',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-48,@StartTime)  and DATEADD(minute,-47,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '48',

	(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-49,@StartTime)  and DATEADD(minute,-48,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '49',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-50,@StartTime)  and DATEADD(minute,-49,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '50',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-51,@StartTime)  and DATEADD(minute,-50,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '51',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-52,@StartTime)  and DATEADD(minute,-51,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '52',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-53,@StartTime)  and DATEADD(minute,-52,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '53',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-54,@StartTime)  and DATEADD(minute,-53,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '54',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-55,@StartTime)  and DATEADD(minute,-54,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '55',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-56,@StartTime)  and DATEADD(minute,-55,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '56',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-57,@StartTime)  and DATEADD(minute,-56,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '57',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-58,@StartTime)  and DATEADD(minute,-57,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '58',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-59,@StartTime)  and DATEADD(minute,-58,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '59',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-60,@StartTime)  and DATEADD(minute,-59,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '60'
	
from 
	Things t
where 
	t.ID = @ThingID

	)union all (

	 select ID,Title,'avg' as 'Fx',

	(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-1,@StartTime)  and DATEADD(minute,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-2,@StartTime)  and DATEADD(minute,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-3,@StartTime)  and DATEADD(minute,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-4,@StartTime)  and DATEADD(minute,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-5,@StartTime)  and DATEADD(minute,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-6,@StartTime)  and DATEADD(minute,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-7,@StartTime)  and DATEADD(minute,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-8,@StartTime)  and DATEADD(minute,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-9,@StartTime)  and DATEADD(minute,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-10,@StartTime)  and DATEADD(minute,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-11,@StartTime)  and DATEADD(minute,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-12,@StartTime)  and DATEADD(minute,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-13,@StartTime)  and DATEADD(minute,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-14,@StartTime)  and DATEADD(minute,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-15,@StartTime)  and DATEADD(minute,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-16,@StartTime)  and DATEADD(minute,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-17,@StartTime)  and DATEADD(minute,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-18,@StartTime)  and DATEADD(minute,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-19,@StartTime)  and DATEADD(minute,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-20,@StartTime)  and DATEADD(minute,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-21,@StartTime)  and DATEADD(minute,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-22,@StartTime)  and DATEADD(minute,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-23,@StartTime)  and DATEADD(minute,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-24,@StartTime)  and DATEADD(minute,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24',

	(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-25,@StartTime)  and DATEADD(minute,-24,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '25',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-26,@StartTime)  and DATEADD(minute,-25,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '26',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-27,@StartTime)  and DATEADD(minute,-26,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '27',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-28,@StartTime)  and DATEADD(minute,-27,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '28',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-29,@StartTime)  and DATEADD(minute,-28,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '29',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-30,@StartTime)  and DATEADD(minute,-29,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '30',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-31,@StartTime)  and DATEADD(minute,-30,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '31',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-32,@StartTime)  and DATEADD(minute,-31,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '32',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-33,@StartTime)  and DATEADD(minute,-32,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '33',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-34,@StartTime)  and DATEADD(minute,-33,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '34',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-35,@StartTime)  and DATEADD(minute,-34,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '35',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-36,@StartTime)  and DATEADD(minute,-35,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '36',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-37,@StartTime)  and DATEADD(minute,-36,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '37',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-38,@StartTime)  and DATEADD(minute,-37,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '38',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-39,@StartTime)  and DATEADD(minute,-38,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '39',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-40,@StartTime)  and DATEADD(minute,-39,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '40',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-41,@StartTime)  and DATEADD(minute,-40,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '41',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-42,@StartTime)  and DATEADD(minute,-41,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '42',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-43,@StartTime)  and DATEADD(minute,-42,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '43',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-44,@StartTime)  and DATEADD(minute,-43,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '44',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-45,@StartTime)  and DATEADD(minute,-44,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '45',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-46,@StartTime)  and DATEADD(minute,-45,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '46',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-47,@StartTime)  and DATEADD(minute,-46,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '47',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-48,@StartTime)  and DATEADD(minute,-47,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '48',

	(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-49,@StartTime)  and DATEADD(minute,-48,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '49',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-50,@StartTime)  and DATEADD(minute,-49,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '50',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-51,@StartTime)  and DATEADD(minute,-50,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '51',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-52,@StartTime)  and DATEADD(minute,-51,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '52',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-53,@StartTime)  and DATEADD(minute,-52,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '53',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-54,@StartTime)  and DATEADD(minute,-53,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '54',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-55,@StartTime)  and DATEADD(minute,-54,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '55',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-56,@StartTime)  and DATEADD(minute,-55,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '56',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-57,@StartTime)  and DATEADD(minute,-56,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '57',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-58,@StartTime)  and DATEADD(minute,-57,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '58',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-59,@StartTime)  and DATEADD(minute,-58,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '59',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-60,@StartTime)  and DATEADD(minute,-59,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '60'
	
from 
	Things t
where 
	t.ID = @ThingID

	) union all (

	 select ID,Title,'count' as 'Fx',

	(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-1,@StartTime)  and DATEADD(minute,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-2,@StartTime)  and DATEADD(minute,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-3,@StartTime)  and DATEADD(minute,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-4,@StartTime)  and DATEADD(minute,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-5,@StartTime)  and DATEADD(minute,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-6,@StartTime)  and DATEADD(minute,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-7,@StartTime)  and DATEADD(minute,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-8,@StartTime)  and DATEADD(minute,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-9,@StartTime)  and DATEADD(minute,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-10,@StartTime)  and DATEADD(minute,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-11,@StartTime)  and DATEADD(minute,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-12,@StartTime)  and DATEADD(minute,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-13,@StartTime)  and DATEADD(minute,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-14,@StartTime)  and DATEADD(minute,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-15,@StartTime)  and DATEADD(minute,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-16,@StartTime)  and DATEADD(minute,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-17,@StartTime)  and DATEADD(minute,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-18,@StartTime)  and DATEADD(minute,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-19,@StartTime)  and DATEADD(minute,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-20,@StartTime)  and DATEADD(minute,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-21,@StartTime)  and DATEADD(minute,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-22,@StartTime)  and DATEADD(minute,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-23,@StartTime)  and DATEADD(minute,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-24,@StartTime)  and DATEADD(minute,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24',

	(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-25,@StartTime)  and DATEADD(minute,-24,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '25',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-26,@StartTime)  and DATEADD(minute,-25,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '26',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-27,@StartTime)  and DATEADD(minute,-26,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '27',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-28,@StartTime)  and DATEADD(minute,-27,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '28',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-29,@StartTime)  and DATEADD(minute,-28,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '29',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-30,@StartTime)  and DATEADD(minute,-29,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '30',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-31,@StartTime)  and DATEADD(minute,-30,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '31',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-32,@StartTime)  and DATEADD(minute,-31,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '32',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-33,@StartTime)  and DATEADD(minute,-32,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '33',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-34,@StartTime)  and DATEADD(minute,-33,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '34',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-35,@StartTime)  and DATEADD(minute,-34,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '35',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-36,@StartTime)  and DATEADD(minute,-35,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '36',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-37,@StartTime)  and DATEADD(minute,-36,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '37',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-38,@StartTime)  and DATEADD(minute,-37,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '38',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-39,@StartTime)  and DATEADD(minute,-38,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '39',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-40,@StartTime)  and DATEADD(minute,-39,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '40',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-41,@StartTime)  and DATEADD(minute,-40,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '41',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-42,@StartTime)  and DATEADD(minute,-41,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '42',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-43,@StartTime)  and DATEADD(minute,-42,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '43',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-44,@StartTime)  and DATEADD(minute,-43,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '44',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-45,@StartTime)  and DATEADD(minute,-44,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '45',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-46,@StartTime)  and DATEADD(minute,-45,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '46',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-47,@StartTime)  and DATEADD(minute,-46,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '47',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-48,@StartTime)  and DATEADD(minute,-47,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '48',

	(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-49,@StartTime)  and DATEADD(minute,-48,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '49',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-50,@StartTime)  and DATEADD(minute,-49,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '50',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-51,@StartTime)  and DATEADD(minute,-50,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '51',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-52,@StartTime)  and DATEADD(minute,-51,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '52',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-53,@StartTime)  and DATEADD(minute,-52,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '53',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-54,@StartTime)  and DATEADD(minute,-53,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '54',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-55,@StartTime)  and DATEADD(minute,-54,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '55',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-56,@StartTime)  and DATEADD(minute,-55,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '56',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-57,@StartTime)  and DATEADD(minute,-56,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '57',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-58,@StartTime)  and DATEADD(minute,-57,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '58',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-59,@StartTime)  and DATEADD(minute,-58,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '59',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-60,@StartTime)  and DATEADD(minute,-59,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '60'
	
from 
	Things t
where 
	t.ID = @ThingID

	)



end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_ThingEnd_IOs_Months]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[Rpt_ThingEnd_IOs_Months] 
 @ThingID bigint,
 @TypeID bigint,
 @Year bigint
 as
 begin
 SET NOCOUNT ON

	declare @EPTimeZone int 
	select @EPTimeZone =  4
 declare @StartTime datetime
 set @StartTime = dateadd(HOUR,@EPTimeZone,GETUTCDATE() )

 select ID,Title,'Min' as 'Fx',

	(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 1 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 2 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 3 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 4 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 5 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 6 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 7 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 8 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 9 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 10 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 11 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 12 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12'


from 
	Things t
where 
	t.ID = @ThingID

	union all (

	 select ID,Title,'Max' as 'Fx',

		(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 1 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 2 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 3 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 4 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 5 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 6 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 7 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 8 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 9 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 10 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 11 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 12 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12'


from 
	Things t
where 
	t.ID = @ThingID

	)union all (

	 select ID,Title,'avg' as 'Fx',

		(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 1 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 2 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 3 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 4 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 5 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 6 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 7 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 8 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 9 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 10 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 11 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 12 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12'


from 
	Things t
where 
	t.ID = @ThingID

	)



end
GO
/****** Object:  StoredProcedure [dbo].[SetThingProperty]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[SetThingProperty]
@ThingID bigint,
@ThingExtenstionID bigint
as
begin
	
	declare @IsList bit
	select @IsList = islist from ThingExtenstions where ID = @ThingExtenstionID

	if (@IsList = 1)
	begin
print 1
	end
	else
	begin
	print 0
	end
end


GO
/****** Object:  StoredProcedure [dbo].[SubmitEndpointCommand]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SubmitEndpointCommand]
@CommandID bigint
,@Value nvarchar(50)
,@ScheduleTimeStamp datetime = null


as
begin
	declare @EndPointID bigint
	declare @UTC_Diff int
	declare @ThingID bigint
	declare @ScheduleTimeStamp_UTC datetime
	declare @endpointtypeid bigint


	select 
		@EndPointID = e.ID
		,@UTC_Diff = d.UTC_Diff   
		,@ThingID = e.ThingID
	from [Endpoints] e,[Devices] d, [EndPointCommands] c
	where e.DeviceID = d.ID
		and c.EndPointID = e.ID
		and c.ID = @CommandID 

		select @endpointtypeid = TypeID from [Endpoints] where id = @EndPointID

	if (@ScheduleTimeStamp is null)
		begin
		set @ScheduleTimeStamp_UTC = GetUTCDate()
		set @ScheduleTimeStamp = DATEADD(HOUR, @UTC_Diff,GETUTCDATE())
		end
	else
		begin
		set @ScheduleTimeStamp_UTC = DATEADD(HOUR,- @UTC_Diff,@ScheduleTimeStamp)

		end

	insert into EndPointIOs (EndPointID,IOTypeID,Valu,ThingID
	,[TimeStamp]
	,[TimeStamp_UTC]
	,ScheduleTimeStamp
	,ScheduleTimeStamp_UTC
	,endpointtypeid
	)
	(select @EndPointID as'EndPointID',2 as 'IOTypeID',@Value as 'Valu',@ThingID as 'ThingID'
	,DATEADD(HOUR,@UTC_Diff,GETUTCDATE()) as 'TimeStamp'
	,GETUTCDATE() as 'TimeStampUTC'
	,@ScheduleTimeStamp  as '@ScheduleTimeStamp'
	,@ScheduleTimeStamp_UTC
	,@endpointtypeid
	)
end

GO
/****** Object:  StoredProcedure [dbo].[SubmitEndpointCommandExecuted]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SubmitEndpointCommandExecuted]
@CommandID bigint
,@EndPointKeyPass uniqueidentifier
,@ExecTimeStamp datetime = null


as
begin
	declare @EndPointID bigint
	declare @EndPointKeyPass2 uniqueidentifier
	declare @UTC_Diff int
	declare @ExecTimeStamp_UTC datetime



	select 
		@EndPointID = e.ID
		,@EndPointKeyPass2 = e.KeyPass
		,@UTC_Diff = d.UTC_Diff   
	from [Endpoints] e,[Devices] d, [EndPointIOs] ios
	where e.DeviceID = d.ID
		and ios.EndPointID = e.ID
		and ios.ID = @CommandID 

		if (@EndPointKeyPass != @EndPointKeyPass2)
		begin
			raiserror('Wrong keypass',16,1)
		end

	if (@ExecTimeStamp is null)
	begin
		set @ExecTimeStamp_UTC = GetUTCDate()
		set @ExecTimeStamp = DATEADD(HOUR, @UTC_Diff,GETUTCDATE())

	end
	else
	begin
		set @ExecTimeStamp_UTC = DATEADD(HOUR,- @UTC_Diff,@ExecTimeStamp)
	end


		update EndPointIOs set ExecTimeStamp = @ExecTimeStamp , ExecTimeStamp_UTC = @ExecTimeStamp_UTC where id = @CommandID


end



GO
/****** Object:  StoredProcedure [dbo].[SubmitEndPointInput]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SubmitEndPointInput]
@PassKey uniqueIdentifier
,@Value nvarchar(50)
,@ExecTimeStamp datetime


as
begin
	declare @EndPointID BIGINT
    declare @EndPointTypeID bigint
	declare @UTC_Diff int
	declare @ThingID bigint
	declare @ExecTimeStamp_UTC datetime



	select 
		@EndPointID = e.ID
		,@UTC_Diff = d.UTC_Diff   
		,@ThingID = e.ThingID
		,@EndPointTypeID = e.TypeID
	from [Endpoints] e,[Devices] d
	where e.DeviceID = d.ID
		and e.[KeyPass] = @PassKey 


	if (@ExecTimeStamp is null)
		begin
		set @ExecTimeStamp_UTC = GetUTCDate()
		set @ExecTimeStamp = DATEADD(HOUR, @UTC_Diff,GETUTCDATE())
		end
	else
		begin
		set @ExecTimeStamp_UTC = DATEADD(HOUR,- @UTC_Diff,@ExecTimeStamp)

		end

	insert into EndPointIOs (EndPointID,IOTypeID,EndPointTypeID,Valu,ThingID
	,[TimeStamp]
	,[TimeStamp_UTC]
	,ExecTimeStamp
	,ExecTimeStamp_UTC
	
	)
	(select @EndPointID as'EndPointID',1 as 'IOTypeID',@EndPointTypeID,@Value as 'Valu',@ThingID as 'ThingID'
	,DATEADD(HOUR,@UTC_Diff,GETUTCDATE()) as 'TimeStamp'
	,GETUTCDATE() as 'TimeStampUTC'
	,@ExecTimeStamp  as 'ExecTimeStamp'
	,@ExecTimeStamp_UTC
	)
end
GO
/****** Object:  StoredProcedure [dbo].[SubmitEndPointLog]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SubmitEndPointLog]
@PassKey uniqueIdentifier
,@Value nvarchar(50)
,@ExecTimeStamp datetime


as
begin
	declare @EndPointID BIGINT
    declare @EndPointTypeID bigint
	declare @UTC_Diff int
	declare @ThingID bigint
	declare @ExecTimeStamp_UTC datetime



	select 
		@EndPointID = e.ID
		,@UTC_Diff = d.UTC_Diff   
		,@ThingID = e.ThingID
		,@EndPointTypeID = e.TypeID
	from [Endpoints] e,[Devices] d
	where e.DeviceID = d.ID
		and e.[KeyPass] = @PassKey 


	if (@ExecTimeStamp is null)
		begin
		set @ExecTimeStamp_UTC = GetUTCDate()
		set @ExecTimeStamp = DATEADD(HOUR, @UTC_Diff,GETUTCDATE())
		end
	else
		begin
		set @ExecTimeStamp_UTC = DATEADD(HOUR,- @UTC_Diff,@ExecTimeStamp)

		end

	insert into EndPointIOs (EndPointID,IOTypeID,EndPointTypeID,Valu,ThingID
	,[TimeStamp]
	,[TimeStamp_UTC]
	,ExecTimeStamp
	,ExecTimeStamp_UTC
	
	)
	(select @EndPointID as'EndPointID',3 as 'IOTypeID',@EndPointTypeID,@Value as 'Valu',@ThingID as 'ThingID'
	,DATEADD(HOUR,@UTC_Diff,GETUTCDATE()) as 'TimeStamp'
	,GETUTCDATE() as 'TimeStampUTC'
	,@ExecTimeStamp  as 'ExecTimeStamp'
	,@ExecTimeStamp_UTC
	)
end
GO
/****** Object:  StoredProcedure [dbo].[ThingPropertyValueAdd]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ThingPropertyValueAdd]
@ThingID bigint,
@ThingExtenstionID bigint,
@Value NVarchar(128)
as
begin
	declare @IsList bit
	select @IsList = islist from ThingExtenstions where ID = @ThingExtenstionID
	if (@IsList = 1)
	begin
		insert into ThingExtenstionValues (ThingExtenstionID,ThingID,Valu) values (@ThingExtenstionID,@ThingID,@Value)
		print N'Property value has been added'
	end
	else
	begin
		delete from ThingExtenstionValues where ThingExtenstionID = @ThingExtenstionID and ThingID = @ThingID
		insert into ThingExtenstionValues (ThingExtenstionID,ThingID,Valu) values (@ThingExtenstionID,@ThingID,@Value)
	print N'Property value has been updated'
	end
end


GO
/****** Object:  StoredProcedure [dbo].[ThingPropertyValueDelete]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ThingPropertyValueDelete]
@ValueID bigint
as
begin
	
		delete from ThingExtenstionValues where ID = @ValueID
	
end

GO
/****** Object:  StoredProcedure [dbo].[ThingPropertyValueDeleteAll]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ThingPropertyValueDeleteAll]
@ThingID bigint
as
begin

	delete from ThingExtenstionValues where ThingID = @ThingID 


end
GO
/****** Object:  StoredProcedure [dbo].[ThingPropertyValueEdit]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ThingPropertyValueEdit]
@ValueID bigint,
@NewValue NVarchar(128)
as
begin
	
	declare @ThingExtenstionID bigint
	declare @ThingID nvarchar(128)

	select @ThingID =  ThingID from ThingExtenstionValues where id = @ValueID
	select @ThingExtenstionID =  ThingExtenstionID from ThingExtenstionValues where id = @ValueID

	delete from ThingExtenstionValues where ID = @ValueID
	insert into ThingExtenstionValues (ThingExtenstionID,ThingID,Valu) values (@ThingExtenstionID,@ThingID,@NewValue)
	
end
GO
/****** Object:  StoredProcedure [dbo].[UnPublishApp]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[UnPublishApp]
@AppID bigint
as
begin
	select 'Ok'
end
GO
/****** Object:  Trigger [dbo].[TR_FirstUser]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[TR_FirstUser] on [dbo].[AspNetUsers]  for insert
as
begin
declare @UserID nvarchar(128)
select @UserID =  Id from inserted

if not Exists(select * from aspnetusers u, AspNetUserRoles r where u.Id = r.UserId and r.RoleId = 1 )
insert into AspNetUserRoles (UserID,RoleId) values (@UserID,1)

end
GO
ALTER TABLE [dbo].[AspNetUsers] ENABLE TRIGGER [TR_FirstUser]
GO
/****** Object:  Trigger [dbo].[TR_NewUser]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[TR_NewUser] on [dbo].[AspNetUsers]
for insert
as 
begin
declare @UserName nvarchar(256)
select @UserName =  UserName from inserted
update AspNetUsers set FullName = @UserName where UserName = @UserName

end
GO
ALTER TABLE [dbo].[AspNetUsers] ENABLE TRIGGER [TR_NewUser]
GO
/****** Object:  Trigger [dbo].[TR_DeviceConnection]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[TR_DeviceConnection] on [dbo].[EndPointIOs] for insert
as
begin
declare @dID bigint
declare @UTC_Diff int 

select  @dID= e.DeviceID
	from 
		[endpoints] e,EndPointIOs io
	where 
		io.EndPointID = e.ID
		and io.ID = (select id from INSERTED)

select @UTC_Diff = UTC_Diff 
	from Devices d
	where d.ID = @dID
	

update devices set LastConnectionTimeStamp = DATEADD(HOUR,@UTC_Diff,GETUTCDATE()) where id = @dID
update [Endpoints] set lastIOID = i.id, LastIOValue = i.Valu , LastIOTimeStamp = i.[TimeStamp] , [LastIOTimeStampUTC] = i.TimeStamp_UTC  from inserted i where [Endpoints].ID= i.EndPointID and IOTypeID = 1

end

GO
ALTER TABLE [dbo].[EndPointIOs] ENABLE TRIGGER [TR_DeviceConnection]
GO
/****** Object:  Trigger [dbo].[TR_IO_Alert]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[TR_IO_Alert] on [dbo].[EndPointIOs] for insert
as
begin
	-- Declare Variables :::: Start
	declare @IOID bigint
	declare @EndPointID bigint
	declare @IOTypeID bigint
	declare @EndpointTypeID bigint
	declare @EndpointType nvarchar(50)
	declare @Measurement nvarchar(50)
	declare @Value nvarchar(50)
	declare @ExecTimeStamp datetime
	declare @ThingID bigint
	declare @ThingTitle nvarchar(128)
	-- Declare Variables :::: End

	-- Set Variables Values :::: Start
	select @IOID  = ID from inserted;
	select @EndPointID = EndPointID from inserted;
	select @IOTypeID = IOTypeID from inserted;
	select @EndpointTypeID = TypeID from [Endpoints] where ID = @EndPointID;
	select @EndpointType = et.Title from [Endpoints] e, EndPointTypes et  where e.TypeID = et.ID and e.ID = @EndPointID;
	select @Measurement = et.Measurement from [Endpoints] e, EndPointTypes et  where e.TypeID = et.ID and e.ID = @EndPointID;
	select @Value = Valu from inserted;
	select @ExecTimeStamp = ExecTimeStamp from inserted;
	select @ThingID = ThingID from inserted;
	select @ThingTitle = title from Things where id = @ThingID;
	-- Set Variables Values :::: End
	

	WITH TConditions AS 
	(
		select 
		ac.ID as 'ConditionID'
		,ac.AlertID as 'AlertID'
		,ac.ThingID as 'ThingID'
		,ac.IOTypeID as 'IOTypeID'
		,ac.EndPointTypeID as 'EndpointTypeID'
		,ac.ConditionTypeID
		,ac.ConditionValue
		,ac.IsMust
		,(select count (*) from AlertConditions sub where sub.AlertID = a.id and sub.IsMust = 1) as 'ConIsMustCount'
		,(select count (*) from AlertConditions sub where sub.AlertID = a.id and sub.IsMust = 0) as 'ConOptMustCount'
		,vte.LastValue as 'LastValue'
		
		from 
			alerts a
			,AlertConditions ac
			,AlertConditionTypes act
			,Things t
			,VThingEndsValues vte

		where
			--Tables Rel
			ac.AlertID = a.ID
			and ac.ConditionTypeID = act.ID
			and ac.thingid = t.id

			and vte.ThingID = t.ID
			and vte.IOTypeID = ac.IOTypeID
			and vte.EndpointTypeID = ac.EndPointTypeID

			--Params
			and a.IsActive = 1
			and a.StartTime <=  CONVERT(time(0),@ExecTimeStamp)
			and a.EndTime >= CONVERT(time(0),@ExecTimeStamp)
		
			--Validate Latest value are not the same as the previews one
			and vte.LastValue <> vte.PreviewsValue

			--Validate Conditions
			and (
				(ac.ConditionTypeID = 1 and ac.ConditionValue = LastValue)
				or (ac.ConditionTypeID = 2 and ac.ConditionValue != LastValue)
				or (ac.ConditionTypeID = 3 and LastValue > ac.ConditionValue)
				or (ac.ConditionTypeID = 4 and LastValue < ac.ConditionValue)			
			)

			

	), TAlerts AS(

	
	select 
		a.ID
		,replace(
			replace(
				replace(
					replace(
						replace(a.[Message]
						,N'[TimeStamp]',@ExecTimeStamp )
						,N'[Value]',@Value	)
						,N'[EndpointType]',@EndpointType)
						,N'[Measurement]',@Measurement)
						,N'[Thing]',@ThingTitle
			 
			 ) as 'AlertMessage'
		--,(select count(*) from AlertConditions ac where  ac.AlertID = a.ID )as 'ConditionIsMust' 
		--,(select count(*) from TConditions tc where  tc.alertID = a.ID )as 'ConditionIsMustTrue' 
		
	from
		alerts a
		
		where
			((select count(*) from AlertConditions ac where  ac.AlertID = a.ID and ac.IsMust = 1 )=
			(select count(*) from TConditions tc where  tc.alertID = a.ID and tc.IsMust = 1))
			AND EXISTS (SELECT *  FROM dbo.AlertConditions sub WHERE sub.AlertID = a.ID AND sub.ThingID = @ThingID AND sub.EndPointTypeID = @EndpointTypeID)

	)

	insert into UserNotifications
	(
		UserID
		,IsRead
		,NotificationTypeID
		,RefID
		,Txt
		,AlertTimeStamp
		,IsEmailSent
	)
	select 
		u.Id
		,0
		,1
		,@IOID
		,ta.AlertMEssage
		,GetDate()
		,0
	from 
		TAlerts ta
		,AspNetUsers u
		,LinkUsersAlerts l

	where 
		ta.ID = l.AlertID
		and u.Id = l.UserID





end

GO
ALTER TABLE [dbo].[EndPointIOs] ENABLE TRIGGER [TR_IO_Alert]
GO
/****** Object:  Trigger [dbo].[TR_LastIOValueNumeric]    Script Date: 2017-09-22 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE trigger [dbo].[TR_LastIOValueNumeric]
on [dbo].[Endpoints] for update
as
begin
	declare @ID bigint
	declare @LastIOValue real

	select @ID = id from inserted
	select @LastIOValue = LastIOValue from inserted

	update Endpoints set LastIONumericValue = @LastIOValue where ID = @ID and IsNumericOnly = 1

end


GO
ALTER TABLE [dbo].[Endpoints] ENABLE TRIGGER [TR_LastIOValueNumeric]
GO
/****** Object:  Trigger [dbo].[TR_UpdateThing_Insert]    Script Date: 2017-09-22 12:35:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[TR_UpdateThing_Insert] on [dbo].[Endpoints] for insert
as
begin
	declare @endID bigint
	declare @InsertedThingID bigint
	declare @RemovedThingID bigint
	declare @LastIOID bigint
	declare @LastIOValue nvarchar(50)
	declare @LastIOTimeStamp datetime
	declare @LastIOTimeStampUTC datetime
	declare @EndpointTypeID bigint

	select @endID = ID  from inserted
	select @InsertedThingID = thingid from inserted
	select @LastIOID = lastIOID from inserted
	select @LastIOValue = LastIOValue from inserted
	select @LastIOTimeStamp = LastIOTimeStamp from inserted
	select @LastIOTimeStampUTC = LastIOTimeStampUTC from inserted
	select @EndpointTypeID = TypeID from inserted

	
		exec AttachEndPointTypeToThing @EndPointTypeID = @EndpointTypeID  ,@thingID = @InsertedThingID
	
end

GO
ALTER TABLE [dbo].[Endpoints] ENABLE TRIGGER [TR_UpdateThing_Insert]
GO
/****** Object:  Trigger [dbo].[TR_UpdateThing_Update]    Script Date: 2017-09-22 12:35:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[TR_UpdateThing_Update] on [dbo].[Endpoints] for update
as
begin
	declare @endID bigint
	declare @InsertedThingID bigint
	declare @RemovedThingID bigint
	declare @LastIOID bigint
	declare @LastIOValue nvarchar(50)
	declare @LastIOTimeStamp datetime
	declare @LastIOTimeStampUTC datetime
	declare @EndpointTypeID bigint

	select @endID = ID  from inserted
	select @InsertedThingID = thingid from inserted
	select @RemovedThingID = thingid from deleted
	select @LastIOID = lastIOID from inserted
	select @LastIOValue = LastIOValue from inserted
	select @LastIOTimeStamp = LastIOTimeStamp from inserted
	select @LastIOTimeStampUTC = LastIOTimeStampUTC from inserted
	select @EndpointTypeID = TypeID from inserted

	if UPDATE(ThingID)
	begin

		exec AttachEndPointTypeToThing @EndPointTypeID = @EndpointTypeID  ,@thingID = @InsertedThingID

	end
	if UPDATE(lastIOTimeStamp)
	begin

		update ThingEnds set LastIOID = @LastIOID, LastIOValue = @LastIOValue , LastIOTimeStamp = @LastIOTimeStamp ,LastIOTimeStampUTC = @LastIOTimeStampUTC   where ThingID =@InsertedThingID and EndPointTypeID = @EndpointTypeID

	end
end

GO
ALTER TABLE [dbo].[Endpoints] ENABLE TRIGGER [TR_UpdateThing_Update]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 304
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ios"
            Begin Extent = 
               Top = 68
               Left = 295
               Bottom = 198
               Right = 537
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 1740
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VThingEnds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VThingEnds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ios"
            Begin Extent = 
               Top = 134
               Left = 266
               Bottom = 264
               Right = 508
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 20
               Left = 24
               Bottom = 150
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 9630
         Alias = 2040
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VThingEndsValues'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VThingEndsValues'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tc"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 431
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 138
               Left = 255
               Bottom = 268
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dt"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 366
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Ali' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VThingExtensionValues'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'as = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VThingExtensionValues'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VThingExtensionValues'
GO
USE [master]
GO
ALTER DATABASE [<DataBase_Name, varChar(50), DynThingsDB>] SET  READ_WRITE 
GO
