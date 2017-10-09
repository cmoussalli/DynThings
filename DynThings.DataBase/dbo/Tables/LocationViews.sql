CREATE TABLE [dbo].[LocationViews] (
    [ID]                 BIGINT        IDENTITY (1, 1) NOT NULL,
    [Title]              NVARCHAR (50) NOT NULL,
    [IsActive]           BIT           NOT NULL,
    [OwnerID]            NVARCHAR (50) NOT NULL,
    [LocationViewTypeID] BIGINT        NOT NULL,
    [X]                  NVARCHAR (50) NOT NULL,
    [Y]                  NVARCHAR (50) NOT NULL,
    [Z]                  NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_LocationViews] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__LocationV__Locat__286302EC] FOREIGN KEY ([LocationViewTypeID]) REFERENCES [dbo].[LocationViewTypes] ([ID])
);

