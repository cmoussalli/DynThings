//Vars
var selectedThing = 0;
var selectedThingTitle = 0;
var selectedThingEndPointTypeID = 0;


//Attach : Pager
function AttachEventThingsListPager() {
    $(document).on("click", "#ThingsListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divThingsList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtThingSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divThingsList").html(result);
                return false;
            }
        });
        return false;
    });
}

//Attach : Add Form Submit
function AttachEventThingAddForm() {
    $("#ThingAddForm").on("submit", function (event) {
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
                LoadPart_ThingListDiv();
            },
            error: function () {
                ServerResponse(resp);
            }

        })

        LoadPart_ThingListDiv();
        $('#mdl').modal('hide');
    });
};



//Attach : Edit Form Submit
function AttachEventThingEditForm(ThingID) {
    $("#ThingEditForm").on("submit", function (event) {
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
        LoadPart_ThingDetailsDiv(ThingID);
    });
};


//Get List
function LoadPart_ThingListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divThingsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Things/ListPV?searchfor=' + $(txtThingSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divThingsList").html(partialViewResult);
        });
    return false;
};

//Get Details
function LoadPart_ThingDetailsDiv(id) {
    var loadingpart = LoadDivLoading();
    $("#divThingMain").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Things/DetailsPV?id=' + id,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#divThingMain").html(partialViewResult);
    });
}

//Get Add
function LoadPart_DialogThingAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Things/addpv',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Edit
function LoadPart_DialogThingEdit(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Things/editpv?id=' + id,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Delete
function LoadPart_DialogThingDelete(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Things/DeletePV?id=' + id,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

function LoadThingEditor(id) {
    LoadPart_DialogThingEdit(id);
    LoadPart_ThingDetailsDiv(id);
}



//Lookup
//LoadPart_Thing Lookup
function LoadPart_ThingLookup(placeHolder) {
    var loadingpart = LoadDivLoading();
    $(placeHolder).html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Things/LookupPV',
        type: "GET",
    })
    .success(function (partialViewResult) {
        $(placeHolder).html(partialViewResult);
    });
}
//Get Lookup List PV
function LoadPart_ThingListLookupDiv() {
    var loadingpart = LoadDivLoading();
    $("#divThingsLookupList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Things/LookupListPV?searchfor=' + $(txtThingLookupSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divThingsLookupList").html(partialViewResult);
        });
    return false;
};
//Attach : Pager
function AttachEventThingsLookupListPager() {
    $(document).on("click", "#ThingsLookupListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divThingsLookupList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtThingLookupSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divThingsLookupList").html(result);
                return false;
            }
        });
        return false;
    });
}
//Select from Lookup
function SelectThingFromLookUp(id, title) {
    selectedThing = id;
    selectedThingTitle = title;
    EventSelectThing();
}


//HighChart
//ThingEnd Inputs
function LoadChart_ThingEnd_InputsMinutesDiv(thingID,endPointTypeID) {
    var loadingpart = LoadDivLoading();
    $("#divThingEndChart_Inputs").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/things/Rpt_Minute?thingID=' + thingID + '&endPointTypeID=' + endPointTypeID   ,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divThingEndChart_Inputs").html(partialViewResult);
        });
    return false;
}

function LoadChart_ThingEnd_InputsHoursDiv(thingID, endPointTypeID) {
    var loadingpart = LoadDivLoading();
    $("#divThingEndChart_Inputs").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/things/Rpt_Hour?thingID=' + thingID + '&endPointTypeID=' + endPointTypeID,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divThingEndChart_Inputs").html(partialViewResult);
        });
    return false;
}

function LoadChart_ThingEnd_InputsDaysDiv(thingID, endPointTypeID) {
    var loadingpart = LoadDivLoading();
    $("#divThingEndChart_Inputs").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/things/Rpt_Day?thingID=' + thingID + '&endPointTypeID=' + endPointTypeID,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divThingEndChart_Inputs").html(partialViewResult);
        });
    return false;
}

function LoadChart_ThingEnd_InputsMonthsDiv(thingID, endPointTypeID,year) {
    var loadingpart = LoadDivLoading();
    $("#divThingEndChart_Inputs").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/things/Rpt_Month?thingID=' + thingID + '&endPointTypeID=' + endPointTypeID + '&year=' + year,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divThingEndChart_Inputs").html(partialViewResult);
        });
    return false;
}



function LoadGrid_ThingEnd_HistoryDiv(thingID, endPointTypeID,fromDate,toDate) {
    var loadingpart = LoadDivLoading();
    $("#divThingEndHistory_Inputs").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/things/Rpt_IOsHistory?thingID=' + thingID + '&endPointTypeID=' + endPointTypeID + '&fromDate=' + fromDate + '&toDate=' + toDate,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divThingEndHistory_Inputs").html(partialViewResult);
        });
    return false;
}
