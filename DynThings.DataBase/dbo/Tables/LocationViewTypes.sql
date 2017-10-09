CREATE TABLE [dbo].[LocationViewTypes] (
    [ID]    BIGINT        IDENTITY (1, 1) NOT NULL,
    [Title] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_LocationViewTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

