CREATE TABLE [dbo].[EndPointTypes] (
    [ID]             BIGINT        IDENTITY (1, 1) NOT NULL,
    [Code]           NVARCHAR (50) NULL,
    [Title]          NVARCHAR (50) NULL,
    [measurement]    NVARCHAR (50) NULL,
    [TypeCategoryID] BIGINT        NULL,
    [IconID]         BIGINT        NULL,
    CONSTRAINT [PK_EndPointTypes] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__EndPointT__TypeC__2A363CC5] FOREIGN KEY ([TypeCategoryID]) REFERENCES [dbo].[EndPointTypeCategorys] ([ID]),
    CONSTRAINT [FK__EndPointT__TypeC__47DBAE45] FOREIGN KEY ([TypeCategoryID]) REFERENCES [dbo].[EndPointTypeCategorys] ([ID])
);

