//Vars
var selectedLocation = 0;

//Attach : Pager
function AttachEventLocationsListPager() {
    $(document).on("click", "#LocationsListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divLocationsList").html(loadingpart);

        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtLocationsSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divLocationsList").html(result);
                return false;
            }
        });
        return false;
    });
}



//Get List
function LoadPart_LocationListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divLocationsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Locations/ListPV?searchfor=' + $('#txtLocationsSearch').val() + '&recordsperpage=0',
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divLocationsList").html(partialViewResult);
            AttachEventLocationsListPager();
        });
    return false;
};


//Get Add
function LoadPart_DialogLocationAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Locations/addpv',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#modal").html(partialViewResult);
        });
}

//Get Details : Main
function LoadPart_LocationMainDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locations/DetailsMainpv?id=' + selectedLocation,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divPageDetails").html(partialViewResult);
        });
}
//Attach : Edit Form Submit : Main
function AttachEventLocationMainEditForm() {
    $("#LocationEditMainForm").on("submit", function (event) {
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
            }

        })
    });
}

//Get Details : Map
function LoadPart_LocationMapDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Locations/DetailsGeoLocationPV?id=' + selectedLocation,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divPageDetails").html(partialViewResult);
        });
}
//Attach : Edit Form Submit : Map
function AttachEventLocationMapEditForm(locationID) {
    $("#LocationMapEditForm").on("submit", function (event) {
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
            }

        })
    });
}

//Get Details : Things Container
function LoadPart_LocationThingsContainerDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locations/DetailsThingsContainerPV?locationID=' + selectedLocation,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divPageDetails").html(partialViewResult);
        });
    return false;
};
//Get Details : Things List
function LoadPart_LocationThingsListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divThingsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locations/DetailsThingsListPV?searchfor=' + $(txtThingsSearch).val() + '&locationID=' + selectedLocation + '&recordsperpage=0',
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divThingsList").html(partialViewResult);
        });
    return false;
};
//Attach : Things List Pager
function AttachEventLocationThingsListPager() {
    $(document).on("click", "#DetailsThingsListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divThingsList").html(loadingpart);

        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtThingsSearch).val() + '&recordsperpage=0',
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

//Get Details : Devices Container
function LoadPart_LocationDevicesContainerDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locations/DetailsDevicesContainerPV?locationID=' + selectedLocation,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divPageDetails").html(partialViewResult);
        });
    return false;
};
//Get Details : Devices List
function LoadPart_LocationDevicesListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divDevicesList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locations/DetailsDevicesListPV?searchfor=' + $(txtDevicesSearch).val() + '&locationID=' + selectedLocation + '&recordsperpage=0',
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divDevicesList").html(partialViewResult);
        });
    return false;
};
//Attach : Devices List Pager
function AttachEventLocationDevicesListPager() {
    $(document).on("click", "#DetailsDevicesListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divDevicesList").html(loadingpart);

        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtDevicesSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divDevicesList").html(result);
                return false;
            }
        });
        return false;
    });
}

//Get Delete
function LoadPart_LocationDelete() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Locations/DeletePV?id=' + selectedLocation,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#modal").html(partialViewResult);
        });
}


//Lookup
//LoadPart_Location Lookup
function LoadPart_LocationLookup(placeHolder) {
    var loadingpart = LoadDivLoading();
    $(placeHolder).html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Locations/LookupPV',
        type: "GET",
    })
        .done(function (partialViewResult) {
            $(placeHolder).html(partialViewResult);
        });
}
//Get Lookup List PV
function LoadPart_LocationListLookupDiv() {
    var loadingpart = LoadDivLoading();
    $("#divLocationsLookupList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Locations/LookupListPV?searchfor=' + $(txtLocationLookupSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divLocationsLookupList").html(partialViewResult);
        });
    return false;
};
//Attach : Pager
function AttachEventLocationsLookupListPager() {
    $(document).on("click", "#LocationsLookupListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divLocationsLookupList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtLocationLookupSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divLocationsLookupList").html(result);
                return false;
            }
        });
        return false;
    });
}
//Select from Lookup
function SelectLocationFromLookUp(value) {
    selectedLocation = value;
    EventSelectLocation();
}

function AttachDeviceToLocation(locationID, DeviceID) {
    $.ajax({
        url: getRootURL() + '/Locations/AttachDevice?locationID=' + locationID + '&DeviceID=' + DeviceID,
        type: "POST",
    })
        .done(function (partialViewResult) {
            HideModal();
            LoadPart_LocationDevicesListDiv();
        });
}

function DeattachDeviceFromLocation(lnkID) {
    $.ajax({
        url: getRootURL() + '/Locations/DeAttachDevice?linkID=' + lnkID,
        type: "POST",
    })
        .done(function (partialViewResult) {
            HideModal();
            LoadPart_LocationDevicesListDiv();
        });
}

function AttachThingToLocation(locationID, ThingID) {
    $.ajax({
        url: getRootURL() + '/Locations/AttachThing?locationID=' + locationID + '&ThingID=' + ThingID,
        type: "POST",
    })
        .done(function (partialViewResult) {
            HideModal();
            LoadPart_LocationThingsListDiv();
        });
}

function DeattachThingFromLocation(lnkID) {
    $.ajax({
        url: getRootURL() + '/Locations/DeAttachThing?linkID=' + lnkID,
        type: "POST",
    })
        .done(function (partialViewResult) {
            HideModal();
            LoadPart_LocationThingsListDiv();
        });
}

