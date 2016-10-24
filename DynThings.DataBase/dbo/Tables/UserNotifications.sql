CREATE TABLE [dbo].[UserNotifications] (
    [ID]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserID]             NVARCHAR (128) NULL,
    [IsRead]             BIGINT         NULL,
    [Txt]                NVARCHAR (512) NULL,
    [NotificationTypeID] BIGINT         NULL,
    [RefID]              BIGINT         NULL,
    [AlertTimeStamp]     DATETIME       NULL,
    CONSTRAINT [PK_UserNotifications] PRIMARY KEY CLUSTERED ([ID] ASC)
);

