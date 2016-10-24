CREATE TABLE [dbo].[EndPointIOs] (
    [ID]                BIGINT        IDENTITY (1, 1) NOT NULL,
    [EndPointID]        BIGINT        NOT NULL,
    [IOTypeID]          BIGINT        NOT NULL,
    [Valu]              NVARCHAR (50) NOT NULL,
    [TimeStamp]         DATETIME      NOT NULL,
    [ExecTimeStamp]     DATETIME      NULL,
    [ScheduleTimeStamp] DATETIME      NULL,
    [ThingID]           BIGINT        NOT NULL,
    CONSTRAINT [PK_DeviceIOs] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK__EndPointI__EndPo__29572725] FOREIGN KEY ([EndPointID]) REFERENCES [dbo].[Endpoints] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [FK__EndPointI__IOTyp__440B1D61] FOREIGN KEY ([IOTypeID]) REFERENCES [dbo].[IOTypes] ([ID]),
    CONSTRAINT [FK__EndPointI__Thing__7E02B4CC] FOREIGN KEY ([ThingID]) REFERENCES [dbo].[Things] ([ID]) ON DELETE CASCADE
);


GO
CREATE trigger [dbo].[TR_IO_Alert] on [dbo].[EndPointIOs] for insert
as
begin
	-- Declare Variables :::: Start
	declare @IOID bigint
	declare @EndPointID bigint
	declare @IOTypeID bigint
	declare @EndpointTypeID bigint
	declare @EndpointType nvarchar(50)
	declare @Measurement nvarchar(50)
	declare @Value nvarchar(50)
	declare @ExecTimeStamp datetime
	declare @ThingID bigint
	declare @ThingTitle nvarchar(128)
	-- Declare Variables :::: End

	-- Set Variables Values :::: Start
	select @IOID  = ID from inserted;
	select @EndPointID = EndPointID from inserted;
	select @IOTypeID = IOTypeID from inserted;
	select @EndpointTypeID = TypeID from [Endpoints] where ID = @EndPointID;
	select @EndpointType = et.Title from [Endpoints] e, EndPointTypes et  where e.TypeID = et.ID and e.ID = @EndPointID;
	select @Measurement = et.Measurement from [Endpoints] e, EndPointTypes et  where e.TypeID = et.ID and e.ID = @EndPointID;
	select @Value = Valu from inserted;
	select @ExecTimeStamp = ExecTimeStamp from inserted;
	select @ThingID = ThingID from inserted;
	select @ThingTitle = title from Things where id = @ThingID;
	-- Set Variables Values :::: End
	

	WITH TConditions AS 
	(
		select 
		ac.ID as 'ConditionID'
		,ac.AlertID as 'AlertID'
		,ac.ThingID as 'ThingID'
		,ac.IOTypeID as 'IOTypeID'
		,ac.EndPointTypeID as 'EndpointTypeID'
		,ac.ConditionTypeID
		,ac.ConditionValue
		,ac.IsMust
		,(select count (*) from AlertConditions sub where sub.AlertID = a.id and sub.IsMust = 1) as 'ConIsMustCount'
		,(select count (*) from AlertConditions sub where sub.AlertID = a.id and sub.IsMust = 0) as 'ConOptMustCount'
		,vte.LastValue as 'LastValue'
		
		from 
			alerts a
			,AlertConditions ac
			,AlertConditionTypes act
			,Things t
			,VThingEnds vte

		where
			--Tables Rel
			ac.AlertID = a.ID
			and ac.ConditionTypeID = act.ID
			and ac.thingid = t.id

			and vte.ThingID = t.ID
			and vte.IOTypeID = ac.IOTypeID
			and vte.EndpointTypeID = ac.EndPointTypeID

			--Params
			and a.IsActive = 1
			and a.StartTime <=  CONVERT(time(0),@ExecTimeStamp)
			and a.EndTime >= CONVERT(time(0),@ExecTimeStamp)
		
			--Validate Conditions
			and (
				(ac.ConditionTypeID = 1 and ac.ConditionValue = LastValue)
				or (ac.ConditionTypeID = 2 and ac.ConditionValue != LastValue)
				or (ac.ConditionTypeID = 3 and LastValue > ac.ConditionValue)
				or (ac.ConditionTypeID = 4 and LastValue < ac.ConditionValue)			
			)

	), TAlerts AS(

	
	select 
		a.ID
		,replace(
			replace(
				replace(
					replace(
						replace(a.[Message]
						,N'[TimeStamp]',@ExecTimeStamp )
						,N'[Value]',@Value	)
						,N'[EndpointType]',@EndpointType)
						,N'[Measurement]',@Measurement)
						,N'[Thing]',@ThingTitle
			 
			 ) as 'AlertMessage'
		--,(select count(*) from AlertConditions ac where  ac.AlertID = a.ID )as 'ConditionIsMust' 
		--,(select count(*) from TConditions tc where  tc.alertID = a.ID )as 'ConditionIsMustTrue' 
		
	from
		alerts a
		
		where
			(select count(*) from AlertConditions ac where  ac.AlertID = a.ID and ac.IsMust = 1 )=
			(select count(*) from TConditions tc where  tc.alertID = a.ID and tc.IsMust = 1)

	)

	insert into UserNotifications
	(
		UserID
		,IsRead
		,NotificationTypeID
		,RefID
		,Txt
		,AlertTimeStamp
	)
	select 
		u.Id
		,0
		,1
		,@IOID
		,ta.AlertMEssage
		,GetDate()
	from 
		TAlerts ta
		,AspNetUsers u
		,LinkUsersAlerts l

	where 
		ta.ID = l.AlertID
		and u.Id = l.UserID





