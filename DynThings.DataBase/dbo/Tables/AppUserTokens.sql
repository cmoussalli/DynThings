CREATE TABLE [dbo].[AppUserTokens] (
    [ID]           BIGINT           IDENTITY (1, 1) NOT NULL,
    [AppID]        BIGINT           NULL,
    [AspNetUserID] NVARCHAR (128)   NULL,
    [Token]        UNIQUEIDENTIFIER NULL,
    [ExpireDate]   SMALLDATETIME    NULL,
    [CreateDate]   SMALLDATETIME    NULL,
    CONSTRAINT [PK_AppUserTokens] PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([AppID]) REFERENCES [dbo].[Apps] ([ID]),
    FOREIGN KEY ([AspNetUserID]) REFERENCES [dbo].[AspNetUsers] ([Id])
);

