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
                window.location.href(getRootURL() + 'apps/details?id=' + resp.Reference)
            },
            done: function (resp){
                window.location.href(getRootURL() + 'apps/details?id=' + resp.Reference)
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

//Get Publish
function LoadPart_DialogAppPublish() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/PublishPV?id=' + selectedAppID,
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



//Get App EndpointTypes Container Div
function LoadPart_AppEndpointTypesContainerDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/EndpointTypesContainerPV',
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divPageDetails").html(partialViewResult);
        });
}
//Get App EndpointTypes List
function LoadPart_AppEndpointTypesListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divAppEndpointTypesList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/apps/EndpointTypesByAppIDListPV?searchfor=' + $(txtAppEndpointTypesSearch).val() + '&appID=' + selectedAppID + '&recordsperpage=0',
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divAppEndpointTypesList").html(partialViewResult);
            AttachEventAppEndpointTypesListPager();
        });
    return false;
};
//Attach : Pager
function AttachEventAppEndpointTypesListPager() {
    $(document).on("click", "#AppEndpointTypesListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divAppEndpointTypesList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtAppEndpointTypesSearch).val() + '&appID=' + selectedAppID + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divAppEndpointTypesList").html(result);
                return false;
            }
        });
        return false;
    });
}
//Get Add
function LoadPart_DialogAppEndpointTypeAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/apps/AddAppEndpointTypePV?appID=' + selectedAppID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#modal").html(partialViewResult);
        });
}
//Attach : Add Form Submit
function AttachEventAppEndpointTypeAddForm() {
    $("#AppEndpointTypeAddForm").on("submit", function (event) {
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
                LoadPart_AppEndpointTypesListDiv();
            },
            done: function (resp) {
                ServerResponse(resp);
                LoadPart_AppEndpointTypesListDiv();
            },
            error: function () {
                ServerResponse(resp);
                LoadPart_AppEndpointTypesListDiv();
            }
        })
        $('#mdl').modal('hide');
    });
};
//Get Edit
function LoadPart_DialogAppEndpointTypeEdit(appEndpointTypeID) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/apps/EditAppEndpointTypePV?appEndpointTypeID=' + appEndpointTypeID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#modal").html(partialViewResult);
        });
}
//Attach : Edit Form Submit
function AttachEventAppEndpointTypeEditForm() {
    $("#AppEndpointTypeEditForm").on("submit", function (event) {
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
                LoadPart_AppEndpointTypesListDiv();
            },
            done: function (resp) {
                ServerResponse(resp);
                LoadPart_AppEndpointTypesListDiv();
            },
            error: function () {
                ServerResponse(resp);
                LoadPart_AppEndpointTypesListDiv();
            }
        })
        $('#mdl').modal('hide');
    });
};
//Get Delete
function LoadPart_DialogAppEndpointTypeDelete(appEndpointTypeID) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/apps/DeleteAppEndpointTypePV?appEndpointTypeID=' + appEndpointTypeID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#modal").html(partialViewResult);
        });
}
//Attach : Delete Form Submit
function AttachEventAppEndpointTypeDeleteForm() {
    $("#AppEndpointTypeDeleteForm").on("submit", function (event) {
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
                LoadPart_AppEndpointTypesListDiv();
            },
            done: function (resp) {
                ServerResponse(resp);
                LoadPart_AppEndpointTypesListDiv();
            },
            error: function () {
                ServerResponse(resp);
                LoadPart_AppEndpointTypesListDiv();
            }
        })
        $('#mdl').modal('hide');
    });
};



