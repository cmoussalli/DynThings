

select 
*

from
	endpoints e,
	things t,
	LinkThingsLocations tl,
	LinkLocationsLocationViews lv

where
	e.ThingID = t.ID
	and t.ID = tl.ThingID
	and tl.LocationID = lv.LocationID

	and 