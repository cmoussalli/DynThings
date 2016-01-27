CREATE TABLE [dbo].[EndPointCommands] (
    [ID]         BIGINT         IDENTITY (1, 1) NOT NULL,
    [Title]      NVARCHAR (50)  NULL,
    [Descr]      NVARCHAR (500) NULL,
    [EndPointID] BIGINT         NULL,
    [Command]    NVARCHAR (50)  NULL,
    CONSTRAINT [PK_EndPointCommands] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__EndPointC__EndPo__5CA1C101] FOREIGN KEY ([EndPointID]) REFERENCES [dbo].[Endpoints] ([ID])
);

