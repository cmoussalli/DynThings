CREATE procedure [dbo].[ThingPropertyValueEdit]
@ValueID bigint,
@NewValue NVarchar(128)
as
begin
	
	declare @ThingExtenstionID bigint
	declare @ThingID nvarchar(128)

	select @ThingID =  ThingID from ThingExtenstionValues where id = @ValueID
	select @ThingExtenstionID =  ThingExtenstionID from ThingExtenstionValues where id = @ValueID

	delete from ThingExtenstionValues where ID = @ValueID
	insert into ThingExtenstionValues (ThingExtenstionID,ThingID,Valu) values (@ThingExtenstionID,@ThingID,@NewValue)
	
end