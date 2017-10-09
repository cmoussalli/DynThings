CREATE TABLE [dbo].[Things] (
    [ID]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [Title]           NVARCHAR (128) NOT NULL,
    [CategoryID]      BIGINT         NOT NULL,
    [CreateByUser]    NVARCHAR (50)  NULL,
    [CreateTimeStamp] DATETIME       NULL,
    [UTC_Diff]        INT            NOT NULL,
    CONSTRAINT [PK_Things] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__Things__Category__662B2B3B] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[ThingCategorys] ([ID])
);

