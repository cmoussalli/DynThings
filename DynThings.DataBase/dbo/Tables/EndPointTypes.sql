CREATE TABLE [dbo].[EndPointTypes] (
    [ID]             BIGINT        IDENTITY (1, 1) NOT NULL,
    [Title]          NVARCHAR (50) NULL,
    [measurement]    NVARCHAR (50) NULL,
    [TypeCategoryID] BIGINT        NULL,
    [IconID]         BIGINT        NULL,
    CONSTRAINT [PK_EndPointTypes] PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([TypeCategoryID]) REFERENCES [dbo].[EndPointTypeCategorys] ([ID])
);

