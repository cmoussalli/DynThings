CREATE TABLE [dbo].[DeviceIOs] (
    [ID]                    BIGINT         IDENTITY (1, 1) NOT NULL,
    [DeviceID]              BIGINT         NULL,
    [IOTypeID]              BIGINT         NULL,
    [Valu]                  NVARCHAR (250) NULL,
    [TimeStamp]             DATETIME       NULL,
    [ExecTimeStamp]         DATETIME       NULL,
    [ScheduleTimeStamp]     DATETIME       NULL,
    [TimeStamp_UTC]         DATETIME       NULL,
    [ExecTimeStamp_UTC]     DATETIME       NULL,
    [ScheduleTimeStamp_UTC] DATETIME       NULL,
    CONSTRAINT [PK_DeviceIOs_1] PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([IOTypeID]) REFERENCES [dbo].[IOTypes] ([ID]),
    FOREIGN KEY ([IOTypeID]) REFERENCES [dbo].[IOTypes] ([ID]),
    CONSTRAINT [FK__DeviceIOs__Devic__19AACF41] FOREIGN KEY ([DeviceID]) REFERENCES [dbo].[Devices] ([ID]) ON DELETE CASCADE
);

