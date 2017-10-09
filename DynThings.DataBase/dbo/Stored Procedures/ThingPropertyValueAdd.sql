

CREATE procedure ThingPropertyValueAdd
@ThingID bigint,
@ThingExtenstionID bigint,
@Value NVarchar(128)
as
begin
	declare @IsList bit
	select @IsList = islist from ThingExtenstions where ID = @ThingExtenstionID
	if (@IsList = 1)
	begin
		insert into ThingExtenstionValues (ThingExtenstionID,ThingID,Valu) values (@ThingExtenstionID,@ThingID,@Value)
		print N'Property value has been added'
	end
	else
	begin
		delete from ThingExtenstionValues where ThingExtenstionID = @ThingExtenstionID and ThingID = @ThingID
		insert into ThingExtenstionValues (ThingExtenstionID,ThingID,Valu) values (@ThingExtenstionID,@ThingID,@Value)
	print N'Property value has been updated'
	end
end

