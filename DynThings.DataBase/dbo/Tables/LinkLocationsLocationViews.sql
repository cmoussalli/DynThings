CREATE TABLE [dbo].[LinkLocationsLocationViews] (
    [ID]             BIGINT IDENTITY (1, 1) NOT NULL,
    [LocationID]     BIGINT NOT NULL,
    [LocationViewID] BIGINT NOT NULL,
    CONSTRAINT [PK_LinkLocationsLocationViews] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__LinkLocat__Locat__35BCFE0A] FOREIGN KEY ([LocationID]) REFERENCES [dbo].[Locations] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [FK__LinkLocat__Locat__36B12243] FOREIGN KEY ([LocationViewID]) REFERENCES [dbo].[LocationViews] ([ID]) ON DELETE CASCADE
);

