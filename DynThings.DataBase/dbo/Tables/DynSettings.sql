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
    [LastCentralSync]         DATETIME         NOT NULL,
    [DeploymentTimeStamp]     DATETIME         NOT NULL,
    [NotifcationMail]         NVARCHAR (50)    NULL,
    [SMTPAddress]             NVARCHAR (50)    NULL,
    [SMTPPort]                INT              NULL,
    CONSTRAINT [PK_DynSettings] PRIMARY KEY CLUSTERED ([ID] ASC)
);

