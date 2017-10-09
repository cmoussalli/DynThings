CREATE procedure [dbo].[Rpt_EndPointAndDevices_IOsCount_Minutes] 
 as
 begin
 SET NOCOUNT ON


 select '1' as 'ObjectCode', 
	'EndPoints' as 'Object',

	(select count(valu)from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-1,GETUTCDATE())  and GETUTCDATE())as '1',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-2,GETUTCDATE())  and DATEADD(minute,-1,GETUTCDATE()))as '2',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-3,GETUTCDATE())  and DATEADD(minute,-2,GETUTCDATE()))as '3',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-4,GETUTCDATE())  and DATEADD(minute,-3,GETUTCDATE()))as '4',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-5,GETUTCDATE())  and DATEADD(minute,-4,GETUTCDATE()))as '5',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-6,GETUTCDATE())  and DATEADD(minute,-5,GETUTCDATE()))as '6',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-7,GETUTCDATE())  and DATEADD(minute,-6,GETUTCDATE()))as '7',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-8,GETUTCDATE())  and DATEADD(minute,-7,GETUTCDATE()))as '8',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-9,GETUTCDATE())  and DATEADD(minute,-8,GETUTCDATE()))as '9',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-10,GETUTCDATE())  and DATEADD(minute,-9,GETUTCDATE()))as '10',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-11,GETUTCDATE())  and DATEADD(minute,-10,GETUTCDATE()))as '11',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-12,GETUTCDATE())  and DATEADD(minute,-11,GETUTCDATE()))as '12',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-13,GETUTCDATE())  and DATEADD(minute,-12,GETUTCDATE()))as '13',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-14,GETUTCDATE())  and DATEADD(minute,-13,GETUTCDATE()))as '14',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-15,GETUTCDATE())  and DATEADD(minute,-14,GETUTCDATE()))as '15',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-16,GETUTCDATE())  and DATEADD(minute,-15,GETUTCDATE()))as '16',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-17,GETUTCDATE())  and DATEADD(minute,-16,GETUTCDATE()))as '17',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-18,GETUTCDATE())  and DATEADD(minute,-17,GETUTCDATE()))as '18',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-19,GETUTCDATE())  and DATEADD(minute,-18,GETUTCDATE()))as '19',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-20,GETUTCDATE())  and DATEADD(minute,-19,GETUTCDATE()))as '20',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-21,GETUTCDATE())  and DATEADD(minute,-20,GETUTCDATE()))as '21',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-22,GETUTCDATE())  and DATEADD(minute,-21,GETUTCDATE()))as '22',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-23,GETUTCDATE())  and DATEADD(minute,-22,GETUTCDATE()))as '23',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-24,GETUTCDATE())  and DATEADD(minute,-23,GETUTCDATE()))as '24',

		(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-25,GETUTCDATE())  and DATEADD(minute,-24,GETUTCDATE()))as '25',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-26,GETUTCDATE())  and DATEADD(minute,-25,GETUTCDATE()))as '26',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-27,GETUTCDATE())  and DATEADD(minute,-26,GETUTCDATE()))as '27',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-28,GETUTCDATE())  and DATEADD(minute,-27,GETUTCDATE()))as '28',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-29,GETUTCDATE())  and DATEADD(minute,-28,GETUTCDATE()))as '29',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-30,GETUTCDATE())  and DATEADD(minute,-29,GETUTCDATE()))as '30',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-31,GETUTCDATE())  and DATEADD(minute,-30,GETUTCDATE()))as '31',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-32,GETUTCDATE())  and DATEADD(minute,-31,GETUTCDATE()))as '32',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-33,GETUTCDATE())  and DATEADD(minute,-32,GETUTCDATE()))as '33',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-34,GETUTCDATE())  and DATEADD(minute,-33,GETUTCDATE()))as '34',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-35,GETUTCDATE())  and DATEADD(minute,-34,GETUTCDATE()))as '35',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-36,GETUTCDATE())  and DATEADD(minute,-35,GETUTCDATE()))as '36',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-37,GETUTCDATE())  and DATEADD(minute,-36,GETUTCDATE()))as '37',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-38,GETUTCDATE())  and DATEADD(minute,-37,GETUTCDATE()))as '38',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-39,GETUTCDATE())  and DATEADD(minute,-38,GETUTCDATE()))as '39',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-40,GETUTCDATE())  and DATEADD(minute,-39,GETUTCDATE()))as '40',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-41,GETUTCDATE())  and DATEADD(minute,-40,GETUTCDATE()))as '41',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-42,GETUTCDATE())  and DATEADD(minute,-41,GETUTCDATE()))as '42',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-43,GETUTCDATE())  and DATEADD(minute,-42,GETUTCDATE()))as '43',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-44,GETUTCDATE())  and DATEADD(minute,-43,GETUTCDATE()))as '44',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-45,GETUTCDATE())  and DATEADD(minute,-44,GETUTCDATE()))as '45',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-46,GETUTCDATE())  and DATEADD(minute,-45,GETUTCDATE()))as '46',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-47,GETUTCDATE())  and DATEADD(minute,-46,GETUTCDATE()))as '47',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-48,GETUTCDATE())  and DATEADD(minute,-47,GETUTCDATE()))as '48',

		(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-49,GETUTCDATE())  and DATEADD(minute,-48,GETUTCDATE()))as '49',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-50,GETUTCDATE())  and DATEADD(minute,-49,GETUTCDATE()))as '50',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-51,GETUTCDATE())  and DATEADD(minute,-50,GETUTCDATE()))as '51',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-52,GETUTCDATE())  and DATEADD(minute,-51,GETUTCDATE()))as '52',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-53,GETUTCDATE())  and DATEADD(minute,-52,GETUTCDATE()))as '53',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-54,GETUTCDATE())  and DATEADD(minute,-53,GETUTCDATE()))as '54',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-55,GETUTCDATE())  and DATEADD(minute,-54,GETUTCDATE()))as '55',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-56,GETUTCDATE())  and DATEADD(minute,-55,GETUTCDATE()))as '56',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-57,GETUTCDATE())  and DATEADD(minute,-56,GETUTCDATE()))as '57',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-58,GETUTCDATE())  and DATEADD(minute,-57,GETUTCDATE()))as '58',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-59,GETUTCDATE())  and DATEADD(minute,-58,GETUTCDATE()))as '59',

	(select count(valu)  from EndPointIOs
	where [execTimeStamp_utc] between DATEADD(minute,-60,GETUTCDATE())  and DATEADD(minute,-59,GETUTCDATE()))as '60'


