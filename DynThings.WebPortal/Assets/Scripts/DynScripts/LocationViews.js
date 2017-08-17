//Vars
var selectedLocationViewID = 0;
var map = null;
var viewchangeend;

//Get List
function LoadPart_LocationViewListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divLocationViewsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + 'LocationViews/ListCardsPV?searchfor=' + $(txtLocationViewSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divLocationViewsList").html(partialViewResult);
        });
    return false;
};
//Attach : Pager
function AttachEventLocationViewsListPager() {
    $(document).on("click", "#LocationViewsListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divLocationViewsList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtLocationViewSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divLocationViewsList").html(result);
                return false;
            }
        });
        return false;
    });
}

//Get Add
function LoadPart_DialogLocationViewAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/LocationViews/addpv',
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}
//Attach : Add Form Submit
function AttachEventLocationViewAddForm() {
    $("#LocationViewAddForm").on("submit", function (event) {
        event.preventDefault();
        var url = $(this).attr("action");
        var formData = $(this).serialize();
        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            dataType: "json",
            success: function (resp) {
                window.location.href =getRootURL() + '/locationViews/details?id=' + resp.Reference;
            }
        })
        LoadPart_LocationViewListDiv();
        $('#mdl').modal('hide');
    });
}

//Get Edit
function LoadPart_LocationViewEditMainDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/LocationViews/EditMainPV?id=' + selectedLocationViewID,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#divPageDetails").html(partialViewResult);
    });
}
//Attach : Edit Form Submit : Main
function AttachEventLocationViewEditForm() {
    $("#LocationViewEditForm").on("submit", function (event) {
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
        LoadPart_LocationViewEditMainDiv();
    });
};


//Get Edit : Map
function LoadPart_LocationViewEditMapDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/LocationViews/EditMapPV?id=' + selectedLocationViewID,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#divPageDetails").html(partialViewResult);
    });
}
//Attach : Edit Form Submit : Map
function AttachEventLocationViewMapEditForm() {
    $("#LocationViewMapEditForm").on("submit", function (event) {
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

    });
}



//Get Delete
function LoadPart_DialogLocationViewDelete() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/LocationViews/DeletePV?id=' + selectedLocationViewID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Locations Container
function LoadPart_LocationViewEditLocationsContainerDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locationviews/LocationsByLocationViewIDPV?locationViewID=' + selectedLocationViewID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divPageDetails").html(partialViewResult);
            AttachEventLocationsListPager();
        });
    return false;
};
//Get Locations List
function LoadPart_LocationViewEditLocationsDiv() {
    var loadingpart = LoadDivLoading();
    $("#divLocationsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locationviews/LocationsByLocationViewIDListGridPV?searchfor=' + $(txtLocationsSearch).val() + '&locationViewID=' + selectedLocationViewID + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divLocationsList").html(partialViewResult);
            AttachEventLocationsListPager();
        });
    return false;
};


function getEditLocationViewMap(x, y, z) {
    map = new Microsoft.Maps.Map(document.getElementById('myMap')
       , {
           credentials: 'Aq96lGpMhTmC6x18TL2-qS4ccUYLNnc9IW6FSN5E1MW5O1td3LMyiYzEBi3w6S7f'
            , enableClickableLogo: false
            , enableSearchLogo: false
            , showDashboard: true
            , showMapTypeSelector: true
            , useInertia: true
           // ,disablePanning: true
           //, disableZooming: true
            , mapTypeId: Microsoft.Maps.MapTypeId.birdseye
            , center: new Microsoft.Maps.Location(x, y), zoom: z
       });

    var viewchangeend = Microsoft.Maps.Events.addHandler(map, 'viewchangeend', function (e) {
        onViewChangeEnd(e);
    });
}

function onViewChangeEnd(e) {
    var latlon = map.getCenter();
    $("#X").val(latlon.latitude);
    $("#Y").val(latlon.longitude);
    $("#Z").val(map.getZoom());
}


function AttachLocationToLocationView(LocationID) {
    $.ajax({
        url: getRootURL() + '/LocationViews/AttachLocation?locationViewID=' + selectedLocationViewID + '&locationID=' + LocationID + '&userID=0',
        type: "POST",
    })
    HideModal();
    LoadPart_LocationViewEditLocationsDiv();
}

function DeattachLocationFromLocationView(LocationID) {
    $.ajax({
        url: getRootURL() + '/LocationViews/DeAttachLocation?locationViewID=' + selectedLocationViewID + '&locationID=' + LocationID + '&userID=0',
        type: "POST",
    })
    LoadPart_LocationViewEditLocationsDiv();
}