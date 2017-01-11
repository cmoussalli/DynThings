//Vars
var selectedAppID = 0;
var selectedAppTitle = 0;


//Attach : Pager
function AttachEventAppsListPager() {
    $(document).on("click", "#AppsListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divAppsList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtAppSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divAppsList").html(result);
                return false;
            }
        });
        return false;
    });
}

//Attach : Add Form Submit
function AttachEventAppAddForm() {
    $("#AppAddForm").on("submit", function (event) {
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
                LoadPart_AppListDiv();
            },
            error: function () {
                ServerResponse(resp);
            }

        })

        LoadPart_AppListDiv();
        $('#mdl').modal('hide');
    });
};



//Attach : Edit Form Submit
function AttachEventAppEditForm(AppID) {
    $("#AppEditForm").on("submit", function (event) {
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
        LoadPart_AppDetailsDiv(AppID);
    });
};

function AttachEventAppDevKeysEditForm(AppID) {
    $("#AppDevKeysEditForm").on("submit", function (event) {
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
        LoadPart_AppDevKeysDiv(AppID);
    });
};

//Get List
function LoadPart_AppListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divAppsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/ListPV?searchfor=' + $(txtAppSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divAppsList").html(partialViewResult);
        });
    return false;
};

//Get Details
function LoadPart_AppDetailsDiv(id) {
    var loadingpart = LoadDivLoading();
    $("#divAppMain").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/DetailsPV?id=' + id,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#divAppMain").html(partialViewResult);
    });
}

//Get Add
function LoadPart_DialogAppAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/addpv',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Edit
function LoadPart_DialogAppEdit(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/editpv?id=' + id,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Delete
function LoadPart_DialogAppDelete(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/DeletePV?id=' + id,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

function LoadAppEditor(id) {
    LoadPart_DialogAppEdit(id);
    LoadPart_AppDetailsDiv(id);
}

//Get History IOs
function LoadPart_AppHistoryDiv(AppID) {
    var loadingpart = LoadDivLoading();
    $("#SelectedAppID").val(AppID);
    $("#divAppHistory").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/GetPVAppHistory?AppID=' + AppID + '&page=1&recordsPerPage=0',
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#divAppHistory").html(partialViewResult);
    });
}

//Get Commands
function LoadPart_AppCommandListByAppIDDiv(AppID, search) {
    var loadingpart = LoadDivLoading();
    $("#divAppCommandsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/AppCommandsListByAppIDPV?searchfor=' + search + '&AppID=' + AppID + '&recordsperpage=0',
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divAppCommandsList").html(partialViewResult);
        });
    return false;
}

//Get DevKeys
function LoadPart_AppDevKeysDiv(AppID) {
    var loadingpart = LoadDivLoading();
    $("#divAppDevkeys").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/DevKeysPV?ID=' + AppID,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divAppDevkeys").html(partialViewResult);
        });
    return false;
}

//Get Edit DevKeys
function LoadPart_DialogAppDevKeysEdit(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/EditDevKeysPV?id=' + id,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}


//Lookup
//LoadPart_App Lookup
function LoadPart_AppLookup(placeHolder) {
    var loadingpart = LoadDivLoading();
    $(placeHolder).html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/LookupPV',
        type: "GET",
    })
    .success(function (partialViewResult) {
        $(placeHolder).html(partialViewResult);
    });
}
//Get Lookup List PV
function LoadPart_AppListLookupDiv() {
    var loadingpart = LoadDivLoading();
    $("#divAppsLookupList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/LookupListPV?searchfor=' + $(txtAppLookupSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divAppsLookupList").html(partialViewResult);
        });
    return false;
};
//Attach : Pager
function AttachEventAppsLookupListPager() {
    $(document).on("click", "#AppsLookupListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divAppsLookupList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtAppLookupSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divAppsLookupList").html(result);
                return false;
            }
        });
        return false;
    });
}
//Select from Lookup
function SelectAppFromLookUp(id, title) {
    selectedAppID = id;
    selectedAppTitle = title;
    EventSelectApp();
}

