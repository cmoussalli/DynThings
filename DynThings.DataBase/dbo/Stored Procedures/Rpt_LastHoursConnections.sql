
CREATE procedure [dbo].[Rpt_LastHoursConnections]
as
begin
	select (
		select count(valu)  from EndPointIOs
		where [execTimeStamp_utc] between DATEADD(HOUR,-1,GETUTCDATE())  and GETUTCDATE())
		as 'EndPointConnections',

		(select count(valu)  from DeviceIOs
		where [execTimeStamp_utc] between DATEADD(HOUR,-1,GETUTCDATE())  and GETUTCDATE()
		) as 'DeviceConnections',

		(select count(id)  from APIUtilisations
		where [TimeStampUTC] between DATEADD(HOUR,-1,GETUTCDATE())  and GETUTCDATE()
		) as 'APIConnections'
end

exec Rpt_LastHoursConnections