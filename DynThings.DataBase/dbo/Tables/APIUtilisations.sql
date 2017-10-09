CREATE TABLE [dbo].[APIUtilisations] (
    [ID]           BIGINT           IDENTITY (1, 1) NOT NULL,
    [AppID]        BIGINT           NULL,
    [Token]        UNIQUEIDENTIFIER NULL,
    [StatusID]     INT              NOT NULL,
    [MethodID]     BIGINT           NOT NULL,
    [TimeStampUTC] SMALLDATETIME    NOT NULL,
    [Notes]        NVARCHAR (100)   NULL,
    CONSTRAINT [PK_APIUtilizations] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__APIUtilis__Metho__4B622666] FOREIGN KEY ([MethodID]) REFERENCES [dbo].[APIMethods] ([ID])
);

