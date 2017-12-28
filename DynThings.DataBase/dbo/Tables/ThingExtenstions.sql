CREATE TABLE [dbo].[ThingExtensions] (
    [ID]              BIGINT           IDENTITY (1, 1) NOT NULL,
    [GUID]            UNIQUEIDENTIFIER NOT NULL,
    [Code]            NVARCHAR (50)    NULL,
    [ThingCategoryID] BIGINT           NOT NULL,
    [Title]           NVARCHAR (128)   NOT NULL,
    [DataTypeID]      INT              NOT NULL,
    [IsList]          BIT              NOT NULL,
    CONSTRAINT [PK_ThingExtensions] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__ThingExte__DataT__5C8CB268] FOREIGN KEY ([DataTypeID]) REFERENCES [dbo].[DataTypes] ([ID]),
    CONSTRAINT [FK__ThingExte__Thing__6339AFF7] FOREIGN KEY ([ThingCategoryID]) REFERENCES [dbo].[ThingCategorys] ([ID])
);

