CREATE TABLE [dbo].[Devices] (
    [ID]                      BIGINT           IDENTITY (1, 1) NOT NULL,
    [GUID]                    UNIQUEIDENTIFIER NULL,
    [KeyPass]                 UNIQUEIDENTIFIER NULL,
    [PinCode]                 NVARCHAR (50)    NULL,
    [Title]                   NVARCHAR (50)    NULL,
    [StatusID]                BIGINT           NULL,
    [UTC_Diff]                INT              NOT NULL,
    [IsConnectedDelay]        INT              NOT NULL,
    [IsConnected]             BIT              NOT NULL,
    [LastConnectionTimeStamp] DATETIME         NULL,
    CONSTRAINT [PK_Devices_1] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__Devices__StatusI__01D345B0] FOREIGN KEY ([StatusID]) REFERENCES [dbo].[DeviceStatus] ([ID]) ON DELETE CASCADE
);

