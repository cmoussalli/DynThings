CREATE TABLE [dbo].[AppEndpointTypes] (
    [ID]             BIGINT           IDENTITY (1, 1) NOT NULL,
    [Code]           NVARCHAR (50)    NOT NULL,
    [GUID]           UNIQUEIDENTIFIER NOT NULL,
    [AppID]          BIGINT           NOT NULL,
    [Title]          NVARCHAR (50)    NOT NULL,
    [Measurement]    NVARCHAR (50)    NOT NULL,
    [TypeCategoryID] BIGINT           NOT NULL,
    [IconGUID]       UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_AppEndpointTypes] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__AppEndpoi__AppID__2101D846] FOREIGN KEY ([AppID]) REFERENCES [dbo].[Apps] ([ID]),
    CONSTRAINT [FK__AppEndpoi__TypeC__2F4FF79D] FOREIGN KEY ([TypeCategoryID]) REFERENCES [dbo].[EndPointTypeCategorys] ([ID])
);

