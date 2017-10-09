

CREATE procedure GetLocationsWithWarnings
@ViewID bigint
as
begin
	
	select distinct l.ID from Locations l 
		inner join LinkLocationsLocationViews lv on l.ID = lv.LocationID
		inner join LinkThingsLocations lt on l.ID = lt.LocationID
		inner join [Endpoints] e on e.ThingID = lt.ThingID
		where lv.LocationViewID = @ViewID  
			and e.IsNumericOnly = 1 
			and (e.LastIONumericValue >= e.HighRange or  e.LastIONumericValue <= e.LowRange)

end
