CREATE TABLE [dbo].[ThingCategorys] (
    [ID]     BIGINT        IDENTITY (1, 1) NOT NULL,
    [Title]  NVARCHAR (50) NULL,
    [IconID] BIGINT        NULL,
    [Code]   NVARCHAR (50) NULL,
    CONSTRAINT [PK_ThingTypes] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__ThingCate__IconI__25DB9BFC] FOREIGN KEY ([IconID]) REFERENCES [dbo].[MediaFiles] ([ID]),
    CONSTRAINT [FK__ThingCate__IconI__2EFAF1E2] FOREIGN KEY ([IconID]) REFERENCES [dbo].[MediaFiles] ([ID])
);

