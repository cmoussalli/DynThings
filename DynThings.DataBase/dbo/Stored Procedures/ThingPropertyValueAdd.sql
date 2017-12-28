

CREATE procedure ThingPropertyValueAdd
@ThingID bigint,
@ThingExtensionID bigint,
@Value NVarchar(128)
as
begin
	declare @IsList bit
	select @IsList = islist from ThingExtensions where ID = @ThingExtensionID
	if (@IsList = 1)
	begin
		insert into ThingExtensionValues (ThingExtensionID,ThingID,Valu) values (@ThingExtensionID,@ThingID,@Value)
		print N'Property value has been added'
	end
	else
	begin
		delete from ThingExtensionValues where ThingExtensionID = @ThingExtensionID and ThingID = @ThingID
		insert into ThingExtensionValues (ThingExtensionID,ThingID,Valu) values (@ThingExtensionID,@ThingID,@Value)
	print N'Property value has been updated'
	end
end

