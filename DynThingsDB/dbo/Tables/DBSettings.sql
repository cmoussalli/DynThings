CREATE TABLE [dbo].[DBSettings] (
    [ID]    BIGINT        NOT NULL,
    [Title] NVARCHAR (50) NULL,
    [valu]  NVARCHAR (50) NULL,
    CONSTRAINT [PK_DBSettings] PRIMARY KEY CLUSTERED ([ID] ASC)
);
