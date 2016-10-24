CREATE TABLE [dbo].[MediaFiles] (
    [ID]    BIGINT        IDENTITY (1, 1) NOT NULL,
    [Title] NVARCHAR (50) NULL,
    CONSTRAINT [PK_MediaFiles] PRIMARY KEY CLUSTERED ([ID] ASC)
);

