CREATE TABLE [dbo].[CssColors] (
    [ID]    BIGINT        IDENTITY (1, 1) NOT NULL,
    [Title] NVARCHAR (50) NULL,
    [Css]   NVARCHAR (50) NULL,
    CONSTRAINT [PK_CssColors] PRIMARY KEY CLUSTERED ([ID] ASC)
);

