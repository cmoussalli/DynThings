CREATE procedure [dbo].[ThingPropertyValueDelete]
@ValueID bigint
as
begin
	
		delete from ThingExtenstionValues where ID = @ValueID
	
end