//Get App ThingTypes Container Div
function LoadPart_AppThingTypesContainerDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/ThingTypesContainerPV',
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divPageDetails").html(partialViewResult);
        });
}
//Get App ThingTypes List
function LoadPart_AppThingTypesListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divAppThingTypesList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/apps/ThingTypesByAppIDListPV?searchfor=' + $(txtAppThingTypesSearch).val() + '&appID=' + selectedAppID + '&recordsperpage=0',
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divAppThingTypesList").html(partialViewResult);
            AttachEventAppThingTypesListPager();
        });
    return false;
};
//Attach : Pager
function AttachEventAppThingTypesListPager() {
    $(document).on("click", "#AppThingTypesListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divAppThingTypesList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtAppThingTypesSearch).val() + '&appID=' + selectedAppID + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divAppThingTypesList").html(result);
                return false;
            }
        });
        return false;
    });
}
//Get Add
function LoadPart_DialogAppThingTypeAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/apps/AddAppThingTypePV?appID=' + selectedAppID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#modal").html(partialViewResult);
        });
}
//Attach : Add Form Submit
function AttachEventAppThingCategoryAddForm() {
    $("#AppThingCategoryAddForm").on("submit", function (event) {
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
                LoadPart_AppThingTypesListDiv();
            },
            done: function (resp) {
                ServerResponse(resp);
                LoadPart_AppThingTypesListDiv();
            },
            error: function () {
                ServerResponse(resp);
                LoadPart_AppThingTypesListDiv();
            }
        })
        $('#mdl').modal('hide');
    });
};
//Get Edit
function LoadPart_DialogAppThingTypeEdit(appThingTypeID) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/apps/EditAppThingTypePV?appThingTypeID=' + appThingTypeID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#modal").html(partialViewResult);
        });
}
//Attach : Edit Form Submit
function AttachEventAppThingCategoryEditForm() {
    $("#AppThingCategoryEditForm").on("submit", function (event) {
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
                LoadPart_AppThingTypesListDiv();
            },
            done: function (resp) {
                ServerResponse(resp);
                LoadPart_AppThingTypesListDiv();
            },
            error: function () {
                ServerResponse(resp);
                LoadPart_AppThingTypesListDiv();
            }
        })
        $('#mdl').modal('hide');
    });
};
//Get Delete
function LoadPart_DialogAppThingTypeDelete(appThingTypeID) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/apps/DeleteAppThingTypePV?appThingTypeID=' + appThingTypeID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#modal").html(partialViewResult);
        });
}
//Attach : Delete Form Submit
function AttachEventAppThingCategoryDeleteForm() {
    $("#AppThingCategoryDeleteForm").on("submit", function (event) {
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
                LoadPart_AppThingTypesListDiv();
            },
            done: function (resp) {
                ServerResponse(resp);
                LoadPart_AppThingTypesListDiv();
            },
            error: function () {
                ServerResponse(resp);
                LoadPart_AppThingTypesListDiv();
            }
        })
        $('#mdl').modal('hide');
    });
};



//Get App ThingExtensions Container Div
function LoadPart_AppThingExtensionsContainerDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Apps/ThingExtensionsContainerPV',
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divPageDetails").html(partialViewResult);
        });
}
//Get App ThingExtensions List
function LoadPart_AppThingExtensionsListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divAppThingExtensionsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/apps/ThingExtensionsByAppIDListPV?searchfor=' + $(txtAppThingExtensionsSearch).val() + '&appID=' + selectedAppID + '&recordsperpage=0',
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divAppThingExtensionsList").html(partialViewResult);
            AttachEventAppThingExtensionsListPager();
        });
    return false;
};
//Attach : Pager
function AttachEventAppThingExtensionsListPager() {
    $(document).on("click", "#AppThingExtensionsListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divAppThingExtensionsList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtAppThingExtensionsSearch).val() + '&appID=' + selectedAppID + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divAppThingExtensionsList").html(result);
                return false;
            }
        });
        return false;
    });
}
//Get Add
function LoadPart_DialogAppThingExtensionAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/apps/AddAppThingExtensionPV?appID=' + selectedAppID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#modal").html(partialViewResult);
        });
}
//Attach : Add Form Submit
function AttachEventAppThingExtensionAddForm() {
    $("#AppThingExtensionAddForm").on("submit", function (event) {
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
                LoadPart_AppThingExtensionsListDiv();
            },
            done: function (resp) {
                ServerResponse(resp);
                LoadPart_AppThingExtensionsListDiv();
            },
            error: function () {
                ServerResponse(resp);
                LoadPart_AppThingExtensionsListDiv();
            }
        })
        $('#mdl').modal('hide');
    });
};
//Get Edit
function LoadPart_DialogAppThingExtensionEdit(appThingExtensionID) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/apps/EditAppThingExtensionPV?appThingExtensionID=' + appThingExtensionID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#modal").html(partialViewResult);
        });
}
//Attach : Edit Form Submit
function AttachEventAppThingExtensionEditForm() {
    $("#AppThingExtensionEditForm").on("submit", function (event) {
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
                LoadPart_AppThingExtensionsListDiv();
            },
            done: function (resp) {
                ServerResponse(resp);
                LoadPart_AppThingExtensionsListDiv();
            },
            error: function () {
                ServerResponse(resp);
                LoadPart_AppThingExtensionsListDiv();
            }
        })
        $('#mdl').modal('hide');
    });
};
//Get Delete
function LoadPart_DialogAppThingExtensionDelete(appThingExtensionID) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/apps/DeleteAppThingExtensionPV?appThingExtensionID=' + appThingExtensionID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#modal").html(partialViewResult);
        });
}
//Attach : Delete Form Submit
function AttachEventAppThingExtensionDeleteForm() {
    $("#AppThingExtensionDeleteForm").on("submit", function (event) {
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
                LoadPart_AppThingExtensionsListDiv();
            },
            done: function (resp) {
                ServerResponse(resp);
                LoadPart_AppThingExtensionsListDiv();
            },
            error: function () {
                ServerResponse(resp);
                LoadPart_AppThingExtensionsListDiv();
            }
        })
        $('#mdl').modal('hide');
    });
};