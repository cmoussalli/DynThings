var selectedThingEndDetailsView = "dashboard";


//Get Location by ID
function LoadPart_MonitorLocation(id) {
    $("#SelectedLocationID").val(id);
    var loadingpart = LoadDivLoading();
    $("#divMonitorLocation").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/LocationViews/GetPVLocationViewLocation?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {

        $("#divMonitorLocation").html(partialViewResult);
    });
}

//Get EndPoint MainTab
function LoadPart_MonitorEndPointMain(endPointID) {
    var loadingpart = LoadDivLoading();
    $("#SelectedEndPointID").val(endPointID);
    $("#divMonitorEndPointMain").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locationviews/GetPVLocationViewEndPointMain?endPointID=' + endPointID,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divMonitorEndPointMain").html(partialViewResult);
    });
}

//Get EndPointHistory
function LoadPart_MonitorEndPointHistory(endPointID) {
    var loadingpart = LoadDivLoading();
    $("#SelectedEndPointID").val(endPointID);
    $("#divMonitorEndPointHistory").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locationviews/GetPVLocationViewEndPointHistory?endPointID=' + endPointID,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divMonitorEndPointHistory").html(partialViewResult);
    });
}

//Get EndPointCommands
function LoadPart_MonitorEndPointCommands(endPointID) {
    var loadingpart = LoadDivLoading();
    $("#SelectedEndPointID").val(endPointID);
    $("#divEndPointCommandsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locationviews/GetEndPointCommandsByEndPointGUIDPV?endPointID=' + endPointID,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divEndPointCommandsList").html(partialViewResult);
    });
}

//Get Thing Ends
function LoadPart_MonitorThingEndsList(searchFor,locationID,thingID) {
    var loadingpart = LoadDivLoading();
    $("#DivThingContent").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locationviews/GetLocationThingEndsListPV?searchfor=' + searchFor + '&LocationID=' + locationID + '&ThingID=' + thingID + '&recordsperpage=0',
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#DivThingContent").html(partialViewResult);
    });
}

//Get ThingEnd Details
function LoadPart_MonitorThingEndDetails(thingID, thingEndTypeID) {
    var loadingpart = LoadDivLoading();
    $("#divMonitorDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locationviews/GetThingEndDetailsPV?ThingID=' + thingID + '&thingEndTypeID=' + thingEndTypeID,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divMonitorDetails").html(partialViewResult);
    });
}
