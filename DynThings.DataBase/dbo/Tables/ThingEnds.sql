CREATE TABLE [dbo].[ThingEnds] (
    [ID]                 BIGINT        IDENTITY (1, 1) NOT NULL,
    [ThingID]            BIGINT        NULL,
    [EndPointTypeID]     BIGINT        NULL,
    [LastIOValue]        NVARCHAR (50) NULL,
    [LastIOID]           BIGINT        NULL,
    [LastIOTimeStamp]    DATETIME      NULL,
    [LastIOTimeStampUTC] DATETIME      NULL,
    CONSTRAINT [PK_ThingEnds] PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([LastIOID]) REFERENCES [dbo].[EndPointIOs] ([ID]),
    CONSTRAINT [FK__ThingEnds__EndPo__7F36D027] FOREIGN KEY ([EndPointTypeID]) REFERENCES [dbo].[EndPointTypes] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [FK__ThingEnds__Thing__7E42ABEE] FOREIGN KEY ([ThingID]) REFERENCES [dbo].[Things] ([ID]) ON DELETE CASCADE
);

