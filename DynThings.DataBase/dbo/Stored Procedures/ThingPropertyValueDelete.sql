CREATE procedure [dbo].[ThingPropertyValueDelete]
@ValueID bigint
as
begin
	
		delete from ThingExtensionValues where ID = @ValueID
	
end
