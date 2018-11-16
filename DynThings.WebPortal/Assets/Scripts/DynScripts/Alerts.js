//Vars
var selectedAlertID = 0;
var selectedAlertTitle = 0;


//Attach : Pager
function AttachEventAlertsListPager() {
    $(document).on("click", "#AlertsListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divAlertsList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtAlertSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divAlertsList").html(result);
                return false;
            }
        });
        return false;
    });
}

//Attach : Add Form Submit
function AttachEventAlertAddForm() {
    $("#AlertAddForm").on("submit", function (event) {
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
                LoadPart_AlertListDiv();
            },
            error: function () {
                ServerResponse(resp);
            }

        })

        LoadPart_AlertListDiv();
        $('#mdl').modal('hide');
    });
};

//Form Submit : Edit Main 
function SubmitAlertEditMainForm(AlertID) {
    var url = $('#AlertEditMainForm').attr("action");
    var formData = $('#AlertEditMainForm').serialize();
    $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: "json",
        success: function (resp) {
            ServerResponse(resp);
        },
        error: function (resp) {
            ServerResponse(resp);
        }
    })
    $('#mdl').modal('hide');
    LoadPart_AlertDetailsMainDiv(AlertID);
};

//Form Submit : Edit Schedule 
function SubmitAlertEditScheduleForm(AlertID) {
    var url = $('#AlertEditScheduleForm').attr("action");
    var formData = $('#AlertEditScheduleForm').serialize();
    $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: "json",
        success: function (resp) {
            ServerResponse(resp);
        },
        error: function (resp) {
            ServerResponse(resp);
        }
    })
    $('#mdl').modal('hide');
    LoadPart_AlertDetailsScheduleDiv(AlertID);
};

//Get List
function LoadPart_AlertListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divAlertsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Alerts/ListPV?searchfor=' + $(txtAlertSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divAlertsList").html(partialViewResult);
        });
    return false;
};

//Get Details
function LoadPart_AlertDetailsMainDiv(id) {
    var loadingpart = LoadDivLoading();
    $("#divAlertMain").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Alerts/DetailsMainPV?id=' + id,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#divAlertMain").html(partialViewResult);
    });
}
divAlertSchedule

//Get Details:Schedule
function LoadPart_AlertDetailsScheduleDiv(id) {
    var loadingpart = LoadDivLoading();
    $("#divAlertSchedule").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Alerts/DetailsSchedulePV?id=' + id,
        type: "GET"
    })
    .success(function (partialViewResult) {
        $("#divAlertSchedule").html(partialViewResult);
    });
}

//Get Add
function LoadPart_DialogAlertAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Alerts/addpv',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET"
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Edit: Main
function LoadPart_DialogAlertMainEdit(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Alerts/EditMainPV?id=' + id,
        type: "GET"
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Edit: Schedule
function LoadPart_DialogAlertScheduleEdit(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Alerts/EditSchedulePV?id=' + id,
        type: "GET"
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Delete
function LoadPart_DialogAlertDelete(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Alerts/DeletePV?id=' + id,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

function LoadAlertMainEditor(id) {
    LoadPart_DialogAlertMainEdit(id);
    LoadPart_AlertDetailsMainDiv(id);
}

//Conditions
//Get AlertCondition List
function LoadPart_AlertConditionsListDiv(alertID) {
    var loadingpart = LoadDivLoading();
    $("#divAlertConditions").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Alerts/AlertConditionsListPV?alertid=' + selectedAlertID + '&searchfor=' + $(txtAlertConditionSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divAlertConditions").html(partialViewResult);
        });
    return false;
};
//Attach Pager: AlertConditions List
function AttachEventAlertConditionsListPager() {
    $(document).on("click", "#AlertConditionsListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divAlertConditions").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtAlertConditionSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divAlertConditions").html(result);
                AttachEventAlertConditionsListPager();
                return false;
            }
        });
        return false;
    });
}
//Get AlertCondition Add
function LoadPart_DialogAlertConditionAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Alerts/AlertConditionAddPV',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}
//Get AlertCondition Edit
function LoadPart_DialogAlertConditionEdit(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Alerts/AlertConditionEditPV?id=' + id,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}
//Get AlertCondition Delete
function LoadPart_DialogAlertConditionDelete(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Alerts/AlertConditionDeletePV?id=' + id,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}
//Submit Form : Add AlertCondition
function SubmitAlertConditionAddForm() {
    var url = getRootURL() + 'Alerts/AlertConditionAddPV'
    var formData = $('#AlertConditionAddForm').serialize();
    $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: "json",
        success: function (resp) {
            ServerResponse(resp);
            LoadPart_AlertConditionsListDiv();
        },
        error: function (resp) {
            ServerResponse(resp);
        }
    })
    LoadPart_AlertConditionsListDiv();
    $('#mdl').modal('hide');
};
//Submit Form : Edit AlertCondition
function SubmitAlertConditionEditForm() {
    var url = getRootURL() + 'Alerts/AlertConditionEditPV'
    var formData = $('#AlertConditionEditForm').serialize();
    $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: "json",
        success: function (resp) {
            ServerResponse(resp);
            LoadPart_AlertConditionsListDiv();
        },
        error: function (resp) {
            ServerResponse(resp);
        }
    })
    LoadPart_AlertConditionsListDiv();
    $('#mdl').modal('hide');
};
//Submit Form : Delete AlertCondition
function SubmitAlertConditionDeleteForm() {
    var url = getRootURL() + 'Alerts/AlertConditionDeletePV'
    var formData = $('#AlertConditionDeleteForm').serialize();
    $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: "json",
        success: function (resp) {
            ServerResponse(resp);
            LoadPart_AlertConditionsListDiv();
        },
        error: function (resp) {
            ServerResponse(resp);
        }
    })
    LoadPart_AlertConditionsListDiv();
    $('#mdl').modal('hide');
};

//Users
//Get AlertUsers List
function LoadPart_AlertUsersListDiv(alertID) {
    var loadingpart = LoadDivLoading();
    $("#divAlertUsers").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Alerts/AlertUsersListPV?alertid=' + selectedAlertID + '&searchfor=' + $(txtAlertUserSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divAlertUsers").html(partialViewResult);
        });
    return false;
};
//Attach Pager: AlertUsers List
function AttachEventAlertUsersListPager() {
    $(document).on("click", "#AlertUsersListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divAlertUsers").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtAlertUserSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divAlertUsers").html(result);
                AttachEventAlertUsersListPager();
                return false;
            }
        });
        return false;
    });
}
//Attach AlertUser
function SubmitAlertUserAttach(alertID,userID ) {
    var loadingpart = LoadDivLoading();
    $.ajax({
        url: getRootURL() + 'Alerts/AlertUserAttach?alertID=' + alertID + '&userID=' + userID,
        type: 'POST',
        cache: false,
        success: function (result) {
            //ServerResponse(result);
            LoadPart_AlertUsersListDiv(alertID);
            $('#mdl').modal('hide');
            return false;
        }
    });
    return false;
};
//Detach AlertUser
function SubmitAlertUserDetach(alertID, userID) {
    var loadingpart = LoadDivLoading();
    $.ajax({
        url: getRootURL() + 'Alerts/AlertUserDetach?alertID=' + alertID + '&userID=' + userID,
        type: 'POST',
        cache: false,
        success: function (result) {
            //ServerResponse(result);
            LoadPart_AlertUsersListDiv(alertID);
            return false;
        }
    });
    return false;
};