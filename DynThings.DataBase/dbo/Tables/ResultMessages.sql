CREATE TABLE [dbo].[ResultMessages] (
    [ID]      BIGINT         NOT NULL,
    [Message] NVARCHAR (500) NULL,
    [IsError] BIT            NULL,
    CONSTRAINT [PK_ErrorMessages] PRIMARY KEY CLUSTERED ([ID] ASC)
);

