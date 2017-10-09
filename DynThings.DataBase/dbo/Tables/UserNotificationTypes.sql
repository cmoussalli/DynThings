CREATE TABLE [dbo].[UserNotificationTypes] (
    [ID]    BIGINT         IDENTITY (1, 1) NOT NULL,
    [Title] NVARCHAR (512) NULL,
    CONSTRAINT [PK_UserNotificationTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

