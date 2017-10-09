

CREATE procedure SetThingProperty
@ThingID bigint,
@ThingExtenstionID bigint
as
begin
	
	declare @IsList bit
	select @IsList = islist from ThingExtenstions where ID = @ThingExtenstionID

	if (@IsList = 1)
	begin
print 1
	end
	else
	begin
	print 0
	end
end

