CREATE TABLE [dbo].[AlertConditionTypes] (
    [ID]    BIGINT        IDENTITY (1, 1) NOT NULL,
    [Title] NVARCHAR (50) NULL,
    CONSTRAINT [PK_Conditions] PRIMARY KEY CLUSTERED ([ID] ASC)
);

