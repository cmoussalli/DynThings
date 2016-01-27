CREATE TABLE [dbo].[Devices] (
    [ID]       BIGINT        IDENTITY (1, 1) NOT NULL,
    [Title]    NVARCHAR (50) NULL,
    [StatusID] BIGINT        NULL,
    CONSTRAINT [PK_Devices_1] PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([StatusID]) REFERENCES [dbo].[DeviceStatus] ([ID])
);

