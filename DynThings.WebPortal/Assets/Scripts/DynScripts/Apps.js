//Vars
var selectedAppID = 0;
var selectedAppTitle = 0;

//#region


//#endregion

//Attach : Pager
function AttachEventAppsListPager() {
    $(document).on("click", "#AppsListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divAppsList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtAppSearch).val() + '&appID=' + selectedAppID + '&recordsperpage=0',
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
        LoadPart_AppDetailsDiv(selectedAppID);
    });
};

function AttachEventAppDevKeysEditForm(AppID) {
    $("#AppApiEntityAttachForm").on("submit", function (event) {
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
function LoadPart_AppDetailsDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/DetailsPV?id=' + selectedAppID,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#divPageDetails").html(partialViewResult);
    });
}

//Get APIEntities
function LoadPart_AppAPIEntitiesDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/apps/AppApiEntitysListGridPV?searchfor=' + '&appID=' + selectedAppID + '&recordsperpage=25',
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#divPageDetails").html(partialViewResult);
    });
}

//Get Publish
function LoadPart_AppDetailsDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/DetailsPV?id=' + selectedAppID,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#divPageDetails").html(partialViewResult);
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
function LoadPart_DialogAppDelete() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/DeletePV?id=' + selectedAppID,
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

//Get ApiEntitys List
function LoadPart_AppApiEntitysByAppIDDiv() {
    var loadingpart = LoadDivLoading();
    $("#divAppApiEntitysList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/apps/AppApiEntitysListGridPV?searchfor=' + '&appID=' + selectedAppID + '&recordsperpage=25',
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divAppApiEntitysList").html(partialViewResult);
            AttachEventAppApiEntitysListPager();
        });
    return false;
}
//Attach : Pager
function AttachEventAppApiEntitysListPager() {
    $(document).on("click", "#AppAPIEntitysListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divAppApiEntitysList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + '&appID=' + selectedAppID + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divAppApiEntitysList").html(result);
                return false;
            }
        });
        return false;
    });
}
//Get Attach ApiEntitys
function LoadPart_DialogAppApiEntityAttach() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/AppApiEntityAttachPV?appid='+ selectedAppID,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}



//Post Attach ApiEntitys
function AttachEventAppApiEntityAttachForm() {
    $("#AppApiEntityAttachForm").on("submit", function (event) {
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
                LoadPart_AppAPIEntitiesDiv();
            },
            error: function () {
                ServerResponse(resp);
                LoadPart_AppAPIEntitiesDiv();
            }
        })
        LoadPart_AppAPIEntitiesDiv();
        $('#mdl').modal('hide');
    });
};

//Get DeAttach ApiEntitys
function LoadPart_DialogAppApiEntityDeAttach(appID, systemEntityID) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/AppApiEntityDeAttachPV?appid=' + appID + '&SystemEntityID=' + systemEntityID,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Post DeAttach ApiEntitys
function DeAttachEventAppApiEntityAttachForm() {
    $("#AppApiEntityDeAttachForm").on("submit", function (event) {
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
                LoadPart_AppAPIEntitiesDiv();
            },
            error: function () {
                ServerResponse(resp);
                LoadPart_AppAPIEntitiesDiv();
            }
        })
        LoadPart_AppAPIEntitiesDiv();
        $('#mdl').modal('hide');
    });
};