CREATE TABLE [dbo].[EndPointIOs] (
    [ID]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [EndPointID]    BIGINT        NOT NULL,
    [IO]            NVARCHAR (6)  NOT NULL,
    [Valu]          NVARCHAR (50) NOT NULL,
    [TimeStamp]     DATETIME      NOT NULL,
    [ExecTimeStamp] DATETIME      NULL,
    CONSTRAINT [PK_DeviceIOs] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__EndPointI__EndPo__29572725] FOREIGN KEY ([EndPointID]) REFERENCES [dbo].[Endpoints] ([ID])
);

