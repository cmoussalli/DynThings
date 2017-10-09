CREATE TABLE [dbo].[Endpoints] (
    [ID]                 BIGINT           IDENTITY (1, 1) NOT NULL,
    [GUID]               UNIQUEIDENTIFIER NOT NULL,
    [KeyPass]            UNIQUEIDENTIFIER NOT NULL,
    [PinCode]            NVARCHAR (50)    NOT NULL,
    [Title]              NVARCHAR (50)    NOT NULL,
    [DeviceID]           BIGINT           NOT NULL,
    [TypeID]             BIGINT           NOT NULL,
    [ThingID]            BIGINT           NOT NULL,
    [IsNumericOnly]      BIT              NOT NULL,
    [MinValue]           REAL             NULL,
    [MaxValue]           REAL             NULL,
    [LowRange]           REAL             NULL,
    [HighRange]          REAL             NULL,
    [LastIOID]           BIGINT           NULL,
    [LastIONumericValue] REAL             NULL,
    [LastIOValue]        NVARCHAR (50)    NULL,
    [LastIOTimeStamp]    DATETIME         NULL,
    [LastIOTimeStampUTC] DATETIME         NULL,
    CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__Endpoints__Devic__00DF2177] FOREIGN KEY ([DeviceID]) REFERENCES [dbo].[Devices] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [FK__Endpoints__Thing__7EF6D905] FOREIGN KEY ([ThingID]) REFERENCES [dbo].[Things] ([ID]),
    CONSTRAINT [FK__Endpoints__TypeI__45F365D3] FOREIGN KEY ([TypeID]) REFERENCES [dbo].[EndPointTypes] ([ID]) ON DELETE CASCADE
);


GO
create trigger [dbo].[TR_UpdateThing_Update] on dbo.Endpoints for update
as
begin
	declare @endID bigint
	declare @InsertedThingID bigint
	declare @RemovedThingID bigint
	declare @LastIOID bigint
	declare @LastIOValue nvarchar(50)
	declare @LastIOTimeStamp datetime
	declare @LastIOTimeStampUTC datetime
	declare @EndpointTypeID bigint

	select @endID = ID  from inserted
	select @InsertedThingID = thingid from inserted
	select @RemovedThingID = thingid from deleted
	select @LastIOID = lastIOID from inserted
	select @LastIOValue = LastIOValue from inserted
	select @LastIOTimeStamp = LastIOTimeStamp from inserted
	select @LastIOTimeStampUTC = LastIOTimeStampUTC from inserted
	select @EndpointTypeID = TypeID from inserted

	if UPDATE(ThingID)
	begin

		exec AttachEndPointTypeToThing @EndPointTypeID = @EndpointTypeID  ,@thingID = @InsertedThingID

	end
	if UPDATE(lastIOTimeStamp)
	begin

		update ThingEnds set LastIOID = @LastIOID, LastIOValue = @LastIOValue , LastIOTimeStamp = @LastIOTimeStamp ,LastIOTimeStampUTC = @LastIOTimeStampUTC   where ThingID =@InsertedThingID and EndPointTypeID = @EndpointTypeID

	end
end

GO


CREATE trigger [dbo].[TR_LastIOValueNumeric]
on [dbo].[Endpoints] for update
as
begin
	declare @ID bigint
	declare @LastIOValue real

	select @ID = id from inserted
	select @LastIOValue = LastIOValue from inserted

	update Endpoints set LastIONumericValue = @LastIOValue where ID = @ID and IsNumericOnly = 1

end


GO
create trigger [dbo].[TR_UpdateThing_Insert] on [dbo].[Endpoints] for insert
as
begin
	declare @endID bigint
	declare @InsertedThingID bigint
	declare @RemovedThingID bigint
	declare @LastIOID bigint
	declare @LastIOValue nvarchar(50)
	declare @LastIOTimeStamp datetime
	declare @LastIOTimeStampUTC datetime
	declare @EndpointTypeID bigint

	select @endID = ID  from inserted
	select @InsertedThingID = thingid from inserted
	select @LastIOID = lastIOID from inserted
	select @LastIOValue = LastIOValue from inserted
	select @LastIOTimeStamp = LastIOTimeStamp from inserted
	select @LastIOTimeStampUTC = LastIOTimeStampUTC from inserted
	select @EndpointTypeID = TypeID from inserted

	
		exec AttachEndPointTypeToThing @EndPointTypeID = @EndpointTypeID  ,@thingID = @InsertedThingID
	
end
