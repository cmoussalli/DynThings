
create procedure ThingPropertyValueDeleteAll
@ThingID bigint
as
begin

	delete from ThingExtensionValues where ThingID = @ThingID 


end