CREATE TABLE [dbo].[Apps] (
    [ID]                 BIGINT           IDENTITY (1, 1) NOT NULL,
    [GUID]               UNIQUEIDENTIFIER NOT NULL,
    [Key]                UNIQUEIDENTIFIER NOT NULL,
    [Title]              NVARCHAR (100)   NOT NULL,
    [Description]        NVARCHAR (2000)  NOT NULL,
    [CreatedByID]        NVARCHAR (128)   NOT NULL,
    [CreateDate]         DATETIME         NOT NULL,
    [StatusID]           INT              NOT NULL,
    [IsStoreApp]         BIT              NOT NULL,
    [DevelopedByName]    NVARCHAR (128)   NULL,
    [StoreAppLastUpdate] DATETIME         NULL,
    [Version]            FLOAT (53)       NOT NULL,
    CONSTRAINT [PK_Apps] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__Apps__StatusID__4F9CCB9E] FOREIGN KEY ([StatusID]) REFERENCES [dbo].[AppStatuss] ([ID])
);

