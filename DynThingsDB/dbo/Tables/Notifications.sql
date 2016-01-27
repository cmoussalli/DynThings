CREATE TABLE [dbo].[Notifications] (
    [ID]        BIGINT        IDENTITY (1, 1) NOT NULL,
    [UserID]    NVARCHAR (50) NOT NULL,
    [Title]     NVARCHAR (50) NOT NULL,
    [Text]      NVARCHAR (50) NOT NULL,
    [IsNew]     BIT           NOT NULL,
    [TimeStamp] DATETIME      NOT NULL,
    CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED ([ID] ASC)
);

