//Attach : Pager
function AttachEventLocationsListPager() {
    $(document).on("click", "#LocationsListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divLocationsList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtLocationSearch).val() + '&recordsperpage=0',
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
        url: getRootURL() + '/Locations/ListPV?searchfor=' + $(txtLocationSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divLocationsList").html(partialViewResult);
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