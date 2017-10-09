
create procedure ThingPropertyValueDeleteAll
@ThingID bigint
as
begin

	delete from ThingExtenstionValues where ThingID = @ThingID 


end