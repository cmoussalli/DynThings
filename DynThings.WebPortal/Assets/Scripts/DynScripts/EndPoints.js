//Vars
var selectedEndPointID = 0;
var selectedEndPointTitle = 0;


//Attach : Pager
function AttachEventEndPointsListPager() {
    $(document).on("click", "#EndPointsListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divEndPointsList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtEndPointSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divEndPointsList").html(result);
                return false;
            }
        });
        return false;
    });
}

//Attach : Add Form Submit
function AttachEventEndPointAddForm() {
    $("#EndPointAddForm").on("submit", function (event) {
        event.preventDefault();
        var url = $(this).attr("action");
        var formData = $(this).serialize();
        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            dataType: "json",
            success: function (resp) {
                ServerResponse(resp);
                LoadPart_EndPointListDiv();
            },
            error: function () {
                ServerResponse(resp);
            }

        })

        LoadPart_EndPointListDiv();
        $('#mdl').modal('hide');
    });
};



//Attach : Edit Form Submit
function AttachEventEndPointEditForm() {
    $("#EndPointEditForm").on("submit", function (event) {
        event.preventDefault();
        var url = $(this).attr("action");
        var formData = $(this).serialize();
        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            dataType: "json",
            success: function (resp) {
                ServerResponse(resp);
            },
            error: function () {
                ServerResponse(resp);
            }
        })
        $('#mdl').modal('hide');
        LoadPart_EndpointMainDiv();
    });
};

function AttachEventEndPointDevKeysEditForm() {
    $("#EndPointDevKeysEditForm").on("submit", function (event) {
        event.preventDefault();
        var url = $(this).attr("action");
        var formData = $(this).serialize();
        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            dataType: "json",
            success: function (resp) {
                ServerResponse(resp);
            },
            error: function () {
                ServerResponse(resp);
            }
        })
        $('#mdl').modal('hide');
        LoadPart_EndPointDevKeysDiv(selectedEndPointID);
    });
};

//Get List
function LoadPart_EndPointListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divEndPointsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/ListPV?searchfor=' + $(txtEndPointSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divEndPointsList").html(partialViewResult);
        });
    return false;
};

//Get Details
function LoadPart_EndpointMainDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/DetailsPV?id=' + selectedEndPointID,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#divPageDetails").html(partialViewResult);
    });
}

//Get Add
function LoadPart_DialogEndPointAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/addpv',
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Edit
function LoadPart_DialogEndPointEdit() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/editpv?id=' + selectedEndPointID,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Delete
function LoadPart_EndpointDelete() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/DeletePV?id=' + selectedEndPointID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

function LoadEndpointEditor() {
    LoadPart_DialogEndPointEdit();
    LoadPart_EndpointMainDiv();
}

//Get History IOs
function LoadPart_EndpointHistoryDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/GetPVEndPointHistory?endPointID=' + selectedEndPointID + '&page=1&recordsPerPage=0',
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#divPageDetails").html(partialViewResult);
    });
}

//Get Commands
function LoadPart_EndpointCommandsDiv(search) {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/EndPointCommandsListByEndPointIDPV?searchfor=' + search + '&EndPointID=' + selectedEndPointID + '&recordsperpage=0',
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divPageDetails").html(partialViewResult);
        });
    return false;
}

//Get DevKeys
function LoadPart_EndpointDeveloperDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/DevKeysPV?ID=' + selectedEndPointID,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divPageDetails").html(partialViewResult);
        });
    return false;
}

//Get Edit DevKeys
function LoadPart_DialogEndPointDevKeysEdit() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/EditDevKeysPV?id=' + selectedEndPointID,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}


//Lookup
//LoadPart_EndPoint Lookup
function LoadPart_EndPointLookup(placeHolder) {
    var loadingpart = LoadDivLoading();
    $(placeHolder).html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/LookupPV',
        type: "GET",
    })
    .success(function (partialViewResult) {
        $(placeHolder).html(partialViewResult);
    });
}
//Get Lookup List PV
function LoadPart_EndPointListLookupDiv() {
    var loadingpart = LoadDivLoading();
    $("#divEndPointsLookupList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/LookupListPV?searchfor=' + $(txtEndPointLookupSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divEndPointsLookupList").html(partialViewResult);
        });
    return false;
};
//Attach : Pager
function AttachEventEndPointsLookupListPager() {
    $(document).on("click", "#EndPointsLookupListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divEndPointsLookupList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtEndPointLookupSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divEndPointsLookupList").html(result);
                return false;
            }
        });
        return false;
    });
}
//Select from Lookup
function SelectEndPointFromLookUp(id, title) {
    selectedEndPointID = id;
    selectedEndPointTitle = title;
    EventSelectEndPoint();
}


function drpReport_Select(endPointID,year) {

    if ($("#drpEndpointHighchartsView").val() == 3)
    {
    LoadChart_EndPoint_DayDiv(endPointID);
    }
    if ($("#drpEndpointHighchartsView").val() == 4) {
        LoadChart_EndPoint_MonthDiv(endPointID,year);
    }
    if ($("#drpEndpointHighchartsView").val() == 2) {
        LoadChart_EndPoint_HourDiv(endPointID);
    }
    if ($("#drpEndpointHighchartsView").val() == 1) {
        LoadChart_EndPoint_MinuteDiv(endPointID);
    }


    
}


//HighChart
function LoadChart_EndPoint_ConnectivityDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/EndPointConnectivityPV?ID=' + selectedEndPointID ,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divPageDetails").html(partialViewResult);
        });
    return false;
}

function LoadChart_EndPoint_MonthDiv(year) {
    var loadingpart = LoadDivLoading();
    $("#EndPointChartDiv").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/Rpt_Month?EndPointID=' + selectedEndPointID + '&year=' + Date().getFullYear() ,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#EndPointChartDiv").html(partialViewResult);
        });
    return false;
}

function LoadChart_EndPoint_DayDiv() {
    var loadingpart = LoadDivLoading();
    $("#EndPointChartDiv").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/Rpt_Day?EndPointID=' + selectedEndPointID,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#EndPointChartDiv").html(partialViewResult);
        });
    return false;
}

function LoadChart_EndPoint_HourDiv() {
    var loadingpart = LoadDivLoading();
    $("#EndPointChartDiv").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/Rpt_Hour?EndPointID=' + selectedEndPointID,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#EndPointChartDiv").html(partialViewResult);
        });
    return false;
}

function LoadChart_EndPoint_MinuteDiv() {
    var loadingpart = LoadDivLoading();
    $("#EndPointChartDiv").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/Rpt_Minute?EndPointID=' + selectedEndPointID,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#EndPointChartDiv").html(partialViewResult);
        });
    return false;
}