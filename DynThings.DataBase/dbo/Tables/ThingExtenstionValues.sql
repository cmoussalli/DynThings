CREATE TABLE [dbo].[ThingExtensionValues] (
    [ID]                BIGINT         IDENTITY (1, 1) NOT NULL,
    [ThingExtensionID] BIGINT         NOT NULL,
    [ThingID]           BIGINT         NULL,
    [Valu]              NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_ThingExtensionValues] PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([ThingID]) REFERENCES [dbo].[Things] ([ID]),
    CONSTRAINT [FK__ThingExte__Thing__5D80D6A1] FOREIGN KEY ([ThingExtensionID]) REFERENCES [dbo].[ThingExtensions] ([ID])
);

