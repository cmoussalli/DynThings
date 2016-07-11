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
            }

    })
        $.notify("Location Saved", "success");
});
}

//Get List
function LoadPart_LocationListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divLocationsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Locations/ListPV?searchfor=' + $(txtLocationsSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divLocationsList").html(partialViewResult);
            AttachEventLocationsListPager();
        });
    return false;
};

//Get Details : Main
function LoadPart_LocationDetailsMainDiv(id) {
    var loadingpart = LoadDivLoading();
    $("#divLocationMain").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Locations/DetailsMainPV?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divLocationMain").html(partialViewResult);
    });
}

//Get Details : GeoLocation
function LoadPart_LocationDetailsGeoLocationDiv(id) {
    var loadingpart = LoadDivLoading();
    $("#divLocationGeoLocation").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Locations/DetailsGeoLocationPV?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divLocationGeoLocation").html(partialViewResult);
    });
}

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

//Get Edit
function LoadPart_DialogLocationMainEdit(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locations/editMainpv?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Delete
function LoadPart_DialogLocationDelete(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Locations/DeletePV?id=' + id,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Devices List
function LoadPart_LocationDevicesByLocationIDDiv(locationID) {
    var loadingpart = LoadDivLoading();
    $("#divLnkLocationDevicesList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locations/LnkLocationDevicesListGridPV?searchfor=' + $(txtDevicesSearch).val() + '&locationID=' + locationID + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divLnkLocationDevicesList").html(partialViewResult);
            AttachEventLnkLocationDevicesListPager();
        });
    return false;
};

//Attach :LnkLocationDevices Pager
function AttachEventLnkLocationDevicesListPager() {
    $(document).on("click", "#LnkLocationDevicesListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divLnkLocationDevicesList").html(loadingpart);

        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtDevicesSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divLnkLocationDevicesList").html(result);
                return false;
            }
        });
        return false;
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
    HideModal();
    LoadPart_LocationDevicesByLocationIDDiv(selectedLocation);
}

function DeattachDeviceFromLocation(lnkID) {
    $.ajax({
        url: getRootURL() + '/Locations/DeAttachDevice?linkID=' + lnkID,
        type: "POST",
    })
    LoadPart_LocationDevicesByLocationIDDiv(selectedLocation);
}