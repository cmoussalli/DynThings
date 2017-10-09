
CREATE procedure [dbo].[SubmitEndpointCommandExecuted]
@CommandID bigint
,@EndPointKeyPass uniqueidentifier
,@ExecTimeStamp datetime = null


as
begin
	declare @EndPointID bigint
	declare @EndPointKeyPass2 uniqueidentifier
	declare @UTC_Diff int
	declare @ExecTimeStamp_UTC datetime



	select 
		@EndPointID = e.ID
		,@EndPointKeyPass2 = e.KeyPass
		,@UTC_Diff = d.UTC_Diff   
	from [Endpoints] e,[Devices] d, [EndPointIOs] ios
	where e.DeviceID = d.ID
		and ios.EndPointID = e.ID
		and ios.ID = @CommandID 

		if (@EndPointKeyPass != @EndPointKeyPass2)
		begin
			raiserror('Wrong keypass',16,1)
		end

	if (@ExecTimeStamp is null)
	begin
		set @ExecTimeStamp_UTC = GetUTCDate()
		set @ExecTimeStamp = DATEADD(HOUR, @UTC_Diff,GETUTCDATE())

	end
	else
	begin
		set @ExecTimeStamp_UTC = DATEADD(HOUR,- @UTC_Diff,@ExecTimeStamp)
	end


		update EndPointIOs set ExecTimeStamp = @ExecTimeStamp , ExecTimeStamp_UTC = @ExecTimeStamp_UTC where id = @CommandID


end


