CREATE TABLE [dbo].[AppAPIEntitys] (
    [ID]             BIGINT IDENTITY (1, 1) NOT NULL,
    [AppID]          BIGINT NOT NULL,
    [SystemEntityID] BIGINT NOT NULL,
    CONSTRAINT [PK_AppEntitys] PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([SystemEntityID]) REFERENCES [dbo].[SystemEntitys] ([ID]),
    FOREIGN KEY ([SystemEntityID]) REFERENCES [dbo].[SystemEntitys] ([ID]),
    CONSTRAINT [FK__AppEntity__AppID__5EDF0F2E] FOREIGN KEY ([AppID]) REFERENCES [dbo].[Apps] ([ID]) ON DELETE CASCADE
);

