//Vars
var selectedEndPointID = 0;
var selectedEndPointTitle = 0;
//Server Response
function ServerResponse(response) {
    var Ntyp = '';
    var Ntitle = ''
    if (response.ResultType == '0') {
        Ntyp = 's';
        Ntitle = 'Success';
    }
    else {
        Ntyp = 'd';
        Ntitle = 'Error';
    }
    NotifyWithTitle(Ntyp, Ntitle, response.Message);
};


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
function AttachEventEndPointEditForm(endPointID) {
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
        LoadPart_EndPointDetailsDiv(endPointID);
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
        .done(function (partialViewResult) {
            $("#divEndPointsList").html(partialViewResult);
        });
    return false;
};

//Get Details
function LoadPart_EndPointDetailsDiv(id) {
    var loadingpart = LoadDivLoading();
    $("#divEndPointMain").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/DetailsPV?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divEndPointMain").html(partialViewResult);
    });
}

//Get Add
function LoadPart_DialogEndPointAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/addpv',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Edit
function LoadPart_DialogEndPointEdit(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/editpv?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Delete
function LoadPart_DialogEndPointDelete(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/DeletePV?id=' + id,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

function LoadEndpointEditor(id) {
    LoadPart_DialogEndPointEdit(id);
    LoadPart_EndPointDetailsDiv(id);
}

//Get History IOs
function LoadPart_EndPointHistoryDiv(endPointID) {
    var loadingpart = LoadDivLoading();
    $("#SelectedEndPointID").val(endPointID);
    $("#divEndPointHistory").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/GetPVEndPointHistory?endPointID=' + endPointID + '&page=1&recordsPerPage=0',
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divEndPointHistory").html(partialViewResult);
    });
}

//Get Commands
function LoadPart_EndPointCommandListByEndPointIDDiv(endPointID, search) {
    var loadingpart = LoadDivLoading();
    $("#divEndPointCommandsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/EndPointCommandsListByEndPointIDPV?searchfor=' + search + '&EndPointID=' + endPointID + '&recordsperpage=0',
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divEndPointCommandsList").html(partialViewResult);
        });
    return false;
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
    .done(function (partialViewResult) {
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
        .done(function (partialViewResult) {
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


function drpReport_Select(endPointID) {
    
    LoadChart_EndPoint_AvgMonthDiv(endPointID);
}


//HighChart
function LoadChart_EndPoint_AvgMonthDiv(endPointID) {
    var loadingpart = LoadDivLoading();
    $("#EndPointChartDiv").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/AVG_Month?EndPointID=' + endPointID ,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#EndPointChartDiv").html(partialViewResult);
        });
    return false;
}