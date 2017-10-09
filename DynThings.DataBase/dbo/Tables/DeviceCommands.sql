CREATE TABLE [dbo].[DeviceCommands] (
    [ID]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [Title]       NVARCHAR (50)  NULL,
    [Description] NVARCHAR (500) NULL,
    [DeviceID]    BIGINT         NULL,
    [CommandCode] NVARCHAR (50)  NULL,
    [OwnerID]     NVARCHAR (50)  NULL,
    CONSTRAINT [PK_Commands] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__Commands__Device__4D94879B] FOREIGN KEY ([DeviceID]) REFERENCES [dbo].[Devices] ([ID]) ON DELETE CASCADE
);

