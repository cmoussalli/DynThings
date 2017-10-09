CREATE TABLE [dbo].[LinkDevicesLocations] (
    [ID]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [LocationID]     BIGINT         NULL,
    [DeviceID]       BIGINT         NULL,
    [StartTimeStamp] DATETIME       NULL,
    [EndTimeStamp]   DATETIME       NULL,
    [StartByUser]    NVARCHAR (128) NULL,
    [EndByUser]      NVARCHAR (128) NULL,
    CONSTRAINT [PK_LinkDevicesLocations] PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([EndByUser]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    FOREIGN KEY ([EndByUser]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    FOREIGN KEY ([StartByUser]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    FOREIGN KEY ([StartByUser]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK__LinkDevic__Devic__48CFD27E] FOREIGN KEY ([DeviceID]) REFERENCES [dbo].[Devices] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [FK__LinkDevic__Locat__49C3F6B7] FOREIGN KEY ([LocationID]) REFERENCES [dbo].[Locations] ([ID]) ON DELETE CASCADE
);

