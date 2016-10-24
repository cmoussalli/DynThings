CREATE TABLE [dbo].[Alerts] (
    [ID]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [Title]     NVARCHAR (256) NOT NULL,
    [Message]   NVARCHAR (500) NOT NULL,
    [IsActive]  BIT            NOT NULL,
    [Sunday]    BIT            NOT NULL,
    [Monday]    BIT            NOT NULL,
    [Tuesday]   BIT            NOT NULL,
    [Wednesday] BIT            NOT NULL,
    [Thursday]  BIT            NOT NULL,
    [Friday]    BIT            NOT NULL,
    [Saturday]  BIT            NOT NULL,
    [StartTime] TIME (7)       NOT NULL,
    [EndTime]   TIME (7)       NOT NULL,
    CONSTRAINT [PK_Alerts] PRIMARY KEY CLUSTERED ([ID] ASC)
);

