CREATE TABLE [dbo].[EndPointCommands] (
    [ID]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [Title]       NVARCHAR (50)  NULL,
    [Description] NVARCHAR (500) NULL,
    [EndPointID]  BIGINT         NULL,
    [CommandCode] NVARCHAR (50)  NULL,
    [OwnerID]     NVARCHAR (50)  NULL,
    CONSTRAINT [PK_EndPointCommands] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__EndPointC__EndPo__4222D4EF] FOREIGN KEY ([EndPointID]) REFERENCES [dbo].[Endpoints] ([ID]) ON DELETE CASCADE
);

