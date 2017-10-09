CREATE TABLE [dbo].[AlertConditions] (
    [ID]              BIGINT        IDENTITY (1, 1) NOT NULL,
    [AlertID]         BIGINT        NOT NULL,
    [ThingID]         BIGINT        NOT NULL,
    [IOTypeID]        BIGINT        NOT NULL,
    [EndPointTypeID]  BIGINT        NOT NULL,
    [ConditionTypeID] BIGINT        NOT NULL,
    [ConditionValue]  NVARCHAR (50) NOT NULL,
    [IsMust]          BIT           NOT NULL,
    CONSTRAINT [PK_AlertConditions] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__AlertCond__Alert__7720AD13] FOREIGN KEY ([AlertID]) REFERENCES [dbo].[Alerts] ([ID]),
    CONSTRAINT [FK__AlertCond__Condi__74444068] FOREIGN KEY ([ConditionTypeID]) REFERENCES [dbo].[AlertConditionTypes] ([ID]),
    CONSTRAINT [FK__AlertCond__EndPo__0662F0A3] FOREIGN KEY ([EndPointTypeID]) REFERENCES [dbo].[EndPointTypes] ([ID]),
    CONSTRAINT [FK__AlertCond__IOTyp__056ECC6A] FOREIGN KEY ([IOTypeID]) REFERENCES [dbo].[IOTypes] ([ID]),
    CONSTRAINT [FK__AlertCond__Thing__762C88DA] FOREIGN KEY ([ThingID]) REFERENCES [dbo].[Things] ([ID])
);

