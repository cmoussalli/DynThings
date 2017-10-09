

CREATE  procedure [dbo].[ResetDB]
as
begin

truncate table [dbo].[UserNotifications]
truncate table [dbo].[LinkUsersAlerts]
truncate table  [dbo].[AlertConditions]
truncate table [dbo].[Alerts]

truncate table [dbo].[LinkLocationsLocationViews]
truncate table  [dbo].[LocationViews]
truncate table  [dbo].[LinkDevicesLocations]
truncate table  [dbo].[LinkThingsLocations]
truncate table [dbo].[Locations]

truncate table [dbo].[EndPointIOs]
truncate table [dbo].[EndPointCommands]
truncate table [dbo].[Endpoints]
truncate table [dbo].[EndPointTypes]
truncate table [dbo].[EndPointTypeCategorys]


truncate table [dbo].[DeviceIOs]
truncate table [dbo].[DeviceCommands]
truncate table [dbo].[Devices]



truncate table usernotifications
truncate table LinkDevicesLocations
truncate table LinkLocationsLocationViews
truncate table LinkThingsLocations
truncate table LinkUsersAlerts


truncate table [dbo].[Things]
truncate table [dbo].[ThingCategorys]


truncate table [dbo].[MediaFiles]


truncate table  [dbo].[Apps]

truncate table [dbo].[AspNetUserRoles]
truncate table [dbo].[AspNetRoles]
truncate table [dbo].[AspNetUsers]



end