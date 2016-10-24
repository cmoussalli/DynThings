CREATE TABLE [dbo].[LinkThingsLocations] (
    [ID]              BIGINT        IDENTITY (1, 1) NOT NULL,
    [LocationID]      BIGINT        NULL,
    [ThingID]         BIGINT        NULL,
    [CreateByUser]    NVARCHAR (50) NULL,
    [CreateTimeStamp] DATETIME      NULL,
    CONSTRAINT [PK_LinkThingsLocations] PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([LocationID]) REFERENCES [dbo].[Locations] ([ID]),
    CONSTRAINT [FK__LinkThing__Thing__0697FACD] FOREIGN KEY ([ThingID]) REFERENCES [dbo].[Things] ([ID]) ON DELETE CASCADE
);

