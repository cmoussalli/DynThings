
CREATE procedure [dbo].[SubmitEndpointCommand]
@CommandID bigint
,@Value nvarchar(50)
,@ScheduleTimeStamp datetime = null


as
begin
	declare @EndPointID bigint
	declare @UTC_Diff int
	declare @ThingID bigint
	declare @ScheduleTimeStamp_UTC datetime
	declare @endpointtypeid bigint


	select 
		@EndPointID = e.ID
		,@UTC_Diff = d.UTC_Diff   
		,@ThingID = e.ThingID
	from [Endpoints] e,[Devices] d, [EndPointCommands] c
	where e.DeviceID = d.ID
		and c.EndPointID = e.ID
		and c.ID = @CommandID 

		select @endpointtypeid = TypeID from [Endpoints] where id = @EndPointID

	if (@ScheduleTimeStamp is null)
		begin
		set @ScheduleTimeStamp_UTC = GetUTCDate()
		set @ScheduleTimeStamp = DATEADD(HOUR, @UTC_Diff,GETUTCDATE())
		end
	else
		begin
		set @ScheduleTimeStamp_UTC = DATEADD(HOUR,- @UTC_Diff,@ScheduleTimeStamp)

		end

	insert into EndPointIOs (EndPointID,IOTypeID,Valu,ThingID
	,[TimeStamp]
	,[TimeStamp_UTC]
	,ScheduleTimeStamp
	,ScheduleTimeStamp_UTC
	,endpointtypeid
	)
	(select @EndPointID as'EndPointID',2 as 'IOTypeID',@Value as 'Valu',@ThingID as 'ThingID'
	,DATEADD(HOUR,@UTC_Diff,GETUTCDATE()) as 'TimeStamp'
	,GETUTCDATE() as 'TimeStampUTC'
	,@ScheduleTimeStamp  as '@ScheduleTimeStamp'
	,@ScheduleTimeStamp_UTC
	,@endpointtypeid
	)
end
