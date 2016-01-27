CREATE TABLE [dbo].[Locations] (
    [ID]         BIGINT           IDENTITY (1, 1) NOT NULL,
    [GUID]       UNIQUEIDENTIFIER NOT NULL,
    [Title]      NVARCHAR (50)    NOT NULL,
    [LongitudeY] NVARCHAR (50)    NOT NULL,
    [LatitudeX]  NVARCHAR (50)    NOT NULL,
    [isActive]   BIT              NOT NULL,
    [Status]     BIGINT           NOT NULL,
    [IconID]     BIGINT           NOT NULL,
    CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED ([ID] ASC)
);

