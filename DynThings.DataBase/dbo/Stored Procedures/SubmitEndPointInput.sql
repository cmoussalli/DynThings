
CREATE procedure [dbo].[SubmitEndPointInput]
@PassKey uniqueIdentifier
,@Value nvarchar(50)
,@ExecTimeStamp datetime


as
begin
	declare @EndPointID BIGINT
    declare @EndPointTypeID bigint
	declare @UTC_Diff int
	declare @ThingID bigint
	declare @ExecTimeStamp_UTC datetime



	select 
		@EndPointID = e.ID
		,@UTC_Diff = d.UTC_Diff   
		,@ThingID = e.ThingID
		,@EndPointTypeID = e.TypeID
	from [Endpoints] e,[Devices] d
	where e.DeviceID = d.ID
		and e.[KeyPass] = @PassKey 


	if (@ExecTimeStamp is null)
		begin
		set @ExecTimeStamp_UTC = GetUTCDate()
		set @ExecTimeStamp = DATEADD(HOUR, @UTC_Diff,GETUTCDATE())
		end
	else
		begin
		set @ExecTimeStamp_UTC = DATEADD(HOUR,- @UTC_Diff,@ExecTimeStamp)

		end

	insert into EndPointIOs (EndPointID,IOTypeID,EndPointTypeID,Valu,ThingID
	,[TimeStamp]
	,[TimeStamp_UTC]
	,ExecTimeStamp
	,ExecTimeStamp_UTC
	
	)
	(select @EndPointID as'EndPointID',1 as 'IOTypeID',@EndPointTypeID,@Value as 'Valu',@ThingID as 'ThingID'
	,DATEADD(HOUR,@UTC_Diff,GETUTCDATE()) as 'TimeStamp'
	,GETUTCDATE() as 'TimeStampUTC'
	,@ExecTimeStamp  as 'ExecTimeStamp'
	,@ExecTimeStamp_UTC
	)
end