union all
(
 select '2' as 'ObjectCode', 
	'Devices' as 'Object',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-1,GETUTCDATE())  and GETUTCDATE())as '1',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-2,GETUTCDATE())  and DATEADD(minute,-1,GETUTCDATE()))as '2',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-3,GETUTCDATE())  and DATEADD(minute,-2,GETUTCDATE()))as '3',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-4,GETUTCDATE())  and DATEADD(minute,-3,GETUTCDATE()))as '4',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-5,GETUTCDATE())  and DATEADD(minute,-4,GETUTCDATE()))as '5',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-6,GETUTCDATE())  and DATEADD(minute,-5,GETUTCDATE()))as '6',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-7,GETUTCDATE())  and DATEADD(minute,-6,GETUTCDATE()))as '7',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-8,GETUTCDATE())  and DATEADD(minute,-7,GETUTCDATE()))as '8',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-9,GETUTCDATE())  and DATEADD(minute,-8,GETUTCDATE()))as '9',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-10,GETUTCDATE())  and DATEADD(minute,-9,GETUTCDATE()))as '10',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-11,GETUTCDATE())  and DATEADD(minute,-10,GETUTCDATE()))as '11',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-12,GETUTCDATE())  and DATEADD(minute,-11,GETUTCDATE()))as '12',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-13,GETUTCDATE())  and DATEADD(minute,-12,GETUTCDATE()))as '13',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-14,GETUTCDATE())  and DATEADD(minute,-13,GETUTCDATE()))as '14',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-15,GETUTCDATE())  and DATEADD(minute,-14,GETUTCDATE()))as '15',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-16,GETUTCDATE())  and DATEADD(minute,-15,GETUTCDATE()))as '16',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-17,GETUTCDATE())  and DATEADD(minute,-16,GETUTCDATE()))as '17',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-18,GETUTCDATE())  and DATEADD(minute,-17,GETUTCDATE()))as '18',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-19,GETUTCDATE())  and DATEADD(minute,-18,GETUTCDATE()))as '19',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-20,GETUTCDATE())  and DATEADD(minute,-19,GETUTCDATE()))as '20',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-21,GETUTCDATE())  and DATEADD(minute,-20,GETUTCDATE()))as '21',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-22,GETUTCDATE())  and DATEADD(minute,-21,GETUTCDATE()))as '22',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-23,GETUTCDATE())  and DATEADD(minute,-22,GETUTCDATE()))as '23',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-24,GETUTCDATE())  and DATEADD(minute,-23,GETUTCDATE()))as '24',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-25,GETUTCDATE())  and DATEADD(minute,-24,GETUTCDATE()))as '25',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-26,GETUTCDATE())  and DATEADD(minute,-25,GETUTCDATE()))as '26',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-27,GETUTCDATE())  and DATEADD(minute,-26,GETUTCDATE()))as '27',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-28,GETUTCDATE())  and DATEADD(minute,-27,GETUTCDATE()))as '28',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-29,GETUTCDATE())  and DATEADD(minute,-28,GETUTCDATE()))as '29',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-30,GETUTCDATE())  and DATEADD(minute,-29,GETUTCDATE()))as '30',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-31,GETUTCDATE())  and DATEADD(minute,-30,GETUTCDATE()))as '31',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-32,GETUTCDATE())  and DATEADD(minute,-31,GETUTCDATE()))as '32',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-33,GETUTCDATE())  and DATEADD(minute,-32,GETUTCDATE()))as '33',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-34,GETUTCDATE())  and DATEADD(minute,-33,GETUTCDATE()))as '34',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-35,GETUTCDATE())  and DATEADD(minute,-34,GETUTCDATE()))as '35',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-36,GETUTCDATE())  and DATEADD(minute,-35,GETUTCDATE()))as '36',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-37,GETUTCDATE())  and DATEADD(minute,-36,GETUTCDATE()))as '37',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-38,GETUTCDATE())  and DATEADD(minute,-37,GETUTCDATE()))as '38',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-39,GETUTCDATE())  and DATEADD(minute,-38,GETUTCDATE()))as '39',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-40,GETUTCDATE())  and DATEADD(minute,-39,GETUTCDATE()))as '40',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-41,GETUTCDATE())  and DATEADD(minute,-40,GETUTCDATE()))as '41',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-42,GETUTCDATE())  and DATEADD(minute,-41,GETUTCDATE()))as '42',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-43,GETUTCDATE())  and DATEADD(minute,-42,GETUTCDATE()))as '43',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-44,GETUTCDATE())  and DATEADD(minute,-43,GETUTCDATE()))as '44',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-45,GETUTCDATE())  and DATEADD(minute,-44,GETUTCDATE()))as '45',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-46,GETUTCDATE())  and DATEADD(minute,-45,GETUTCDATE()))as '46',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-47,GETUTCDATE())  and DATEADD(minute,-46,GETUTCDATE()))as '47',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-48,GETUTCDATE())  and DATEADD(minute,-47,GETUTCDATE()))as '48',

		(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-49,GETUTCDATE())  and DATEADD(minute,-48,GETUTCDATE()))as '49',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-50,GETUTCDATE())  and DATEADD(minute,-49,GETUTCDATE()))as '50',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-51,GETUTCDATE())  and DATEADD(minute,-50,GETUTCDATE()))as '51',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-52,GETUTCDATE())  and DATEADD(minute,-51,GETUTCDATE()))as '52',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-53,GETUTCDATE())  and DATEADD(minute,-52,GETUTCDATE()))as '53',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-54,GETUTCDATE())  and DATEADD(minute,-53,GETUTCDATE()))as '54',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-55,GETUTCDATE())  and DATEADD(minute,-54,GETUTCDATE()))as '55',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-56,GETUTCDATE())  and DATEADD(minute,-55,GETUTCDATE()))as '56',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-57,GETUTCDATE())  and DATEADD(minute,-56,GETUTCDATE()))as '57',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-58,GETUTCDATE())  and DATEADD(minute,-57,GETUTCDATE()))as '58',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-59,GETUTCDATE())  and DATEADD(minute,-58,GETUTCDATE()))as '59',

	(select count(valu)  from DeviceIOs
	where [execTimeStamp_utc] between DATEADD(minute,-60,GETUTCDATE())  and DATEADD(minute,-59,GETUTCDATE()))as '60'
)
end