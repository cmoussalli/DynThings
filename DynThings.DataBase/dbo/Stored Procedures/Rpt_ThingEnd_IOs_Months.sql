


CREATE procedure [dbo].[Rpt_ThingEnd_IOs_Months] 
 @ThingID bigint,
 @TypeID bigint,
 @Year bigint
 as
 begin
 SET NOCOUNT ON

	declare @EPTimeZone int 
	select @EPTimeZone =  4
 declare @StartTime datetime
 set @StartTime = dateadd(HOUR,@EPTimeZone,GETUTCDATE() )

 select ID,Title,'Min' as 'Fx',

	(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 1 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 2 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 3 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 4 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 5 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 6 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 7 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 8 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 9 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 10 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 11 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 12 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12'


from 
	Things t
where 
	t.ID = @ThingID

	union all (

	 select ID,Title,'Max' as 'Fx',

		(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 1 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 2 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 3 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 4 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 5 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 6 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 7 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 8 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 9 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 10 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 11 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 12 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12'


from 
	Things t
where 
	t.ID = @ThingID

	)union all (

	 select ID,Title,'avg' as 'Fx',

		(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 1 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 2 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 3 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 4 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 5 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 6 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 7 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 8 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 9 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 10 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 11 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and MONTH(i.ExecTimeStamp) = 12 and Year(i.ExecTimeStamp) = @Year and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12'


from 
	Things t
where 
	t.ID = @ThingID

	)



end