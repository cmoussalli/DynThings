
create procedure [dbo].[AttachEndPointTypeToThing]
@EndPointTypeID bigint
,@ThingID bigint
as
begin
	if not exists (select * from ThingEnds where EndPointTypeID = @EndPointTypeID and ThingID = @ThingID)
	begin
	insert into ThingEnds (ThingID,EndPointTypeID)
	values(@ThingID,@EndPointTypeID)

	end
	
end
