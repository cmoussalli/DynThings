CREATE TABLE [dbo].[Endpoints] (
    [ID]            BIGINT           IDENTITY (1, 1) NOT NULL,
    [GUID]          UNIQUEIDENTIFIER NOT NULL,
    [KeyPass]       UNIQUEIDENTIFIER NOT NULL,
    [PinCode]       NVARCHAR (50)    NOT NULL,
    [Title]         NVARCHAR (50)    NOT NULL,
    [DeviceID]      BIGINT           NOT NULL,
    [TypeID]        BIGINT           NOT NULL,
    [ThingID]       BIGINT           NOT NULL,
    [IsNumericOnly] BIT              NULL,
    [MinValue]      REAL             NULL,
    [MaxValue]      REAL             NULL,
    [LowRange]      REAL             NULL,
    [HighRange]     REAL             NULL,
    CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__Endpoints__Devic__00DF2177] FOREIGN KEY ([DeviceID]) REFERENCES [dbo].[Devices] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [FK__Endpoints__Thing__7EF6D905] FOREIGN KEY ([ThingID]) REFERENCES [dbo].[Things] ([ID]),
    CONSTRAINT [FK__Endpoints__TypeI__45F365D3] FOREIGN KEY ([TypeID]) REFERENCES [dbo].[EndPointTypes] ([ID]) ON DELETE CASCADE
);

