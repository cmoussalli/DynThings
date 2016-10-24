CREATE TABLE [dbo].[ThingCategorys] (
    [ID]     BIGINT        IDENTITY (1, 1) NOT NULL,
    [Title]  NVARCHAR (50) NULL,
    [IconID] BIGINT        NULL,
    CONSTRAINT [PK_ThingTypes] PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([IconID]) REFERENCES [dbo].[MediaFiles] ([ID])
);

