create procedure [dbo].[INFO_Server]
as
begin
	select 
		SERVERPROPERTY('ServerName') as 'ServerName'
		,SERVERPROPERTY('Edition') as 'Edition'
		,SERVERPROPERTY('EngineEdition') as 'EngineEdition'
		,SERVERPROPERTY('ProductLevel') as 'ProductLevel'
		,SERVERPROPERTY('MachineName') as 'MachineName'
		,SERVERPROPERTY('IsHadrEnabled') as 'IsHadrEnabled'
		,SERVERPROPERTY('HadrManagerStatus') as 'HadrManagerStatus'
		,SERVERPROPERTY('IsClustered') as 'IsClustered'


end
