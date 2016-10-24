

CREATE  procedure [dbo].[ResetDB]
as
begin

truncate table endpointios
truncate table deviceios
truncate table usernotifications


end