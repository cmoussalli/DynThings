CREATE procedure [dbo].[Rpt_EndPoint_IOs_Months] 
 @EPID bigint,
 @Year nvarchar(4)
 as
 begin
 SET NOCOUNT ON
 select ID,Title,'Min' as 'Fx',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 1 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '1',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 2 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '2',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 3 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '3',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 4 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '4',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 5 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '5',

	(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 6 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '6',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 7 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '7',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 8 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '8',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 9 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '9',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 10 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '10',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 11 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '11',

		(select min(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 12 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '12'

from [Endpoints] e where e.ID = @EPID

union all(

  select ID,Title,'max' as 'Fx',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 1 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '1',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 2 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '2',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 3 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '3',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 4 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '4',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 5 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '5',

	(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 6 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '6',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 7 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '7',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 8 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '8',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 9 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '9',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 10 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '10',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 11 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '11',

		(select max(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 12 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '12'

from [Endpoints] e where e.ID = @EPID

)union all(

  select ID,Title,'avg' as 'Fx',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 1 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '1',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 2 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '2',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 3 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '3',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 4 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '4',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 5 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '5',

	(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 6 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '6',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 7 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '7',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 8 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '8',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 9 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '9',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 10 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '10',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 11 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '11',

		(select avg(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where MONTH(ExecTimeStamp) = 12 and Year(ExecTimeStamp) = @Year and EndPointID = @EPID)as '12'

from [Endpoints] e where e.ID = @EPID

)
end