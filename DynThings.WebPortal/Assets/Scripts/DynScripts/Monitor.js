var selectedThingEndDetailsView = "dashboard";
var selectedLocationThingListView = "Inputs";
var selectedLocation = "";

//Get Location by ID
function LoadPart_MonitorLocation(id) {
    //Validate MobileMode
    if (window.innerWidth < 768)
    {
        $('#divMapContrainer').addClass('hidden-xs');
    }

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




//Get ThingEnd Details
function LoadPart_MonitorThingEndDetails(thingID, thingEndTypeID) {
    selectedThingID = thingID;
    selectedThingEndPointTypeID = thingEndTypeID;
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



function Load_ThingsEnd_Details() {
    Load_ThingEnd_InputsMinutesDiv();
    Load_ThingEnd_HistoryDiv();
}
function UnSelectThingEndDetailsView() {
    $('#liThingEndDashboard').removeClass('active');
    $('#liThingEndHistory').removeClass('active');

    $('#divThingEndDetailsView_Dashboard').hide();
    $('#divThingEndDetailsView_History').hide();
}
function SelectThingEndDetailsView_Dashboard() {
    selectedThingEndDetailsView = 'dashboard';
    UnSelectThingEndDetailsView();
    $('#liThingEndDashboard').addClass('active');
    $('#divThingEndDetailsView_Dashboard').show();
}
function SelectThingEndDetailsView_History() {
    selectedThingEndDetailsView = 'history';
    UnSelectThingEndDetailsView();
    $('#liThingEndHistory').addClass('active');
    $('#divThingEndDetailsView_History').show();
}



function LoadPart_MonitorThingView() {
    $('#btnInputs').removeClass('active');
    $('#btnCommands').removeClass('active');
    $('#btnLogs').removeClass('active');

    if (selectedLocationThingListView == "Inputs") {
        $('#btnInputs').addClass('active');
        LoadPart_MonitorThingEndsList();
    }
    if (selectedLocationThingListView == "Commands") {
        $('#btnCommands').addClass('active');
        LoadPart_MonitorThingCommandsList();
    }
    if (selectedLocationThingListView == "Logs") {
        $('#btnLogs').addClass('active');
        FilterThingEnds();
    }
};

//Get Thing Ends
function LoadPart_MonitorThingEndsList() {
    var selectedThingID = $(Thing).val();
    var searchFor = $(txtSearch).val();
    var loadingpart = LoadDivLoading();
    $("#DivThingContent").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locationviews/GetLocationThingEndsListPV?searchfor=' + searchFor + '&LocationID=' + selectedLocation + '&ThingID=' + selectedThingID + '&recordsperpage=0',
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#DivThingContent").html(partialViewResult);
    });
}

//Get Thing Commands
function LoadPart_MonitorThingCommandsList() {
    var selectedThingID = $(Thing).val();
    var searchFor = $(txtSearch).val();
    var loadingpart = LoadDivLoading();
    $("#DivThingContent").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locationviews/GetLocationCommandsListPV?searchfor=' + searchFor + '&LocationID=' + selectedLocation + '&ThingID=' + selectedThingID + '&recordsperpage=0',
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#DivThingContent").html(partialViewResult);
    });
}

//btnBacktoMap
function btnBacktoMap() {
    $('#divMapContrainer').removeClass('hidden-xs');
};

//btnBacktoThingEnds
function btnBackThingEnds() {
    $('#divMapContrainer').addClass('hidden-xs');
    ClosedivMonitorDetailsDiv();
};
