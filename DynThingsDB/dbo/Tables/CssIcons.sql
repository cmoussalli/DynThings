CREATE TABLE [dbo].[CssIcons] (
    [ID]    BIGINT        IDENTITY (1, 1) NOT NULL,
    [Title] NVARCHAR (50) NULL,
    [Css]   NVARCHAR (24) NULL,
    CONSTRAINT [PK_CssIcons] PRIMARY KEY CLUSTERED ([ID] ASC)
);

