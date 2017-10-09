
CREATE procedure [dbo].[Rpt_CpH_Last24Hours] 
 as
 begin
 SET NOCOUNT ON


 select '1' as 'ObjectCode', 
	'EndPoints' as 'Object',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-1,GETUTCDATE())  and GETUTCDATE())as '1',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-2,GETUTCDATE())  and DATEADD(HOUR,-1,GETUTCDATE()))as '2',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-3,GETUTCDATE())  and DATEADD(HOUR,-2,GETUTCDATE()))as '3',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-4,GETUTCDATE())  and DATEADD(HOUR,-3,GETUTCDATE()))as '4',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-5,GETUTCDATE())  and DATEADD(HOUR,-4,GETUTCDATE()))as '5',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-6,GETUTCDATE())  and DATEADD(HOUR,-5,GETUTCDATE()))as '6',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-7,GETUTCDATE())  and DATEADD(HOUR,-6,GETUTCDATE()))as '7',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-8,GETUTCDATE())  and DATEADD(HOUR,-7,GETUTCDATE()))as '8',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-9,GETUTCDATE())  and DATEADD(HOUR,-8,GETUTCDATE()))as '9',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-10,GETUTCDATE())  and DATEADD(HOUR,-9,GETUTCDATE()))as '10',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-11,GETUTCDATE())  and DATEADD(HOUR,-10,GETUTCDATE()))as '11',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-12,GETUTCDATE())  and DATEADD(HOUR,-11,GETUTCDATE()))as '12',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-13,GETUTCDATE())  and DATEADD(HOUR,-12,GETUTCDATE()))as '13',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-14,GETUTCDATE())  and DATEADD(HOUR,-13,GETUTCDATE()))as '14',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-15,GETUTCDATE())  and DATEADD(HOUR,-14,GETUTCDATE()))as '15',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-16,GETUTCDATE())  and DATEADD(HOUR,-15,GETUTCDATE()))as '16',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-17,GETUTCDATE())  and DATEADD(HOUR,-16,GETUTCDATE()))as '17',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-18,GETUTCDATE())  and DATEADD(HOUR,-17,GETUTCDATE()))as '18',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-19,GETUTCDATE())  and DATEADD(HOUR,-18,GETUTCDATE()))as '19',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-20,GETUTCDATE())  and DATEADD(HOUR,-19,GETUTCDATE()))as '20',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-21,GETUTCDATE())  and DATEADD(HOUR,-20,GETUTCDATE()))as '21',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-22,GETUTCDATE())  and DATEADD(HOUR,-21,GETUTCDATE()))as '22',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-23,GETUTCDATE())  and DATEADD(HOUR,-22,GETUTCDATE()))as '23',

	(select count(CAST(CAST(valu AS float) AS INT))  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-24,GETUTCDATE())  and DATEADD(HOUR,-23,GETUTCDATE()))as '24'

	

union all
(
 select '2' as 'ObjectCode', 
	'Devices' as 'Object',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-1,GETUTCDATE())  and GETUTCDATE())as '1',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-2,GETUTCDATE())  and DATEADD(HOUR,-1,GETUTCDATE()))as '2',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-3,GETUTCDATE())  and DATEADD(HOUR,-2,GETUTCDATE()))as '3',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-4,GETUTCDATE())  and DATEADD(HOUR,-3,GETUTCDATE()))as '4',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-5,GETUTCDATE())  and DATEADD(HOUR,-4,GETUTCDATE()))as '5',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-6,GETUTCDATE())  and DATEADD(HOUR,-5,GETUTCDATE()))as '6',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-7,GETUTCDATE())  and DATEADD(HOUR,-6,GETUTCDATE()))as '7',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-8,GETUTCDATE())  and DATEADD(HOUR,-7,GETUTCDATE()))as '8',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-9,GETUTCDATE())  and DATEADD(HOUR,-8,GETUTCDATE()))as '9',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-10,GETUTCDATE())  and DATEADD(HOUR,-9,GETUTCDATE()))as '10',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-11,GETUTCDATE())  and DATEADD(HOUR,-10,GETUTCDATE()))as '11',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-12,GETUTCDATE())  and DATEADD(HOUR,-11,GETUTCDATE()))as '12',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-13,GETUTCDATE())  and DATEADD(HOUR,-12,GETUTCDATE()))as '13',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-14,GETUTCDATE())  and DATEADD(HOUR,-13,GETUTCDATE()))as '14',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-15,GETUTCDATE())  and DATEADD(HOUR,-14,GETUTCDATE()))as '15',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-16,GETUTCDATE())  and DATEADD(HOUR,-15,GETUTCDATE()))as '16',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-17,GETUTCDATE())  and DATEADD(HOUR,-16,GETUTCDATE()))as '17',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-18,GETUTCDATE())  and DATEADD(HOUR,-17,GETUTCDATE()))as '18',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-19,GETUTCDATE())  and DATEADD(HOUR,-18,GETUTCDATE()))as '19',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-20,GETUTCDATE())  and DATEADD(HOUR,-19,GETUTCDATE()))as '20',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-21,GETUTCDATE())  and DATEADD(HOUR,-20,GETUTCDATE()))as '21',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-22,GETUTCDATE())  and DATEADD(HOUR,-21,GETUTCDATE()))as '22',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-23,GETUTCDATE())  and DATEADD(HOUR,-22,GETUTCDATE()))as '23',

	(select count(CAST(CAST(valu AS float) AS INT))  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(HOUR,-24,GETUTCDATE())  and DATEADD(HOUR,-23,GETUTCDATE()))as '24'

	
)
end