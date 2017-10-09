CREATE TABLE [dbo].[DataTypes] (
    [ID]    INT           IDENTITY (1, 1) NOT NULL,
    [Title] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_DataTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