end
GO
CREATE trigger TR_DeviceConnection on EndPointIOs for insert
as
begin
declare @dID bigint
declare @UTC_Diff int 

select  @dID= e.DeviceID
	from 
		[endpoints] e,EndPointIOs io
	where 
		io.EndPointID = e.ID
		and io.ID = (select id from INSERTED)

select @UTC_Diff = UTC_Diff 
	from Devices d
	where d.ID = @dID
	

update devices set LastConnectionTimeStamp = DATEADD(HOUR,@UTC_Diff,GETUTCDATE()) where id = @dID

end
GO
create trigger [dbo].[TR_IO_AlertOld] on [dbo].[EndPointIOs] for insert
as
begin
	-- Declare Variables :::: Start
	declare @IOID bigint
	declare @EndPointID bigint
	declare @IOTypeID bigint
	declare @EndpointTypeID bigint
	declare @EndpointType nvarchar(50)
	declare @Measurement nvarchar(50)
	declare @Value nvarchar(50)
	declare @ExecTimeStamp datetime
	declare @ThingID bigint
	-- Declare Variables :::: End

	-- Set Variables Values :::: Start
	select @IOID  = ID from inserted;
	select @EndPointID = EndPointID from inserted;
	select @IOTypeID = IOTypeID from inserted;
	select @EndpointTypeID = TypeID from [Endpoints] where ID = @EndPointID;
	select @EndpointType = et.Title from [Endpoints] e, EndPointTypes et  where e.TypeID = et.ID and e.ID = @EndPointID;
	select @Measurement = et.Measurement from [Endpoints] e, EndPointTypes et  where e.TypeID = et.ID and e.ID = @EndPointID;
	select @Value = Valu from inserted;
	select @ExecTimeStamp = ExecTimeStamp from inserted;
	select @ThingID = ThingID from inserted;

	-- Set Variables Values :::: End
	

	WITH notis AS 
	(
		select 
		a.Title as 'AlertTitle'
		,u.Id as 'UserID'
		,u.FullName as 'UserFullName'
		,@ThingID as 'ThingID'
		,@IOTypeID as 'EndpointTypeID'
		,@Value as 'Value'
		,replace(
			replace(
				replace(
					replace(
						replace(a.[Message]
						,N'[TimeStamp]',@ExecTimeStamp )
						,N'[Value]',@Value	)
						,N'[EndpointType]',@EndpointType)
						,N'[Measurement]',@Measurement)
						,N'[Thing]',t.Title
			 
			 ) as 'AlertMessage'
		,(select count (*) from AlertConditions sub where sub.AlertID = a.id) as 'ConditionsCount'
		from 
			Alerts a
			,AlertConditions ac
			,AlertConditionTypes act
			,LinkUsersAlerts lua
			,AspNetUsers u
			,Things t

		where
			--Tables Rel
			ac.AlertID = a.ID
			and ac.ConditionTypeID = act.ID
			and lua.AlertID = a.ID
			and lua.UserID = u.Id
			and ac.thingid = t.id

			--Params
			and a.IsActive = 1
			and ac.IOTypeID = @IOTypeID
			and ac.EndPointTypeID = @EndpointTypeID
			and ac.ThingID = @ThingID
			and a.StartTime <=  CONVERT(time(0),@ExecTimeStamp)
			and a.EndTime >= CONVERT(time(0),@ExecTimeStamp)
		
	)

	

	insert into UserNotifications
	(
		UserID
		,IsRead
		,NotificationTypeID
		,RefID
		,Txt
		,alertTimeStamp
	)
	select 
		UserID
		,0
		,1
		,@IOID
		--,AlertMessage
		,ConditionsCount
		,@ExecTimeStamp
	from notis

end
GO
DISABLE TRIGGER [dbo].[TR_IO_AlertOld]
    ON [dbo].[EndPointIOs];

