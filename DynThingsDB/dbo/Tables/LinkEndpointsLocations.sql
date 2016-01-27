CREATE TABLE [dbo].[LinkEndpointsLocations] (
    [ID]         BIGINT IDENTITY (1, 1) NOT NULL,
    [LocationID] BIGINT NULL,
    [EndpointID] BIGINT NULL,
    CONSTRAINT [PK_LinkEndpointsLocations] PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([LocationID]) REFERENCES [dbo].[Locations] ([ID]),
    CONSTRAINT [FK__LinkEndpo__Endpo__32E0915F] FOREIGN KEY ([EndpointID]) REFERENCES [dbo].[Endpoints] ([ID])
);

