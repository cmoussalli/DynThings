--DB Version 0.134
USE [master]
GO
/****** Object:  Database [DynThings]    Script Date: 2/8/2016 12:47:48 PM ******/
CREATE DATABASE [DynThings]
 GO
USE [DynThings]
GO

/****** Object:  Table [dbo].[AlertConditions]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[AlertConditionTypes]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[AlertLevels]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[Alerts]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/10/2016 2:38:54 PM ******/
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
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeviceCommands]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[DeviceIOs]    Script Date: 10/10/2016 2:38:54 PM ******/
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
 CONSTRAINT [PK_DeviceIOs_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Devices]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[DeviceStatus]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[DynSettings]    Script Date: 10/10/2016 2:38:54 PM ******/
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
 CONSTRAINT [PK_DynSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EndPointCommands]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[EndPointIOs]    Script Date: 10/10/2016 2:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EndPointIOs](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EndPointID] [bigint] NOT NULL,
	[IOTypeID] [bigint] NOT NULL,
	[Valu] [nvarchar](50) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[ExecTimeStamp] [datetime] NULL,
	[ScheduleTimeStamp] [datetime] NULL,
	[ThingID] [bigint] NOT NULL,
 CONSTRAINT [PK_DeviceIOs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Endpoints]    Script Date: 10/10/2016 2:38:54 PM ******/
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
	[IsNumericOnly] [bit] NULL,
	[MinValue] [real] NULL,
	[MaxValue] [real] NULL,
	[LowRange] [real] NULL,
	[HighRange] [real] NULL,
 CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EndPointTypeCategorys]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[EndPointTypes]    Script Date: 10/10/2016 2:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EndPointTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[IOTypes]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[LinkDevicesLocations]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[LinkLocationsLocationViews]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[LinkThingsLocations]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[LinkUsersAlerts]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[Locations]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[LocationViews]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[LocationViewTypes]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[MediaFiles]    Script Date: 10/10/2016 2:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaFiles](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_MediaFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResultMessages]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Table [dbo].[ThingCategorys]    Script Date: 10/10/2016 2:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThingCategorys](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[IconID] [bigint] NULL,
 CONSTRAINT [PK_ThingTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Things]    Script Date: 10/10/2016 2:38:54 PM ******/
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
 CONSTRAINT [PK_Things] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserNotifications]    Script Date: 10/10/2016 2:38:54 PM ******/
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
 CONSTRAINT [PK_UserNotifications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserNotificationTypes]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  View [dbo].[VThingEnds]    Script Date: 10/10/2016 2:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[VThingEnds]
as
(
	select 
		e.ThingID as 'ThingID'
		,ios.IOTypeID as 'IOTypeID'
		,e.TypeID as 'EndpointTypeID'
		,(select top(1) valu  from EndPointIOs subIos ,[Endpoints] subEnds
			where 
				subEnds.ID = subIos.EndPointID
				and subIos.ThingID = e.ThingID
				and subIos.IOTypeID = ios.iotypeid
				and subends.TypeID = e.typeid
			order by subIos.ID desc
		) as 'LastValue' 
				
	from 
		[Endpoints] e
		,EndPointIOs ios

	where e.ID = ios.EndPointID

	group by 
		e.ThingID 
		,ios.IOTypeID 		
		,e.TypeID
)


GO
SET IDENTITY_INSERT [dbo].[AlertConditions] ON 

GO
INSERT [dbo].[AlertConditions] ([ID], [AlertID], [ThingID], [IOTypeID], [EndPointTypeID], [ConditionTypeID], [ConditionValue], [IsMust]) VALUES (22, 1, 1, 1, 2, 3, N'30', 1)
GO
INSERT [dbo].[AlertConditions] ([ID], [AlertID], [ThingID], [IOTypeID], [EndPointTypeID], [ConditionTypeID], [ConditionValue], [IsMust]) VALUES (23, 1, 1, 1, 1, 3, N'30', 1)
GO
SET IDENTITY_INSERT [dbo].[AlertConditions] OFF
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
SET IDENTITY_INSERT [dbo].[Alerts] ON 

