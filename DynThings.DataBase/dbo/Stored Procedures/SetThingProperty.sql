

CREATE procedure SetThingProperty
@ThingID bigint,
@ThingExtensionID bigint
as
begin
	
	declare @IsList bit
	select @IsList = islist from ThingExtensions where ID = @ThingExtensionID

	if (@IsList = 1)
	begin
print 1
	end
	else
	begin
	print 0
	end
end

