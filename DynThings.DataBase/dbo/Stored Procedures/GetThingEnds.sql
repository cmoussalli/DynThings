

CREATE procedure [dbo].[GetThingEnds]
@LocationID bigint = null,
@ThingID bigint = null ,
@ThingCategoryID bigint = null,
@EndPointID bigint = null,
@EndPointTypeID bigint = null



as
begin
	

select loc.ID as 'LocationID'
	,loc.Title as 'LocationTitle'

	,t.ID as 'ThingID'
	,t.Title as 'ThingTitle'
	,tC.ID as 'ThingCategoryID'
	,tC.Title as 'ThingCategoryTitle'



	--,e.ID as 'EndPointID'
	--,e.Title as 'EndPointTitle'
	,eT.ID as 'EndPointTypeID'
	,eT.Title as 'EndPointTypeTitle'
	,eT.measurement as 'EndPointMeasurement'
	,et.IconID
	,d.ID as 'DeviceID'
	,d.Title as 'DeviceTitle'
	--,(if ((DATEADD(HOUR,d.UTC_Diff,d.LastConnectionTimeStamp) > GETUTCDATE()),'Connected','NotConnected'
	,(
		CAST(
             CASE 
                  WHEN DATEADD(SECOND,d.IsConnectedDelay, d.LastConnectionTimeStamp) > DATEADD(HOUR,d.UTC_Diff, GETUTCDATE())
                     THEN 1 
                  ELSE 0 
             END AS bit)
	) as 'IsConnected'
	--,(select top(1) Valu from EndPointIOs i where t.ID = i.ThingID and i.IOTypeID = 1 order by ExecTimeStamp desc) as 'LastSubmitValue'
	,max(ios.ID) as 'LastIOID'
	,(select top(1) valu from EndPointIOs where id = MAX(ios.ID) and IOTypeID = 1 order by id desc) as 'LastIOValue'
	,(select top(1) ExecTimeStamp from EndPointIOs where id = MAX(ios.ID) and IOTypeID = 1 order by id desc) as 'LastIOTimeStamp'

from 
	[EndPointIOs] ios
	,[endpoints] e
	,[EndPointTypes] eT
	,[Things] t
	,[ThingCategorys] tC
	,[LinkThingsLocations] l
	,[Locations] loc
	,[Devices] d
 where 
	ios.EndPointID = e.ID
	and e.TypeID = eT.ID
	--and e.DeviceID = d.ID
	and t.ID = l.ThingID
	and t.ID = ios.ThingID
	and l.LocationID = loc.ID
	and t.CategoryID = tC.ID
	and d.ID = e.DeviceID

	and (@LocationID IS NULL or l.LocationID like @LocationID)
	and (@ThingID IS NULL or t.ID like @ThingID)
	and (@ThingCategoryID IS NULL or t.CategoryID like @ThingCategoryID)
	--and (@DeviceID IS NULL or d.ID like @DeviceID)
	and (@EndPointID IS NULL or e.ID like @EndPointID)
	and (@EndPointTypeID IS NULL or e.TypeID like @EndPointTypeID)

	and ios.IOTypeID = 1

group by loc.ID
	,loc.Title
	,t.ID 
	,t.Title
	,tC.ID
	,tC.Title 
	--,e.ID 
	--,e.Title 
	,eT.ID 
	,eT.Title 
	,eT.measurement
	,et.IconID
	,d.id
	,d.Title
	,d.LastConnectionTimeStamp
	,d.IsConnectedDelay
	,d.UTC_Diff
end