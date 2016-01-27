CREATE TABLE [dbo].[EndPointTriggers] (
    [ID]                BIGINT        IDENTITY (1, 1) NOT NULL,
    [Title]             NVARCHAR (50) NULL,
    [TriggerEndPointID] BIGINT        NULL,
    [ActionEndPointID]  BIGINT        NULL,
    [CommandID]         BIGINT        NULL,
    CONSTRAINT [PK_EndPointTriggers] PRIMARY KEY CLUSTERED ([ID] ASC)
);

