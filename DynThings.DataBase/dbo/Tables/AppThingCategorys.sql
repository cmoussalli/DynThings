CREATE TABLE [dbo].[AppThingCategorys] (
    [ID]       BIGINT           IDENTITY (1, 1) NOT NULL,
    [GUID]     UNIQUEIDENTIFIER NOT NULL,
    [Code]     NVARCHAR (50)    NOT NULL,
    [Title]    NVARCHAR (50)    NOT NULL,
    [AppID]    BIGINT           NOT NULL,
    [IconGUID] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_AppThingCategorys] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__AppThingC__AppID__1A54DAB7] FOREIGN KEY ([AppID]) REFERENCES [dbo].[Apps] ([ID])
);

