CREATE TABLE [dbo].[AppThingExtensions] (
    [ID]                   BIGINT           IDENTITY (1, 1) NOT NULL,
    [GUID]                 UNIQUEIDENTIFIER NOT NULL,
    [Code]                 NVARCHAR (50)    NOT NULL,
    [AppID]                BIGINT           NOT NULL,
    [AppThingCategoryCode] NVARCHAR (50)    NOT NULL,
    [Title]                NVARCHAR (128)   NOT NULL,
    [DataTypeID]           INT              NOT NULL,
    [IsList]               BIT              NOT NULL,
    CONSTRAINT [PK_AppThingExtensions] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__AppThingE__AppID__1960B67E] FOREIGN KEY ([AppID]) REFERENCES [dbo].[Apps] ([ID]),
    CONSTRAINT [FK__AppThingE__DataT__25C68D63] FOREIGN KEY ([DataTypeID]) REFERENCES [dbo].[DataTypes] ([ID])
);

