//Attach : Pager
function AttachEventDevicesListPager() {
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

//Attach : Add Form Submit
function AttachEventLocationViewAddForm(locationViewID) {
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
            }
        })

        LoadPart_LocationViewListDiv();
        $('#mdl').modal('hide');
    });
}

//Attach : Edit Form Submit
function AttachEventLocationViewEditForm(locationViewID) {
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
            }
        })

        LoadPart_LocationViewDetailsDiv(locationViewID);
        $('#mdl').modal('hide');
    });
}

//Get List
function LoadPart_LocationViewListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divLocationViewsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/LocationViews/ListCardsPV?searchfor=' + $(txtLocationViewSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divLocationViewsList").html(partialViewResult);
        });
    return false;
};

//Get Details
//TODO

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

//Get Edit
//TODO

//Button: Edit
//TODO

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
function LoadPart_MonitorEndPointMain(Guid) {
    var loadingpart = LoadDivLoading();
    $("#SelectedEndPointID").val(Guid);
    $("#divMonitorEndPointMain").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locationviews/GetPVLocationViewEndPointMain?guid=' + Guid,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divMonitorEndPointMain").html(partialViewResult);
    });
}

//Get EndPointHistory
function LoadPart_MonitorEndPointHistory(Guid) {
    var loadingpart = LoadDivLoading();
    $("#SelectedEndPointID").val(Guid);
    $("#divMonitorEndPointHistory").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locationviews/GetPVLocationViewEndPointHistory?guid=' + Guid,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divMonitorEndPointHistory").html(partialViewResult);
    });
}

//Get EndPointCommands
function LoadPart_MonitorEndPointCommands(guid) {
    var loadingpart = LoadDivLoading();
    $("#SelectedEndPointID").val(guid);
    $("#divEndPointCommandsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/locationviews/GetEndPointCommandsByEndPointGUIDPV?guid=' + guid,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divEndPointCommandsList").html(partialViewResult);
    });
}