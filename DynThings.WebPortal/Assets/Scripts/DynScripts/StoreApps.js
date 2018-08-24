

//Get List
function LoadPart_CentralAppsListPV() {
    var loadingpart = LoadDivLoading();
    $("#divStoreAppsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/StoreApps/ListPV?searchfor=' + $(txtCentralAppsSearch).val() + '&recordsperpage=10',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divStoreAppsList").html(partialViewResult);
        });
    return false;
};

//Get SideInfo
function LoadPart_CentralAppSideInfoPV(guid) {
    var loadingpart = LoadDivLoading();
    $("#divStoreAppDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/StoreApps/GetAppByguidPV?guid=' + guid,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divStoreAppDetails").html(partialViewResult);
        });
    return false;
};

//Get SideInfo StoreApp Actions
function LoadPart_CentralAppActionsPV(guid) {
    var loadingpart = LoadDivProgressBar();
    $("#divStoreAppActions").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/StoreApps/GetAppActionsByGUIDPV?guid=' + guid,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divStoreAppActions").html(partialViewResult);
        });
    return false;
};

//Install or Update StoreApp
function Act_InstallOrUpdateAppByGUIDPV(guid) {
    var loadingpart = LoadDivProgressBar();
    $("#divStoreAppActions").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/StoreApps/InstallOrUpdateAppByGUIDPV?guid=' + guid,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divStoreAppActions").html(partialViewResult);
        });
    return false;
};