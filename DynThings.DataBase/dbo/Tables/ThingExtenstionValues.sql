CREATE TABLE [dbo].[ThingExtenstionValues] (
    [ID]                BIGINT         IDENTITY (1, 1) NOT NULL,
    [ThingExtenstionID] BIGINT         NOT NULL,
    [ThingID]           BIGINT         NULL,
    [Valu]              NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_ThingExtenstionValues] PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([ThingID]) REFERENCES [dbo].[Things] ([ID]),
    CONSTRAINT [FK__ThingExte__Thing__5D80D6A1] FOREIGN KEY ([ThingExtenstionID]) REFERENCES [dbo].[ThingExtenstions] ([ID])
);

