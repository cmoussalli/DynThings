CREATE TABLE [dbo].[AlertLevels] (
    [ID]    BIGINT        IDENTITY (1, 1) NOT NULL,
    [Title] NVARCHAR (50) NULL,
    CONSTRAINT [PK_AlertLevels] PRIMARY KEY CLUSTERED ([ID] ASC)
);

