/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


SET IDENTITY_INSERT [dbo].[DynSettings] ON
GO

INSERT [dbo].[DynSettings] ([ID], [DBVersion], [DevelopmentMode], [DefaultRecordsPerMaster], [DefaultRecordsPerChild], [PlatformKey], [PublicAccess], [PublicSignUP], [EnableSystemLogger], [App_TimeZone], [PlatformTitle],[DeploymentTimeStamp],[LastCentralSync]) VALUES (1, 0.157, 0, 25, 5, newID(), 0, 0, 0, 4,N'',getutcdate(),getdate())
GO
SET IDENTITY_INSERT [dbo].[DynSettings] OFF
GO


SET IDENTITY_INSERT [dbo].[MediaFiles] ON 

GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (1, N'Sensor')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (2, N'Actuator')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (3, N'EndPoint')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (4, N'Device')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (5, N'Thing')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (6, N'Location')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (7, N'View')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (8, N'Command')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (9, N'Alert')
GO
INSERT [dbo].[MediaFiles] ([ID], [Title]) VALUES (10, N'User')
GO
SET IDENTITY_INSERT [dbo].[MediaFiles] OFF
GO

SET IDENTITY_INSERT [dbo].[ThingCategorys] ON 
GO
INSERT [dbo].[ThingCategorys] ([ID], [Title], [IconID]) VALUES (0, N'<Unspecified>', 8)
GO
SET IDENTITY_INSERT [dbo].[ThingCategorys] OFF
GO

SET IDENTITY_INSERT [dbo].[Things] ON 
GO
INSERT [dbo].[Things] ([ID], [Title], [CategoryID], [CreateByUser], [CreateTimeStamp], [UTC_Diff]) VALUES (0, N'<Unspecified>', 0, NULL, NULL, 4)
GO
SET IDENTITY_INSERT [dbo].[Things] OFF
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

--SET IDENTITY_INSERT [dbo].[EndPointTypes] ON 
--GO
--INSERT [dbo].[EndPointTypes] ([ID], [Title], [measurement], [TypeCategoryID], [IconID]) VALUES (1, N'Temperature', N'C', 1, 3)
--GO
--SET IDENTITY_INSERT [dbo].[EndPointTypes] OFF
--GO

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

INSERT [dbo].[IOTypes] ([ID], [IO], [Title]) VALUES (1, N'I', N'Input')
GO
INSERT [dbo].[IOTypes] ([ID], [IO], [Title]) VALUES (2, N'C', N'Command')
GO
INSERT [dbo].[IOTypes] ([ID], [IO], [Title]) VALUES (3, N'L', N'Log')
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


INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Monitor & Control')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'Monitor Only')
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

SET IDENTITY_INSERT [dbo].[UserNotificationTypes] ON 
GO
INSERT [dbo].[UserNotificationTypes] ([ID], [Title]) VALUES (1, N'Alert- EndPoint Input')
GO
SET IDENTITY_INSERT [dbo].[UserNotificationTypes] OFF
GO



drop table #ConfigTable