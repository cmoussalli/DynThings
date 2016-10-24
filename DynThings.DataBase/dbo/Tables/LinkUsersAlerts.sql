CREATE TABLE [dbo].[LinkUsersAlerts] (
    [ID]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserID]  NVARCHAR (128) NOT NULL,
    [AlertID] BIGINT         NOT NULL,
    CONSTRAINT [PK_LinkUsersAlerts] PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([UserID]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK__LinkUsers__Alert__7EC1CEDB] FOREIGN KEY ([AlertID]) REFERENCES [dbo].[Alerts] ([ID])
);

