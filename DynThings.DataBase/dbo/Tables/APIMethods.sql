CREATE TABLE [dbo].[APIMethods] (
    [ID]         BIGINT        IDENTITY (1, 1) NOT NULL,
    [MethodName] NVARCHAR (50) NULL,
    [Controller] NVARCHAR (50) NULL,
    CONSTRAINT [PK_APIMethods] PRIMARY KEY CLUSTERED ([ID] ASC)
);

