


CREATE procedure [dbo].[Rpt_ThingEnd_IOs_Minutes] 
 @ThingID bigint,
 @TypeID bigint
 as
 begin
 SET NOCOUNT ON

	declare @EPTimeZone int 
	select @EPTimeZone =  4
 declare @StartTime datetime
 set @StartTime = dateadd(HOUR,@EPTimeZone,GETUTCDATE() )

 select ID,Title,'Min' as 'Fx',

	(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-1,@StartTime)  and DATEADD(minute,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-2,@StartTime)  and DATEADD(minute,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-3,@StartTime)  and DATEADD(minute,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-4,@StartTime)  and DATEADD(minute,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-5,@StartTime)  and DATEADD(minute,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-6,@StartTime)  and DATEADD(minute,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-7,@StartTime)  and DATEADD(minute,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-8,@StartTime)  and DATEADD(minute,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-9,@StartTime)  and DATEADD(minute,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-10,@StartTime)  and DATEADD(minute,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-11,@StartTime)  and DATEADD(minute,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-12,@StartTime)  and DATEADD(minute,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-13,@StartTime)  and DATEADD(minute,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-14,@StartTime)  and DATEADD(minute,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-15,@StartTime)  and DATEADD(minute,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-16,@StartTime)  and DATEADD(minute,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-17,@StartTime)  and DATEADD(minute,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-18,@StartTime)  and DATEADD(minute,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-19,@StartTime)  and DATEADD(minute,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-20,@StartTime)  and DATEADD(minute,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-21,@StartTime)  and DATEADD(minute,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-22,@StartTime)  and DATEADD(minute,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-23,@StartTime)  and DATEADD(minute,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-24,@StartTime)  and DATEADD(minute,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24',

	(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-25,@StartTime)  and DATEADD(minute,-24,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '25',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-26,@StartTime)  and DATEADD(minute,-25,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '26',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-27,@StartTime)  and DATEADD(minute,-26,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '27',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-28,@StartTime)  and DATEADD(minute,-27,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '28',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-29,@StartTime)  and DATEADD(minute,-28,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '29',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-30,@StartTime)  and DATEADD(minute,-29,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '30',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-31,@StartTime)  and DATEADD(minute,-30,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '31',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-32,@StartTime)  and DATEADD(minute,-31,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '32',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-33,@StartTime)  and DATEADD(minute,-32,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '33',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-34,@StartTime)  and DATEADD(minute,-33,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '34',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-35,@StartTime)  and DATEADD(minute,-34,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '35',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-36,@StartTime)  and DATEADD(minute,-35,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '36',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-37,@StartTime)  and DATEADD(minute,-36,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '37',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-38,@StartTime)  and DATEADD(minute,-37,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '38',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-39,@StartTime)  and DATEADD(minute,-38,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '39',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-40,@StartTime)  and DATEADD(minute,-39,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '40',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-41,@StartTime)  and DATEADD(minute,-40,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '41',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-42,@StartTime)  and DATEADD(minute,-41,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '42',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-43,@StartTime)  and DATEADD(minute,-42,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '43',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-44,@StartTime)  and DATEADD(minute,-43,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '44',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-45,@StartTime)  and DATEADD(minute,-44,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '45',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-46,@StartTime)  and DATEADD(minute,-45,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '46',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-47,@StartTime)  and DATEADD(minute,-46,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '47',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-48,@StartTime)  and DATEADD(minute,-47,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '48',

	(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-49,@StartTime)  and DATEADD(minute,-48,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '49',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-50,@StartTime)  and DATEADD(minute,-49,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '50',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-51,@StartTime)  and DATEADD(minute,-50,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '51',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-52,@StartTime)  and DATEADD(minute,-51,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '52',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-53,@StartTime)  and DATEADD(minute,-52,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '53',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-54,@StartTime)  and DATEADD(minute,-53,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '54',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-55,@StartTime)  and DATEADD(minute,-54,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '55',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-56,@StartTime)  and DATEADD(minute,-55,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '56',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-57,@StartTime)  and DATEADD(minute,-56,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '57',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-58,@StartTime)  and DATEADD(minute,-57,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '58',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-59,@StartTime)  and DATEADD(minute,-58,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '59',

(select min(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-60,@StartTime)  and DATEADD(minute,-59,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '60'
	
from 
	Things t
where 
	t.ID = @ThingID

	union all (

	 select ID,Title,'Max' as 'Fx',

	(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-1,@StartTime)  and DATEADD(minute,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-2,@StartTime)  and DATEADD(minute,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-3,@StartTime)  and DATEADD(minute,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-4,@StartTime)  and DATEADD(minute,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-5,@StartTime)  and DATEADD(minute,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-6,@StartTime)  and DATEADD(minute,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-7,@StartTime)  and DATEADD(minute,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-8,@StartTime)  and DATEADD(minute,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-9,@StartTime)  and DATEADD(minute,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-10,@StartTime)  and DATEADD(minute,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-11,@StartTime)  and DATEADD(minute,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-12,@StartTime)  and DATEADD(minute,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-13,@StartTime)  and DATEADD(minute,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-14,@StartTime)  and DATEADD(minute,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-15,@StartTime)  and DATEADD(minute,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-16,@StartTime)  and DATEADD(minute,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-17,@StartTime)  and DATEADD(minute,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-18,@StartTime)  and DATEADD(minute,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-19,@StartTime)  and DATEADD(minute,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-20,@StartTime)  and DATEADD(minute,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-21,@StartTime)  and DATEADD(minute,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-22,@StartTime)  and DATEADD(minute,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-23,@StartTime)  and DATEADD(minute,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-24,@StartTime)  and DATEADD(minute,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24',

	(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-25,@StartTime)  and DATEADD(minute,-24,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '25',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-26,@StartTime)  and DATEADD(minute,-25,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '26',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-27,@StartTime)  and DATEADD(minute,-26,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '27',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-28,@StartTime)  and DATEADD(minute,-27,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '28',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-29,@StartTime)  and DATEADD(minute,-28,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '29',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-30,@StartTime)  and DATEADD(minute,-29,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '30',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-31,@StartTime)  and DATEADD(minute,-30,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '31',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-32,@StartTime)  and DATEADD(minute,-31,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '32',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-33,@StartTime)  and DATEADD(minute,-32,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '33',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-34,@StartTime)  and DATEADD(minute,-33,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '34',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-35,@StartTime)  and DATEADD(minute,-34,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '35',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-36,@StartTime)  and DATEADD(minute,-35,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '36',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-37,@StartTime)  and DATEADD(minute,-36,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '37',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-38,@StartTime)  and DATEADD(minute,-37,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '38',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-39,@StartTime)  and DATEADD(minute,-38,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '39',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-40,@StartTime)  and DATEADD(minute,-39,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '40',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-41,@StartTime)  and DATEADD(minute,-40,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '41',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-42,@StartTime)  and DATEADD(minute,-41,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '42',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-43,@StartTime)  and DATEADD(minute,-42,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '43',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-44,@StartTime)  and DATEADD(minute,-43,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '44',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-45,@StartTime)  and DATEADD(minute,-44,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '45',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-46,@StartTime)  and DATEADD(minute,-45,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '46',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-47,@StartTime)  and DATEADD(minute,-46,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '47',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-48,@StartTime)  and DATEADD(minute,-47,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '48',

	(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-49,@StartTime)  and DATEADD(minute,-48,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '49',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-50,@StartTime)  and DATEADD(minute,-49,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '50',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-51,@StartTime)  and DATEADD(minute,-50,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '51',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-52,@StartTime)  and DATEADD(minute,-51,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '52',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-53,@StartTime)  and DATEADD(minute,-52,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '53',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-54,@StartTime)  and DATEADD(minute,-53,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '54',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-55,@StartTime)  and DATEADD(minute,-54,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '55',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-56,@StartTime)  and DATEADD(minute,-55,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '56',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-57,@StartTime)  and DATEADD(minute,-56,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '57',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-58,@StartTime)  and DATEADD(minute,-57,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '58',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-59,@StartTime)  and DATEADD(minute,-58,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '59',

(select max(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-60,@StartTime)  and DATEADD(minute,-59,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '60'
	
from 
	Things t
where 
	t.ID = @ThingID

	)union all (

	 select ID,Title,'avg' as 'Fx',

	(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-1,@StartTime)  and DATEADD(minute,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-2,@StartTime)  and DATEADD(minute,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-3,@StartTime)  and DATEADD(minute,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-4,@StartTime)  and DATEADD(minute,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-5,@StartTime)  and DATEADD(minute,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-6,@StartTime)  and DATEADD(minute,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-7,@StartTime)  and DATEADD(minute,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-8,@StartTime)  and DATEADD(minute,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-9,@StartTime)  and DATEADD(minute,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-10,@StartTime)  and DATEADD(minute,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-11,@StartTime)  and DATEADD(minute,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-12,@StartTime)  and DATEADD(minute,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-13,@StartTime)  and DATEADD(minute,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-14,@StartTime)  and DATEADD(minute,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-15,@StartTime)  and DATEADD(minute,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-16,@StartTime)  and DATEADD(minute,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-17,@StartTime)  and DATEADD(minute,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-18,@StartTime)  and DATEADD(minute,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-19,@StartTime)  and DATEADD(minute,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-20,@StartTime)  and DATEADD(minute,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-21,@StartTime)  and DATEADD(minute,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-22,@StartTime)  and DATEADD(minute,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-23,@StartTime)  and DATEADD(minute,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-24,@StartTime)  and DATEADD(minute,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24',

	(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-25,@StartTime)  and DATEADD(minute,-24,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '25',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-26,@StartTime)  and DATEADD(minute,-25,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '26',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-27,@StartTime)  and DATEADD(minute,-26,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '27',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-28,@StartTime)  and DATEADD(minute,-27,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '28',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-29,@StartTime)  and DATEADD(minute,-28,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '29',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-30,@StartTime)  and DATEADD(minute,-29,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '30',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-31,@StartTime)  and DATEADD(minute,-30,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '31',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-32,@StartTime)  and DATEADD(minute,-31,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '32',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-33,@StartTime)  and DATEADD(minute,-32,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '33',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-34,@StartTime)  and DATEADD(minute,-33,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '34',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-35,@StartTime)  and DATEADD(minute,-34,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '35',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-36,@StartTime)  and DATEADD(minute,-35,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '36',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-37,@StartTime)  and DATEADD(minute,-36,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '37',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-38,@StartTime)  and DATEADD(minute,-37,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '38',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-39,@StartTime)  and DATEADD(minute,-38,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '39',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-40,@StartTime)  and DATEADD(minute,-39,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '40',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-41,@StartTime)  and DATEADD(minute,-40,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '41',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-42,@StartTime)  and DATEADD(minute,-41,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '42',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-43,@StartTime)  and DATEADD(minute,-42,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '43',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-44,@StartTime)  and DATEADD(minute,-43,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '44',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-45,@StartTime)  and DATEADD(minute,-44,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '45',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-46,@StartTime)  and DATEADD(minute,-45,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '46',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-47,@StartTime)  and DATEADD(minute,-46,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '47',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-48,@StartTime)  and DATEADD(minute,-47,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '48',

	(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-49,@StartTime)  and DATEADD(minute,-48,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '49',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-50,@StartTime)  and DATEADD(minute,-49,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '50',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-51,@StartTime)  and DATEADD(minute,-50,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '51',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-52,@StartTime)  and DATEADD(minute,-51,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '52',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-53,@StartTime)  and DATEADD(minute,-52,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '53',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-54,@StartTime)  and DATEADD(minute,-53,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '54',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-55,@StartTime)  and DATEADD(minute,-54,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '55',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-56,@StartTime)  and DATEADD(minute,-55,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '56',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-57,@StartTime)  and DATEADD(minute,-56,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '57',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-58,@StartTime)  and DATEADD(minute,-57,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '58',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-59,@StartTime)  and DATEADD(minute,-58,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '59',

(select avg(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-60,@StartTime)  and DATEADD(minute,-59,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '60'
	
from 
	Things t
where 
	t.ID = @ThingID

	) union all (

	 select ID,Title,'count' as 'Fx',

	(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-1,@StartTime)  and DATEADD(minute,-0,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '1',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-2,@StartTime)  and DATEADD(minute,-1,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '2',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-3,@StartTime)  and DATEADD(minute,-2,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '3',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-4,@StartTime)  and DATEADD(minute,-3,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '4',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-5,@StartTime)  and DATEADD(minute,-4,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '5',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-6,@StartTime)  and DATEADD(minute,-5,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '6',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-7,@StartTime)  and DATEADD(minute,-6,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '7',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-8,@StartTime)  and DATEADD(minute,-7,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '8',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-9,@StartTime)  and DATEADD(minute,-8,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '9',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-10,@StartTime)  and DATEADD(minute,-9,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '10',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-11,@StartTime)  and DATEADD(minute,-10,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '11',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-12,@StartTime)  and DATEADD(minute,-11,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '12',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-13,@StartTime)  and DATEADD(minute,-12,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '13',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-14,@StartTime)  and DATEADD(minute,-13,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '14',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-15,@StartTime)  and DATEADD(minute,-14,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '15',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-16,@StartTime)  and DATEADD(minute,-15,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '16',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-17,@StartTime)  and DATEADD(minute,-16,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '17',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-18,@StartTime)  and DATEADD(minute,-17,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '18',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-19,@StartTime)  and DATEADD(minute,-18,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '19',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-20,@StartTime)  and DATEADD(minute,-19,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '20',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-21,@StartTime)  and DATEADD(minute,-20,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '21',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-22,@StartTime)  and DATEADD(minute,-21,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '22',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-23,@StartTime)  and DATEADD(minute,-22,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '23',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-24,@StartTime)  and DATEADD(minute,-23,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '24',

	(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-25,@StartTime)  and DATEADD(minute,-24,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '25',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-26,@StartTime)  and DATEADD(minute,-25,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '26',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-27,@StartTime)  and DATEADD(minute,-26,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '27',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-28,@StartTime)  and DATEADD(minute,-27,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '28',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-29,@StartTime)  and DATEADD(minute,-28,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '29',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-30,@StartTime)  and DATEADD(minute,-29,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '30',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-31,@StartTime)  and DATEADD(minute,-30,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '31',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-32,@StartTime)  and DATEADD(minute,-31,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '32',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-33,@StartTime)  and DATEADD(minute,-32,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '33',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-34,@StartTime)  and DATEADD(minute,-33,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '34',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-35,@StartTime)  and DATEADD(minute,-34,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '35',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-36,@StartTime)  and DATEADD(minute,-35,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '36',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-37,@StartTime)  and DATEADD(minute,-36,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '37',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-38,@StartTime)  and DATEADD(minute,-37,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '38',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-39,@StartTime)  and DATEADD(minute,-38,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '39',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-40,@StartTime)  and DATEADD(minute,-39,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '40',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-41,@StartTime)  and DATEADD(minute,-40,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '41',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-42,@StartTime)  and DATEADD(minute,-41,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '42',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-43,@StartTime)  and DATEADD(minute,-42,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '43',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-44,@StartTime)  and DATEADD(minute,-43,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '44',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-45,@StartTime)  and DATEADD(minute,-44,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '45',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-46,@StartTime)  and DATEADD(minute,-45,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '46',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-47,@StartTime)  and DATEADD(minute,-46,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '47',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-48,@StartTime)  and DATEADD(minute,-47,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '48',

	(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-49,@StartTime)  and DATEADD(minute,-48,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '49',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-50,@StartTime)  and DATEADD(minute,-49,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '50',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-51,@StartTime)  and DATEADD(minute,-50,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '51',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-52,@StartTime)  and DATEADD(minute,-51,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '52',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-53,@StartTime)  and DATEADD(minute,-52,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '53',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-54,@StartTime)  and DATEADD(minute,-53,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '54',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-55,@StartTime)  and DATEADD(minute,-54,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '55',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-56,@StartTime)  and DATEADD(minute,-55,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '56',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-57,@StartTime)  and DATEADD(minute,-56,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '57',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-58,@StartTime)  and DATEADD(minute,-57,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '58',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-59,@StartTime)  and DATEADD(minute,-58,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '59',

(select count(CAST(CAST(i.valu AS float) AS INT))  from EndPointIOs i, [Endpoints] e 
	where i.EndPointID = e.ID and i.[ExecTimeStamp] between DATEADD(minute,-60,@StartTime)  and DATEADD(minute,-59,@StartTime) and i.ThingID = @ThingID and e.TypeID = @TypeID and i.IOTypeID = 1)as '60'
	
from 
	Things t
where 
	t.ID = @ThingID

	)



end