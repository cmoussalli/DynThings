CREATE TABLE [dbo].[Alerts] (
    [ID]         BIGINT        IDENTITY (1, 1) NOT NULL,
    [Title]      NVARCHAR (50) NOT NULL,
    [Text]       NVARCHAR (50) NOT NULL,
    [EndPointID] BIGINT        NOT NULL,
    [TimeStamp]  DATETIME      NOT NULL,
    CONSTRAINT [PK_Alerts] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__Alerts__EndPoint__37A5467C] FOREIGN KEY ([EndPointID]) REFERENCES [dbo].[Endpoints] ([ID])
);

