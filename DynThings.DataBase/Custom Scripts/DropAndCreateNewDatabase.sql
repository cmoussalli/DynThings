

use master
go

DECLARE @kill varchar(8000) = '';  
SELECT @kill = @kill + 'kill ' + CONVERT(varchar(5), session_id) + ';'  
FROM sys.dm_exec_sessions
WHERE database_id  = db_id('DynThingsDBPub')
EXEC(@kill);

drop database DynThingsDBPub
go

Create database DynThingsDBPub
go