CREATE procedure [dbo].[Rpt_EndPoint_IOs_Days] 
 @EPID bigint
 as
 begin
 SET NOCOUNT ON
 select ID,Title,'Min' as 'Fx',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00'  and GetDate() and EndPointID = @EPID and [TypeID] = 1)as '1',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '2',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '3',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '4',
	
			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '5',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '6',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '7',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '8',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '9',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '10',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '11',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '12',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '13',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '14',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '15',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '16',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '17',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '18',

			(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '19',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '20',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '21',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '22',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '23',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '24',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '25',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '26',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '27',


	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '28',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '29',


	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-30,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '30'

from [Endpoints] e where e.ID = @EPID

union all

(
select ID,Title,'max' as 'Fx',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00'  and GetDate() and EndPointID = @EPID and [TypeID] = 1)as '1',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '2',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '3',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '4',
	
			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '5',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '6',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '7',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '8',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '9',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '10',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '11',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '12',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '13',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '14',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '15',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '16',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '17',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '18',

			(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '19',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '20',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '21',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '22',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '23',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '24',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '25',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '26',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '27',


	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '28',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '29',


	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-30,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '30'

from [Endpoints] e where e.ID = @EPID

)
union all
(
select ID,Title,'avg' as 'Fx',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00'  and GetDate() and EndPointID = @EPID and [TypeID] = 1)as '1',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-1,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '2',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-2,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '3',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-3,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '4',
	
			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-4,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '5',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-5,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '6',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-6,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '7',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-7,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '8',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-8,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '9',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-9,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '10',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-10,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '11',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-11,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '12',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-12,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '13',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-13,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '14',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-14,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '15',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-15,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '16',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-16,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '17',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-17,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '18',

			(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-18,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '19',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-19,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '20',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-20,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '21',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-21,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '22',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-22,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '23',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-23,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '24',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-24,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '25',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-25,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '26',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-26,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '27',


	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-27,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '28',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-28,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '29',


	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [ExecTimeStamp] between CONVERT(varchar(10),DATEADD(day,-30,GetDate()), 120) + ' 00:00:00' and CONVERT(varchar(10),DATEADD(day,-29,GetDate()), 120) + ' 00:00:00' and EndPointID = @EPID and [TypeID] = 1)as '30'

from [Endpoints] e where e.ID = @EPID

)
end

