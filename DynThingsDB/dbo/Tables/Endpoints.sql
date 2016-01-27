CREATE TABLE [dbo].[Endpoints] (
    [ID]       BIGINT           IDENTITY (1, 1) NOT NULL,
    [GUID]     UNIQUEIDENTIFIER NOT NULL,
    [KeyPass]  UNIQUEIDENTIFIER NOT NULL,
    [PinCode]  NVARCHAR (50)    NOT NULL,
    [Title]    NVARCHAR (50)    NOT NULL,
    [DeviceID] BIGINT           NULL,
    [TypeID]   BIGINT           NOT NULL,
    [ColorID]  BIGINT           NOT NULL,
    [IconID]   BIGINT           NOT NULL,
    CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([DeviceID]) REFERENCES [dbo].[Devices] ([ID]),
    CONSTRAINT [FK__Endpoints__Color__3864608B] FOREIGN KEY ([ColorID]) REFERENCES [dbo].[CssColors] ([ID]),
    CONSTRAINT [FK__Endpoints__IconI__160F4887] FOREIGN KEY ([IconID]) REFERENCES [dbo].[CssIcons] ([ID]),
    CONSTRAINT [FK__EndPoints__TypeI__21B6055D] FOREIGN KEY ([TypeID]) REFERENCES [dbo].[EndPointTypes] ([ID])
);