GO
INSERT [dbo].[Alerts] ([ID], [Title], [Message], [IsActive], [Sunday], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday], [StartTime], [EndTime]) VALUES (1, N'Alert 1', N'Alert from [Thing], reported [EndpointType]: [Value] [Measurement] @[TimeStamp]', 1, 1, 1, 1, 1, 1, 1, 1, CAST(N'00:00:00' AS Time), CAST(N'23:59:59' AS Time))
GO
INSERT [dbo].[Alerts] ([ID], [Title], [Message], [IsActive], [Sunday], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday], [StartTime], [EndTime]) VALUES (2, N'Alert 2', N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'00:00:00' AS Time), CAST(N'23:59:59' AS Time))
GO
INSERT [dbo].[Alerts] ([ID], [Title], [Message], [IsActive], [Sunday], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday], [StartTime], [EndTime]) VALUES (3, N'Alert 3', N'', 1, 1, 1, 1, 0, 0, 0, 0, CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[Alerts] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Monitor & Control')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'Monitor Only')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'367df69f-c059-4295-95b0-718c93dfa843', N'1')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8393618a-ea66-442c-9eff-f48c53f982a4', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ee7fe3bd-f26b-4ee2-9cba-e9a630fbc904', N'2')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FullName]) VALUES (N'367df69f-c059-4295-95b0-718c93dfa843', N'cmoussalli@gmail.com', 0, N'ALwtfGaSrttw1t7mVutBUXjw1u/7CgWgBeIxkRWlPVMmuBZb517J4JNc1UsFplmZ0g==', N'6304491a-a9ec-493b-9fbe-8a827c93a492', NULL, 0, 0, NULL, 1, 0, N'cmoussalli@gmail.com', N'Caesar Moussalli')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FullName]) VALUES (N'8393618a-ea66-442c-9eff-f48c53f982a4', N'cesar_moussalli@hotmail.com', 0, N'ACXpg5EJ6G3kpffDpIJbFD1wb9125WnI0JTrAH3rASEoosbB1qSgWxSiWQDxe7/CmA==', N'3402829b-5d04-4c93-a64e-83b942c81e9f', NULL, 0, 0, NULL, 1, 0, N'cesar_moussalli@hotmail.com', N'Caesar')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FullName]) VALUES (N'ee7fe3bd-f26b-4ee2-9cba-e9a630fbc904', N'demo@demo.com', 0, N'AGwmkRCvfRoX8FkXZGNI2DYXHveAB/pQXJupqNV5ByB+jvTY7fEYyp+LCh5NYvTirA==', N'8d9ef8e4-fd90-423b-b2e6-bc2e6b0eb5e2', NULL, 0, 0, NULL, 1, 0, N'demo@demo.com', N'demo@demo.com')
GO
SET IDENTITY_INSERT [dbo].[DeviceCommands] ON 

GO
INSERT [dbo].[DeviceCommands] ([ID], [Title], [Description], [DeviceID], [CommandCode], [OwnerID]) VALUES (36, N'Reset Pump 1', N'Reset the Lower Pump', 9, N'rst', N'1')
GO
SET IDENTITY_INSERT [dbo].[DeviceCommands] OFF
GO
SET IDENTITY_INSERT [dbo].[Devices] ON 

GO
INSERT [dbo].[Devices] ([ID], [GUID], [KeyPass], [PinCode], [Title], [StatusID], [UTC_Diff], [IsConnectedDelay], [IsConnected], [LastConnectionTimeStamp]) VALUES (9, N'b3f18d2c-135a-43c9-9d58-e3bf543a1a10', N'87fb81a8-d600-4cc9-9302-ec3d45e350e7', N'0000', N'Arduino 1', 1, 4, 20, 1, CAST(N'2016-10-10 14:32:48.600' AS DateTime))
GO
INSERT [dbo].[Devices] ([ID], [GUID], [KeyPass], [PinCode], [Title], [StatusID], [UTC_Diff], [IsConnectedDelay], [IsConnected], [LastConnectionTimeStamp]) VALUES (11, N'0ed4e4a3-9d5f-42f7-92c9-eb8d4bf34b21', N'7791e501-b6da-40a9-a6f5-a385bc299baa', N'0000', N'Test Room 1', 1, 4, 60, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Devices] OFF
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
INSERT [dbo].[DynSettings] ([ID], [DBVersion], [DevelopmentMode], [DefaultRecordsPerMaster], [DefaultRecordsPerChild], [PlatformKey], [PublicAccess], [PublicSignUP], [EnableSystemLogger], [App_TimeZone], [PlatformTitle]) VALUES (1, 0.134, 1, 5, 5, N'a86bb826-988d-4f9a-9f43-169045506194', 0, 1, 1, 4, N'My IoT Platform')
GO
SET IDENTITY_INSERT [dbo].[DynSettings] OFF
GO
SET IDENTITY_INSERT [dbo].[EndPointCommands] ON 

GO
INSERT [dbo].[EndPointCommands] ([ID], [Title], [Description], [EndPointID], [CommandCode], [OwnerID]) VALUES (15, N'Reset', N'Reset the Endpoint', 46, N'rst', N'1')
GO
SET IDENTITY_INSERT [dbo].[EndPointCommands] OFF
GO
SET IDENTITY_INSERT [dbo].[EndPointIOs] ON 

GO
INSERT [dbo].[EndPointIOs] ([ID], [EndPointID], [IOTypeID], [Valu], [TimeStamp], [ExecTimeStamp], [ScheduleTimeStamp], [ThingID]) VALUES (1, 46, 1, N'25', CAST(N'2016-10-10 14:31:53.000' AS DateTime), CAST(N'2016-10-10 14:31:53.000' AS DateTime), CAST(N'2016-10-10 14:31:53.000' AS DateTime), 1)
GO
INSERT [dbo].[EndPointIOs] ([ID], [EndPointID], [IOTypeID], [Valu], [TimeStamp], [ExecTimeStamp], [ScheduleTimeStamp], [ThingID]) VALUES (2, 46, 3, N'Booting', CAST(N'2016-10-10 14:32:06.000' AS DateTime), CAST(N'2016-10-10 14:32:06.000' AS DateTime), CAST(N'2016-10-10 14:32:06.000' AS DateTime), 1)
GO
INSERT [dbo].[EndPointIOs] ([ID], [EndPointID], [IOTypeID], [Valu], [TimeStamp], [ExecTimeStamp], [ScheduleTimeStamp], [ThingID]) VALUES (3, 47, 1, N'27', CAST(N'2016-10-10 14:32:28.000' AS DateTime), CAST(N'2016-10-10 14:32:28.000' AS DateTime), CAST(N'2016-10-10 14:32:28.000' AS DateTime), 2)
GO
INSERT [dbo].[EndPointIOs] ([ID], [EndPointID], [IOTypeID], [Valu], [TimeStamp], [ExecTimeStamp], [ScheduleTimeStamp], [ThingID]) VALUES (4, 48, 1, N'42', CAST(N'2016-10-10 14:32:41.000' AS DateTime), CAST(N'2016-10-10 14:32:41.000' AS DateTime), CAST(N'2016-10-10 14:32:41.000' AS DateTime), 1)
GO
INSERT [dbo].[EndPointIOs] ([ID], [EndPointID], [IOTypeID], [Valu], [TimeStamp], [ExecTimeStamp], [ScheduleTimeStamp], [ThingID]) VALUES (5, 48, 3, N'Booting', CAST(N'2016-10-10 14:32:48.000' AS DateTime), CAST(N'2016-10-10 14:32:48.000' AS DateTime), CAST(N'2016-10-10 14:32:48.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[EndPointIOs] OFF
GO
SET IDENTITY_INSERT [dbo].[Endpoints] ON 

GO
INSERT [dbo].[Endpoints] ([ID], [GUID], [KeyPass], [PinCode], [Title], [DeviceID], [TypeID], [ThingID], [IsNumericOnly], [MinValue], [MaxValue], [LowRange], [HighRange]) VALUES (46, N'f5b4f219-0629-421d-991e-55ff0b8409a2', N'1cfb97d0-5a7d-443f-9d25-ee143d2f6465', N'0000', N'Thing1 Temp', 9, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Endpoints] ([ID], [GUID], [KeyPass], [PinCode], [Title], [DeviceID], [TypeID], [ThingID], [IsNumericOnly], [MinValue], [MaxValue], [LowRange], [HighRange]) VALUES (47, N'3bb4ef21-dcf7-424d-86d9-9de7d1132321', N'ab4bb8b0-44f8-44a8-b41c-d8885a7c9ea6', N'0000', N'Thing2 Temp', 9, 1, 2, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Endpoints] ([ID], [GUID], [KeyPass], [PinCode], [Title], [DeviceID], [TypeID], [ThingID], [IsNumericOnly], [MinValue], [MaxValue], [LowRange], [HighRange]) VALUES (48, N'd5375e38-9bdb-471e-be4b-83f63bd7a9fe', N'2dc5ce71-87c9-4740-a10c-53cc989d2991', N'0000', N'Thing1 Humid', 9, 2, 1, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Endpoints] OFF
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
SET IDENTITY_INSERT [dbo].[EndPointTypes] ON 

GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (1, N'Temperature', N'C', 1, 3)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (2, N'Humidity', N'%', 1, 4)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (3, N'Light', N'', 1, 3)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (4, N'Noise', N'', 1, 1)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (5, N'GPS Location', N'', 1, 1)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (6, N'Gas', N'', 1, 1)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (7, N'PH', N'', 1, 1)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (8, N'Motion', N'', 1, 1)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (9, N'Voltage', N'Volt', 1, 1)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (10, N'AMPs', N'Ampere', 1, 1)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (11, N'Switch', N'', 1, 1)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (12, N'Vibration', N'', 1, 1)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (13, N'Analoge Input', N'', 1, 1)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (14, N'Moisture', N'', 1, 1)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (15, N'Alcohol', N'', 1, 1)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (16, N'Light', N'', 1, 1)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (17, N'Fan', N'', 2, 1)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (18, N'Motor', N'', 2, 1)
GO
INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (19, N'Switch', N'', 2, 1)
GO
SET IDENTITY_INSERT [dbo].[EndPointTypes] OFF
GO
INSERT [dbo].[IOTypes] ([ID], [IO], [Title]) VALUES (1, N'I', N'Input')
GO
INSERT [dbo].[IOTypes] ([ID], [IO], [Title]) VALUES (2, N'C', N'Command')
GO
INSERT [dbo].[IOTypes] ([ID], [IO], [Title]) VALUES (3, N'L', N'Log')
GO
SET IDENTITY_INSERT [dbo].[LinkDevicesLocations] ON 

GO
INSERT [dbo].[LinkDevicesLocations] ([ID], [LocationID], [DeviceID], [StartTimeStamp], [EndTimeStamp], [StartByUser], [EndByUser]) VALUES (36, 1, 9, CAST(N'2016-07-05 02:07:28.770' AS DateTime), CAST(N'2016-07-05 13:22:58.843' AS DateTime), N'367df69f-c059-4295-95b0-718c93dfa843', N'367df69f-c059-4295-95b0-718c93dfa843')
GO
INSERT [dbo].[LinkDevicesLocations] ([ID], [LocationID], [DeviceID], [StartTimeStamp], [EndTimeStamp], [StartByUser], [EndByUser]) VALUES (37, 1, 9, CAST(N'2016-07-05 02:10:12.197' AS DateTime), CAST(N'2016-07-05 02:10:20.383' AS DateTime), N'367df69f-c059-4295-95b0-718c93dfa843', N'367df69f-c059-4295-95b0-718c93dfa843')
GO
INSERT [dbo].[LinkDevicesLocations] ([ID], [LocationID], [DeviceID], [StartTimeStamp], [EndTimeStamp], [StartByUser], [EndByUser]) VALUES (38, 1, 9, CAST(N'2016-07-05 13:32:35.197' AS DateTime), CAST(N'2016-07-05 13:34:18.770' AS DateTime), N'367df69f-c059-4295-95b0-718c93dfa843', N'367df69f-c059-4295-95b0-718c93dfa843')
GO
INSERT [dbo].[LinkDevicesLocations] ([ID], [LocationID], [DeviceID], [StartTimeStamp], [EndTimeStamp], [StartByUser], [EndByUser]) VALUES (40, 1, 9, CAST(N'2016-07-05 13:34:29.450' AS DateTime), CAST(N'2016-07-05 13:34:52.567' AS DateTime), N'367df69f-c059-4295-95b0-718c93dfa843', N'367df69f-c059-4295-95b0-718c93dfa843')
GO
INSERT [dbo].[LinkDevicesLocations] ([ID], [LocationID], [DeviceID], [StartTimeStamp], [EndTimeStamp], [StartByUser], [EndByUser]) VALUES (41, 1, 9, CAST(N'2016-07-05 13:34:24.290' AS DateTime), CAST(N'2016-07-05 13:34:38.497' AS DateTime), N'367df69f-c059-4295-95b0-718c93dfa843', N'367df69f-c059-4295-95b0-718c93dfa843')
GO
INSERT [dbo].[LinkDevicesLocations] ([ID], [LocationID], [DeviceID], [StartTimeStamp], [EndTimeStamp], [StartByUser], [EndByUser]) VALUES (42, 1, 9, CAST(N'2016-07-05 13:34:56.993' AS DateTime), CAST(N'2016-07-05 13:34:59.987' AS DateTime), N'367df69f-c059-4295-95b0-718c93dfa843', N'367df69f-c059-4295-95b0-718c93dfa843')
GO
INSERT [dbo].[LinkDevicesLocations] ([ID], [LocationID], [DeviceID], [StartTimeStamp], [EndTimeStamp], [StartByUser], [EndByUser]) VALUES (43, 1, 9, CAST(N'2016-07-05 17:20:52.990' AS DateTime), CAST(N'2016-07-10 09:46:48.263' AS DateTime), N'367df69f-c059-4295-95b0-718c93dfa843', N'367df69f-c059-4295-95b0-718c93dfa843')
GO
INSERT [dbo].[LinkDevicesLocations] ([ID], [LocationID], [DeviceID], [StartTimeStamp], [EndTimeStamp], [StartByUser], [EndByUser]) VALUES (44, 3, 9, CAST(N'2016-07-10 09:47:31.570' AS DateTime), CAST(N'2100-12-31 00:00:00.000' AS DateTime), N'367df69f-c059-4295-95b0-718c93dfa843', NULL)
GO
INSERT [dbo].[LinkDevicesLocations] ([ID], [LocationID], [DeviceID], [StartTimeStamp], [EndTimeStamp], [StartByUser], [EndByUser]) VALUES (45, 1, 9, CAST(N'2016-09-10 22:35:10.003' AS DateTime), CAST(N'2100-12-31 00:00:00.000' AS DateTime), N'367df69f-c059-4295-95b0-718c93dfa843', NULL)
GO
SET IDENTITY_INSERT [dbo].[LinkDevicesLocations] OFF
GO
SET IDENTITY_INSERT [dbo].[LinkLocationsLocationViews] ON 

GO
INSERT [dbo].[LinkLocationsLocationViews] ([ID], [LocationID], [LocationViewID]) VALUES (59, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[LinkLocationsLocationViews] OFF
GO
SET IDENTITY_INSERT [dbo].[LinkThingsLocations] ON 

GO
INSERT [dbo].[LinkThingsLocations] ([ID], [LocationID], [ThingID], [CreateByUser], [CreateTimeStamp]) VALUES (8, 1, 1, N'367df69f-c059-4295-95b0-718c93dfa843', CAST(N'2016-07-29 18:05:51.330' AS DateTime))
GO
INSERT [dbo].[LinkThingsLocations] ([ID], [LocationID], [ThingID], [CreateByUser], [CreateTimeStamp]) VALUES (10, 1, 2, N'367df69f-c059-4295-95b0-718c93dfa843', CAST(N'2016-09-10 18:34:31.733' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[LinkThingsLocations] OFF
GO
SET IDENTITY_INSERT [dbo].[LinkUsersAlerts] ON 

GO
INSERT [dbo].[LinkUsersAlerts] ([ID], [UserID], [AlertID]) VALUES (2, N'367df69f-c059-4295-95b0-718c93dfa843', 1)
GO
INSERT [dbo].[LinkUsersAlerts] ([ID], [UserID], [AlertID]) VALUES (7, N'ee7fe3bd-f26b-4ee2-9cba-e9a630fbc904', 1)
GO
SET IDENTITY_INSERT [dbo].[LinkUsersAlerts] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

GO
INSERT [dbo].[Locations] ([ID], [GUID], [Title], [LongitudeY], [LatitudeX], [isActive], [Status], [IconID]) VALUES (1, N'f3067e63-eb6b-45dc-9d63-0feb0daa61b3', N'Building 253', N'58.3591538389074', N'23.596558259530582', 1, 1, 1)
GO
INSERT [dbo].[Locations] ([ID], [GUID], [Title], [LongitudeY], [LatitudeX], [isActive], [Status], [IconID]) VALUES (3, N'49790eb8-8409-4562-a5e1-3fb53a8e9e0f', N'Building 262', N'58.360393', N'23.595109', 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[LocationViews] ON 

GO
INSERT [dbo].[LocationViews] ([ID], [Title], [IsActive], [OwnerID], [LocationViewTypeID], [X], [Y], [Z]) VALUES (1, N'Location View 1', 0, N'1', 1, N'23.595679318553778', N'58.36538750446738', N'15')
GO
SET IDENTITY_INSERT [dbo].[LocationViews] OFF
GO
SET IDENTITY_INSERT [dbo].[LocationViewTypes] ON 

GO
INSERT [dbo].[LocationViewTypes] ([ID], [Title]) VALUES (1, N'Single Location')
GO
INSERT [dbo].[LocationViewTypes] ([ID], [Title]) VALUES (2, N'List')
GO
INSERT [dbo].[LocationViewTypes] ([ID], [Title]) VALUES (3, N'Map')
GO
INSERT [dbo].[LocationViewTypes] ([ID], [Title]) VALUES (4, N'Image')
GO
SET IDENTITY_INSERT [dbo].[LocationViewTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[MediaFiles] ON 

GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (1, N'Sensor')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (2, N'Actuator')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (3, N'temperature')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (4, N'Humidity')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (5, N'Gas')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (6, N'GPS')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (7, N'Engine')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (8, N'Thing')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (9, N'00')
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
SET IDENTITY_INSERT [dbo].[ThingCategorys] ON 

GO
INSERT [dbo].[ThingCategorys] ([ID], [Title], [IconID]) VALUES (0, N'<Unspecified>', 8)
GO
INSERT [dbo].[ThingCategorys] ([ID], [Title], [IconID]) VALUES (1, N'Pump', 1)
GO
INSERT [dbo].[ThingCategorys] ([ID], [Title], [IconID]) VALUES (2, N'PLC', 1)
GO
INSERT [dbo].[ThingCategorys] ([ID], [Title], [IconID]) VALUES (3, N'Engine', 7)
GO
INSERT [dbo].[ThingCategorys] ([ID], [Title], [IconID]) VALUES (4, N'Heater', 1)
GO
INSERT [dbo].[ThingCategorys] ([ID], [Title], [IconID]) VALUES (5, N'AC', 1)
GO
INSERT [dbo].[ThingCategorys] ([ID], [Title], [IconID]) VALUES (6, N'Fan', 1)
GO
INSERT [dbo].[ThingCategorys] ([ID], [Title], [IconID]) VALUES (7, N'Valve', 1)
GO
INSERT [dbo].[ThingCategorys] ([ID], [Title], [IconID]) VALUES (8, N'TT2', 1)
GO
INSERT [dbo].[ThingCategorys] ([ID], [Title], [IconID]) VALUES (9, N'Server', 1)
GO
INSERT [dbo].[ThingCategorys] ([ID], [Title], [IconID]) VALUES (10, N'UPS', 1)
GO
INSERT [dbo].[ThingCategorys] ([ID], [Title], [IconID]) VALUES (12, N'Bus Station', NULL)
GO
SET IDENTITY_INSERT [dbo].[ThingCategorys] OFF
GO
SET IDENTITY_INSERT [dbo].[Things] ON 

GO
INSERT [dbo].[Things] ([ID], [Title], [CategoryID], [CreateByUser], [CreateTimeStamp], [UTC_Diff]) VALUES (0, N'<Unspecified>', 0, NULL, NULL, 4)
GO
INSERT [dbo].[Things] ([ID], [Title], [CategoryID], [CreateByUser], [CreateTimeStamp], [UTC_Diff]) VALUES (1, N'Thing1', 0, NULL, NULL, 4)
GO
INSERT [dbo].[Things] ([ID], [Title], [CategoryID], [CreateByUser], [CreateTimeStamp], [UTC_Diff]) VALUES (2, N'Thing2', 3, NULL, NULL, 4)
GO
INSERT [dbo].[Things] ([ID], [Title], [CategoryID], [CreateByUser], [CreateTimeStamp], [UTC_Diff]) VALUES (3, N'Thing3', 0, NULL, NULL, 4)
GO
INSERT [dbo].[Things] ([ID], [Title], [CategoryID], [CreateByUser], [CreateTimeStamp], [UTC_Diff]) VALUES (5, N'Server Room 1', 0, N'367df69f-c059-4295-95b0-718c93dfa843', CAST(N'2016-09-24 15:49:15.480' AS DateTime), 4)
GO
SET IDENTITY_INSERT [dbo].[Things] OFF
GO
SET IDENTITY_INSERT [dbo].[UserNotificationTypes] ON 

GO
INSERT [dbo].[UserNotificationTypes] ([ID], [Title]) VALUES (1, N'Alert- EndPoint Input')
GO
SET IDENTITY_INSERT [dbo].[UserNotificationTypes] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10/10/2016 2:38:54 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 10/10/2016 2:38:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 10/10/2016 2:38:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 10/10/2016 2:38:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 10/10/2016 2:38:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 10/10/2016 2:38:54 PM ******/
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
ALTER TABLE [dbo].[EndPointIOs]  WITH CHECK ADD  CONSTRAINT [FK__EndPointI__EndPo__29572725] FOREIGN KEY([EndPointID])
REFERENCES [dbo].[Endpoints] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EndPointIOs] CHECK CONSTRAINT [FK__EndPointI__EndPo__29572725]
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
GO
ALTER TABLE [dbo].[Endpoints] CHECK CONSTRAINT [FK__Endpoints__TypeI__45F365D3]
GO
ALTER TABLE [dbo].[EndPointTypes]  WITH CHECK ADD FOREIGN KEY([TypeCategoryID])
REFERENCES [dbo].[EndPointTypeCategorys] ([ID])
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
ALTER TABLE [dbo].[LinkDevicesLocations]  WITH CHECK ADD  CONSTRAINT [FK__LinkDevic__Locat__49C3F6B7] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LinkDevicesLocations] CHECK CONSTRAINT [FK__LinkDevic__Locat__49C3F6B7]
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
ALTER TABLE [dbo].[LocationViews]  WITH CHECK ADD  CONSTRAINT [FK__LocationV__Locat__286302EC] FOREIGN KEY([LocationViewTypeID])
REFERENCES [dbo].[LocationViewTypes] ([ID])
GO
ALTER TABLE [dbo].[LocationViews] CHECK CONSTRAINT [FK__LocationV__Locat__286302EC]
GO
ALTER TABLE [dbo].[ThingCategorys]  WITH CHECK ADD FOREIGN KEY([IconID])
REFERENCES [dbo].[MediaFiles] ([ID])
GO
ALTER TABLE [dbo].[Things]  WITH CHECK ADD  CONSTRAINT [FK__Things__Category__662B2B3B] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ThingCategorys] ([ID])
GO
ALTER TABLE [dbo].[Things] CHECK CONSTRAINT [FK__Things__Category__662B2B3B]
GO
/****** Object:  StoredProcedure [dbo].[GetThingEnds]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ResetDB]    Script Date: 10/10/2016 2:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  procedure [dbo].[ResetDB]
as
begin

truncate table endpointios
truncate table deviceios
truncate table usernotifications

end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_EndPoint_IOs_Days]    Script Date: 10/10/2016 2:38:54 PM ******/
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
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00'  and GetDate() and EndPointID = @EPID)as '1',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '2',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '3',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '4',
	
			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '5',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '6',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '7',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '8',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '9',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '10',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '11',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '12',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '13',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '14',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '15',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '16',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '17',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '18',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '19',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '20',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '21',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '22',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '23',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '24',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '25',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '26',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '27',


	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '28',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '29',


	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-30,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '30'

from [Endpoints] e where e.ID = @EPID

union all

(
select ID,Title,'max' as 'Fx',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00'  and GetDate() and EndPointID = @EPID)as '1',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '2',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '3',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '4',
	
			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '5',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '6',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '7',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '8',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '9',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '10',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '11',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '12',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '13',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '14',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '15',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '16',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '17',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '18',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '19',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '20',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '21',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '22',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '23',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '24',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '25',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '26',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '27',


	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '28',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '29',


	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-30,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '30'

from [Endpoints] e where e.ID = @EPID

)
union all
(
select ID,Title,'avg' as 'Fx',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00'  and GetDate() and EndPointID = @EPID)as '1',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '2',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '3',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '4',
	
			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '5',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '6',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '7',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '8',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '9',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '10',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '11',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '12',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '13',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '14',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '15',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '16',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '17',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '18',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '19',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '20',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '21',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '22',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '23',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '24',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '25',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '26',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '27',


	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '28',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '29',


	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-30,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID)as '30'

from [Endpoints] e where e.ID = @EPID

)
end


GO
/****** Object:  StoredProcedure [dbo].[Rpt_EndPoint_IOs_HOURs]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Rpt_EndPoint_IOs_Minutes]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Rpt_EndPoint_IOs_MonthAVG]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Rpt_EndPoint_IOs_MonthMAX]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Rpt_EndPoint_IOs_Months]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Rpt_ThingEnd_IOs_Days]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Rpt_ThingEnd_IOs_Hours]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Rpt_ThingEnd_IOs_Minutes]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Rpt_ThingEnd_IOs_Months]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Trigger [dbo].[TR_NewUser]    Script Date: 10/10/2016 2:38:54 PM ******/
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
/****** Object:  Trigger [dbo].[TR_DeviceConnection]    Script Date: 10/10/2016 2:38:54 PM ******/
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

end


GO
/****** Object:  Trigger [dbo].[TR_IO_Alert]    Script Date: 10/10/2016 2:38:54 PM ******/
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
			,VThingEnds vte

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
			(select count(*) from AlertConditions ac where  ac.AlertID = a.ID and ac.IsMust = 1 )=
			(select count(*) from TConditions tc where  tc.alertID = a.ID and tc.IsMust = 1)

	)

	insert into UserNotifications
	(
		UserID
		,IsRead
		,NotificationTypeID
		,RefID
		,Txt
		,AlertTimeStamp
	)
	select 
		u.Id
		,0
		,1
		,@IOID
		,ta.AlertMEssage
		,GetDate()
	from 
		TAlerts ta
		,AspNetUsers u
		,LinkUsersAlerts l

	where 
		ta.ID = l.AlertID
		and u.Id = l.UserID





end






GO
/****** Object:  Trigger [dbo].[TR_IO_AlertOld]    Script Date: 10/10/2016 2:38:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[TR_IO_AlertOld] on [dbo].[EndPointIOs] for insert
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

	-- Set Variables Values :::: End
	

	WITH notis AS 
	(
		select 
		a.Title as 'AlertTitle'
		,u.Id as 'UserID'
		,u.FullName as 'UserFullName'
		,@ThingID as 'ThingID'
		,@IOTypeID as 'EndpointTypeID'
		,@Value as 'Value'
		,replace(
			replace(
				replace(
					replace(
						replace(a.[Message]
						,N'[TimeStamp]',@ExecTimeStamp )
						,N'[Value]',@Value	)
						,N'[EndpointType]',@EndpointType)
						,N'[Measurement]',@Measurement)
						,N'[Thing]',t.Title
			 
			 ) as 'AlertMessage'
		,(select count (*) from AlertConditions sub where sub.AlertID = a.id) as 'ConditionsCount'
		from 
			Alerts a
			,AlertConditions ac
			,AlertConditionTypes act
			,LinkUsersAlerts lua
			,AspNetUsers u
			,Things t

		where
			--Tables Rel
			ac.AlertID = a.ID
			and ac.ConditionTypeID = act.ID
			and lua.AlertID = a.ID
			and lua.UserID = u.Id
			and ac.thingid = t.id

			--Params
			and a.IsActive = 1
			and ac.IOTypeID = @IOTypeID
			and ac.EndPointTypeID = @EndpointTypeID
			and ac.ThingID = @ThingID
			and a.StartTime <=  CONVERT(time(0),@ExecTimeStamp)
			and a.EndTime >= CONVERT(time(0),@ExecTimeStamp)
		
	)

	

	insert into UserNotifications
	(
		UserID
		,IsRead
		,NotificationTypeID
		,RefID
		,Txt
		,alertTimeStamp
	)
	select 
		UserID
		,0
		,1
		,@IOID
		--,AlertMessage
		,ConditionsCount
		,@ExecTimeStamp
	from notis

end




GO
USE [master]
GO
ALTER DATABASE [DynThings] SET  READ_WRITE 
GO
