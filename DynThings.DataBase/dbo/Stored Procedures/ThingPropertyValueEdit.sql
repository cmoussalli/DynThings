CREATE procedure [dbo].[ThingPropertyValueEdit]
@ValueID bigint,
@NewValue NVarchar(128)
as
begin
	
	declare @ThingExtensionID bigint
	declare @ThingID nvarchar(128)

	select @ThingID =  ThingID from ThingExtensionValues where id = @ValueID
	select @ThingExtensionID =  ThingExtensionID from ThingExtensionValues where id = @ValueID

	delete from ThingExtensionValues where ID = @ValueID
	insert into ThingExtensionValues (ThingExtensionID,ThingID,Valu) values (@ThingExtensionID,@ThingID,@NewValue)
	
end