CREATE TABLE [dbo].[DynSettings] (
    [ID]                      BIGINT           IDENTITY (1, 1) NOT NULL,
    [DBVersion]               REAL             NOT NULL,
    [DevelopmentMode]         BIT              NOT NULL,
    [DefaultRecordsPerMaster] INT              NOT NULL,
    [DefaultRecordsPerChild]  INT              NOT NULL,
    [PlatformKey]             UNIQUEIDENTIFIER NOT NULL,
    [PublicAccess]            BIT              NOT NULL,
    [PublicSignUP]            BIT              NOT NULL,
    [EnableSystemLogger]      BIT              NOT NULL,
    [App_TimeZone]            INT              NOT NULL,
    [PlatformTitle]           NVARCHAR (128)   NULL,
    CONSTRAINT [PK_DynSettings] PRIMARY KEY CLUSTERED ([ID] ASC)
);

