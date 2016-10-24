CREATE TABLE [dbo].[DeviceStatus] (
    [ID]    BIGINT        IDENTITY (1, 1) NOT NULL,
    [Title] NVARCHAR (50) NULL,
    CONSTRAINT [PK_DeviceStatus] PRIMARY KEY CLUSTERED ([ID] ASC)
);

