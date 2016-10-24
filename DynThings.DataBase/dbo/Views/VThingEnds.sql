

CREATE view VThingEnds
as
(
	select 
		e.ThingID as 'ThingID'
		,ios.IOTypeID as 'IOTypeID'
		,e.TypeID as 'EndpointTypeID'
		,(select top(1) valu  from EndPointIOs subIos ,[Endpoints] subEnds
			where 
				subEnds.ID = subIos.EndPointID
				and subIos.ThingID = e.ThingID
				and subIos.IOTypeID = ios.iotypeid
				and subends.TypeID = e.typeid
			order by subIos.ID desc
		) as 'LastValue' 
				
	from 
		[Endpoints] e
		,EndPointIOs ios

	where e.ID = ios.EndPointID

	group by 
		e.ThingID 
		,ios.IOTypeID 		
		,e.TypeID
)