﻿

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace DynThings.Data.Models
{

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

using System.Data.Entity.Core.Objects;
using System.Linq;


public partial class DynThingsEntities : DbContext
{
    public DynThingsEntities()
        : base("name=DynThingsEntities")
    {

    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }


    public virtual DbSet<AlertCondition> AlertConditions { get; set; }

    public virtual DbSet<AlertConditionType> AlertConditionTypes { get; set; }

    public virtual DbSet<AlertLevel> AlertLevels { get; set; }

    public virtual DbSet<Alert> Alerts { get; set; }

    public virtual DbSet<APIMethod> APIMethods { get; set; }

    public virtual DbSet<APIUtilisation> APIUtilisations { get; set; }

    public virtual DbSet<AppAPIEntity> AppAPIEntitys { get; set; }

    public virtual DbSet<AppEndpointType> AppEndpointTypes { get; set; }

    public virtual DbSet<AppMediaFile> AppMediaFiles { get; set; }

    public virtual DbSet<App> Apps { get; set; }

    public virtual DbSet<AppStatuss> AppStatusses { get; set; }

    public virtual DbSet<AppThingCategory> AppThingCategorys { get; set; }

    public virtual DbSet<AppThingExtenstion> AppThingExtenstions { get; set; }

    public virtual DbSet<AppUserToken> AppUserTokens { get; set; }

    public virtual DbSet<AspNetRole> AspNetRoles { get; set; }

    public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }

    public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }

    public virtual DbSet<AspNetUser> AspNetUsers { get; set; }

    public virtual DbSet<DataType> DataTypes { get; set; }

    public virtual DbSet<DeviceCommand> DeviceCommands { get; set; }

    public virtual DbSet<DeviceIO> DeviceIOs { get; set; }

    public virtual DbSet<Device> Devices { get; set; }

    public virtual DbSet<DeviceStatu> DeviceStatus { get; set; }

    public virtual DbSet<DynSetting> DynSettings { get; set; }

    public virtual DbSet<EndPointCommand> EndPointCommands { get; set; }

    public virtual DbSet<EndPointIO> EndPointIOs { get; set; }

    public virtual DbSet<Endpoint> Endpoints { get; set; }

    public virtual DbSet<EndPointTypeCategory> EndPointTypeCategorys { get; set; }

    public virtual DbSet<EndPointType> EndPointTypes { get; set; }

    public virtual DbSet<IOType> IOTypes { get; set; }

    public virtual DbSet<LinkDevicesLocation> LinkDevicesLocations { get; set; }

    public virtual DbSet<LinkLocationsLocationView> LinkLocationsLocationViews { get; set; }

    public virtual DbSet<LinkThingsLocation> LinkThingsLocations { get; set; }

    public virtual DbSet<LinkUsersAlert> LinkUsersAlerts { get; set; }

    public virtual DbSet<Location> Locations { get; set; }

    public virtual DbSet<LocationView> LocationViews { get; set; }

    public virtual DbSet<LocationViewType> LocationViewTypes { get; set; }

    public virtual DbSet<MediaFile> MediaFiles { get; set; }

    public virtual DbSet<ResultMessage> ResultMessages { get; set; }

    public virtual DbSet<SystemEntity> SystemEntitys { get; set; }

    public virtual DbSet<ThingCategory> ThingCategorys { get; set; }

    public virtual DbSet<ThingEnd> ThingEnds { get; set; }

    public virtual DbSet<ThingExtenstion> ThingExtenstions { get; set; }

    public virtual DbSet<ThingExtenstionValue> ThingExtenstionValues { get; set; }

    public virtual DbSet<Thing> Things { get; set; }

    public virtual DbSet<UserNotification> UserNotifications { get; set; }

    public virtual DbSet<UserNotificationType> UserNotificationTypes { get; set; }


    public virtual ObjectResult<Rpt_EndPoint_IOs_Months_Result> Rpt_EndPoint_IOs_Months(Nullable<long> ePID, string year)
    {

        var ePIDParameter = ePID.HasValue ?
            new ObjectParameter("EPID", ePID) :
            new ObjectParameter("EPID", typeof(long));


        var yearParameter = year != null ?
            new ObjectParameter("Year", year) :
            new ObjectParameter("Year", typeof(string));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Rpt_EndPoint_IOs_Months_Result>("Rpt_EndPoint_IOs_Months", ePIDParameter, yearParameter);
    }


    public virtual ObjectResult<Rpt_EndPoint_IOs_Days_Result> Rpt_EndPoint_IOs_Days(Nullable<long> ePID)
    {

        var ePIDParameter = ePID.HasValue ?
            new ObjectParameter("EPID", ePID) :
            new ObjectParameter("EPID", typeof(long));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Rpt_EndPoint_IOs_Days_Result>("Rpt_EndPoint_IOs_Days", ePIDParameter);
    }


    public virtual ObjectResult<Rpt_EndPoint_IOs_HOURs_Result> Rpt_EndPoint_IOs_HOURs(Nullable<long> ePID)
    {

        var ePIDParameter = ePID.HasValue ?
            new ObjectParameter("EPID", ePID) :
            new ObjectParameter("EPID", typeof(long));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Rpt_EndPoint_IOs_HOURs_Result>("Rpt_EndPoint_IOs_HOURs", ePIDParameter);
    }


    public virtual ObjectResult<Rpt_EndPoint_IOs_Minutes_Result> Rpt_EndPoint_IOs_Minutes(Nullable<long> ePID)
    {

        var ePIDParameter = ePID.HasValue ?
            new ObjectParameter("EPID", ePID) :
            new ObjectParameter("EPID", typeof(long));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Rpt_EndPoint_IOs_Minutes_Result>("Rpt_EndPoint_IOs_Minutes", ePIDParameter);
    }


    public virtual ObjectResult<Rpt_ThingEnd_IOs_Minutes_Result> Rpt_ThingEnd_IOs_Minutes(Nullable<long> thingID, Nullable<long> typeID)
    {

        var thingIDParameter = thingID.HasValue ?
            new ObjectParameter("ThingID", thingID) :
            new ObjectParameter("ThingID", typeof(long));


        var typeIDParameter = typeID.HasValue ?
            new ObjectParameter("TypeID", typeID) :
            new ObjectParameter("TypeID", typeof(long));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Rpt_ThingEnd_IOs_Minutes_Result>("Rpt_ThingEnd_IOs_Minutes", thingIDParameter, typeIDParameter);
    }


    public virtual ObjectResult<Rpt_ThingEnd_IOs_Hours_Result> Rpt_ThingEnd_IOs_Hours(Nullable<long> thingID, Nullable<long> typeID)
    {

        var thingIDParameter = thingID.HasValue ?
            new ObjectParameter("ThingID", thingID) :
            new ObjectParameter("ThingID", typeof(long));


        var typeIDParameter = typeID.HasValue ?
            new ObjectParameter("TypeID", typeID) :
            new ObjectParameter("TypeID", typeof(long));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Rpt_ThingEnd_IOs_Hours_Result>("Rpt_ThingEnd_IOs_Hours", thingIDParameter, typeIDParameter);
    }


    public virtual ObjectResult<Rpt_ThingEnd_IOs_Days_Result> Rpt_ThingEnd_IOs_Days(Nullable<long> thingID, Nullable<long> typeID)
    {

        var thingIDParameter = thingID.HasValue ?
            new ObjectParameter("ThingID", thingID) :
            new ObjectParameter("ThingID", typeof(long));


        var typeIDParameter = typeID.HasValue ?
            new ObjectParameter("TypeID", typeID) :
            new ObjectParameter("TypeID", typeof(long));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Rpt_ThingEnd_IOs_Days_Result>("Rpt_ThingEnd_IOs_Days", thingIDParameter, typeIDParameter);
    }


    public virtual ObjectResult<Rpt_ThingEnd_IOs_Months_Result> Rpt_ThingEnd_IOs_Months(Nullable<long> thingID, Nullable<long> typeID, Nullable<long> year)
    {

        var thingIDParameter = thingID.HasValue ?
            new ObjectParameter("ThingID", thingID) :
            new ObjectParameter("ThingID", typeof(long));


        var typeIDParameter = typeID.HasValue ?
            new ObjectParameter("TypeID", typeID) :
            new ObjectParameter("TypeID", typeof(long));


        var yearParameter = year.HasValue ?
            new ObjectParameter("Year", year) :
            new ObjectParameter("Year", typeof(long));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Rpt_ThingEnd_IOs_Months_Result>("Rpt_ThingEnd_IOs_Months", thingIDParameter, typeIDParameter, yearParameter);
    }


    public virtual ObjectResult<GetThingEnds_Result> GetThingEnds(Nullable<long> locationID, Nullable<long> thingID, Nullable<long> thingCategoryID, Nullable<long> endPointID, Nullable<long> endPointTypeID)
    {

        var locationIDParameter = locationID.HasValue ?
            new ObjectParameter("LocationID", locationID) :
            new ObjectParameter("LocationID", typeof(long));


        var thingIDParameter = thingID.HasValue ?
            new ObjectParameter("ThingID", thingID) :
            new ObjectParameter("ThingID", typeof(long));


        var thingCategoryIDParameter = thingCategoryID.HasValue ?
            new ObjectParameter("ThingCategoryID", thingCategoryID) :
            new ObjectParameter("ThingCategoryID", typeof(long));


        var endPointIDParameter = endPointID.HasValue ?
            new ObjectParameter("EndPointID", endPointID) :
            new ObjectParameter("EndPointID", typeof(long));


        var endPointTypeIDParameter = endPointTypeID.HasValue ?
            new ObjectParameter("EndPointTypeID", endPointTypeID) :
            new ObjectParameter("EndPointTypeID", typeof(long));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetThingEnds_Result>("GetThingEnds", locationIDParameter, thingIDParameter, thingCategoryIDParameter, endPointIDParameter, endPointTypeIDParameter);
    }


    public virtual ObjectResult<Rpt_EndPointAndDevices_IOsCount_Minutes_Result> Rpt_EndPointAndDevices_IOsCount_Minutes()
    {

        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Rpt_EndPointAndDevices_IOsCount_Minutes_Result>("Rpt_EndPointAndDevices_IOsCount_Minutes");
    }


    public virtual ObjectResult<Rpt_LastHoursConnections_Result> Rpt_LastHoursConnections()
    {

        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Rpt_LastHoursConnections_Result>("Rpt_LastHoursConnections");
    }


    public virtual int SubmitEndPointInput(Nullable<System.Guid> passKey, string value, Nullable<System.DateTime> execTimeStamp)
    {

        var passKeyParameter = passKey.HasValue ?
            new ObjectParameter("PassKey", passKey) :
            new ObjectParameter("PassKey", typeof(System.Guid));


        var valueParameter = value != null ?
            new ObjectParameter("Value", value) :
            new ObjectParameter("Value", typeof(string));


        var execTimeStampParameter = execTimeStamp.HasValue ?
            new ObjectParameter("ExecTimeStamp", execTimeStamp) :
            new ObjectParameter("ExecTimeStamp", typeof(System.DateTime));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SubmitEndPointInput", passKeyParameter, valueParameter, execTimeStampParameter);
    }


    public virtual int SubmitEndPointLog(Nullable<System.Guid> passKey, string value, Nullable<System.DateTime> execTimeStamp)
    {

        var passKeyParameter = passKey.HasValue ?
            new ObjectParameter("PassKey", passKey) :
            new ObjectParameter("PassKey", typeof(System.Guid));


        var valueParameter = value != null ?
            new ObjectParameter("Value", value) :
            new ObjectParameter("Value", typeof(string));


        var execTimeStampParameter = execTimeStamp.HasValue ?
            new ObjectParameter("ExecTimeStamp", execTimeStamp) :
            new ObjectParameter("ExecTimeStamp", typeof(System.DateTime));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SubmitEndPointLog", passKeyParameter, valueParameter, execTimeStampParameter);
    }


    public virtual int SubmitEndpointCommand(Nullable<long> commandID, string value, Nullable<System.DateTime> scheduleTimeStamp)
    {

        var commandIDParameter = commandID.HasValue ?
            new ObjectParameter("CommandID", commandID) :
            new ObjectParameter("CommandID", typeof(long));


        var valueParameter = value != null ?
            new ObjectParameter("Value", value) :
            new ObjectParameter("Value", typeof(string));


        var scheduleTimeStampParameter = scheduleTimeStamp.HasValue ?
            new ObjectParameter("ScheduleTimeStamp", scheduleTimeStamp) :
            new ObjectParameter("ScheduleTimeStamp", typeof(System.DateTime));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SubmitEndpointCommand", commandIDParameter, valueParameter, scheduleTimeStampParameter);
    }


    public virtual int SubmitEndpointCommandExecuted(Nullable<long> commandID, Nullable<System.DateTime> execTimeStamp)
    {

        var commandIDParameter = commandID.HasValue ?
            new ObjectParameter("CommandID", commandID) :
            new ObjectParameter("CommandID", typeof(long));


        var execTimeStampParameter = execTimeStamp.HasValue ?
            new ObjectParameter("ExecTimeStamp", execTimeStamp) :
            new ObjectParameter("ExecTimeStamp", typeof(System.DateTime));


        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SubmitEndpointCommandExecuted", commandIDParameter, execTimeStampParameter);
    }

}

}

