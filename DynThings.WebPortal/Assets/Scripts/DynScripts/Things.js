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

//Get Main
function LoadPart_ThingMainDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Things/DetailsPV?id=' + selectedThing,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#divPageDetails").html(partialViewResult);
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
function LoadPart_ThingDelete() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Things/DeletePV?id=' + selectedThing,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

function LoadThingEditor() {
    LoadPart_DialogThingEdit(selectedThing);
    LoadPart_ThingDetailsDiv(selectedThing);
}

//Get Properties
function LoadPart_ThingPropertiesDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Things/PropertiesPV?thingID=' + selectedThing,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#divPageDetails").html(partialViewResult);
    });
}
//Get Properties List
function LoadPart_ThingPropertiesList() {
    var loadingpart = LoadDivLoading();
    $("#divPropertiesList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Things/GetPVPropertiesList?thingID=' + selectedThing + '&searchFor=' + $('#txtThingPropertiesSearch').val(),
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#divPropertiesList").html(partialViewResult);
    });
}
//Get Add Property
function LoadPart_DialogThingPropertyAdd(thingExtensionID) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Things/AddPVThingExtensionProperty?thingExtensionID=' + thingExtensionID + '&thingID=' + selectedThing,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}
//Post Add Property
function Post_DialogThingPropertyAdd(thingExtensionID,newValue) {
  var url = getRootURL() + 'Things/AddThingExtensionProperty?thingExtensionID=' + thingExtensionID + '&thingID=' + selectedThing + '&newValue=' + newValue;
    $.ajax({
        url: url,
        type: "POST",
        success: function (resp) {
            ServerResponse(resp);
            LoadPart_ThingPropertiesList();
        },
        error: function (resp) {
            ServerResponse(resp);
        }
    })

$('#mdl').modal('hide');
}

//Get Edit Property
function LoadPart_DialogThingPropertyEdit(valueID) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Things/EditPVThingExtensionProperty?valueID=' + valueID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}
//Post Edit Property
function Post_DialogThingPropertyEdit(valueID,newValue) {
  var url = getRootURL() + 'Things/EditThingExtensionProperty?valueID=' + valueID + '&newValue=' + newValue;
    $.ajax({
        url: url,
        type: "POST",
        success: function (resp) {
            ServerResponse(resp);
LoadPart_ThingPropertiesList();
        },
        error: function (resp) {
            ServerResponse(resp);
        }
    });

$('#mdl').modal('hide');
}

//Get Delete Property
function LoadPart_DialogThingPropertyDelete(valueID) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Things/DeletePVThingExtensionProperty?valueID=' + valueID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}
//Post Delete Property
function Post_DialogThingPropertyDelete(valueID) {
  var url = getRootURL() + 'Things/DeleteThingExtensionProperty?valueID=' + valueID;
    $.ajax({
        url: url,
        type: "POST",
        success: function (resp) {
            ServerResponse(resp);
LoadPart_ThingPropertiesList();
        },
        error: function (resp) {
            ServerResponse(resp);
        }
    });

$('#mdl').modal('hide');
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
}

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
