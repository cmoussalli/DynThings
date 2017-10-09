CREATE TABLE [dbo].[AppMediaFiles] (
    [ID]    BIGINT           IDENTITY (1, 1) NOT NULL,
    [GUID]  UNIQUEIDENTIFIER NOT NULL,
    [AppID] BIGINT           NOT NULL,
    [Title] NVARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_AppMediaFiles] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__AppMediaF__AppID__2E5BD364] FOREIGN KEY ([AppID]) REFERENCES [dbo].[Apps] ([ID])
);

