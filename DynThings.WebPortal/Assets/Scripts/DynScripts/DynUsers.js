//Vars
var selectedDynUserID = 0;
var selectedDynUserUserName = '';

//Attach : Pager
function AttachEventDynUsersListPager() {
    $(document).on("click", "#DynUsersListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divDynUsersList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtDynUserSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divDynUsersList").html(result);
                return false;
            }
        });
        return false;
    });
}


//Attach : Edit Form Submit
function AttachEventDynUserEditForm() {
    $("#DynUserEditForm").on("submit", function (event) {
        event.preventDefault();
        var url = $(this).attr("action");
        var formData = $(this).serialize();
        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            dataType: "json",
            success: function (resp) {
                //ServerResponse(resp);
                $('#mdl').modal('hide');
                LoadPart_DynUserMainDiv();
            },
            error: function () {
                $('#mdl').modal('hide');
                LoadPart_DynUserMainDiv();
            }
        })
        $('#mdl').modal('hide');
        LoadPart_DynUserMainDiv();
    });
};


//Get List
function LoadPart_DynUserListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divDynUsersList").html(loadingpart);
    $.ajax({
        url: getRootURL() + 'DynUsers/ListCardsPV?searchfor=' + $(txtDynUserSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divDynUsersList").html(partialViewResult);
        });
    return false;
};

//Get Main
function LoadPart_DynUserMainDiv() {
    var loadingpart = LoadDivLoading();
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DynUsers/DetailsPV?id=' + selectedDynUserID,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#divPageDetails").html(partialViewResult);
    });
}

//Get User Roles
function LoadPart_DynUserRolesDiv() {
    var loadingpart = LoadDivLoading();
    $("#SelectedDynUserID").val(selectedDynUserID);
    $("#divPageDetails").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DynUsers/GetDynUserRolesPV?DynUserID=' + selectedDynUserID,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divPageDetails").html(partialViewResult);
    });
}


//Get Attach Role
function LoadPart_DialogDynUserRoleAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DynUsers/AttachRole?userID=' + selectedDynUserID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",

    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}


//Get Edit
function LoadPart_DialogDynUserEdit() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DynUsers/editpv?id=' + selectedDynUserID,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Delete
function LoadPart_DialogDynUserDelete() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DynUsers/deletepv?id=' + selectedDynUserID,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}


function AttachRoleToDynUser(UserID, RoleID) {
    $.ajax({
        url: getRootURL() + '/DynUsers/AttachRole?UserID=' + UserID + '&RoleID=' + RoleID,
        type: "POST",
        success: function (resp) {
            ServerResponse(resp);
            LoadPart_DynUserRolesDiv(UserID);
        },
        error: function () {
            ServerResponse(resp);
        }
    })
    HideModal();
    LoadPart_DynUserRolesDiv(UserID);
}



function DeattachRoleFromUser(UserID, RoleID) {
    $.ajax({
        url: getRootURL() + '/DynUsers/DeAttachRole?UserID=' + UserID + '&RoleID=' + RoleID,
        type: "POST",
        success: function (resp) {
            ServerResponse(resp);
            LoadPart_DynUserRolesDiv(UserID);
        },
        error: function () {
            ServerResponse(resp);
        }
    })
    LoadPart_DynUserRolesDiv(UserID);
}


//Lookup
//LoadPart_DynUser Lookup
function LoadPart_DynUserLookup(placeHolder) {
    var loadingpart = LoadDivLoading();
    $(placeHolder).html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DynUsers/LookupPV',
        type: "GET",
    })
    .success(function (partialViewResult) {
        $(placeHolder).html(partialViewResult);
    });
}
//Get Lookup List PV
function LoadPart_DynUserListLookupDiv() {
    var loadingpart = LoadDivLoading();
    $("#divDynUsersLookupList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DynUsers/LookupListPV?searchfor=' + $(txtDynUserLookupSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divDynUsersLookupList").html(partialViewResult);
        });
    return false;
};
//Attach : Pager
function AttachEventDynUsersLookupListPager() {
    $(document).on("click", "#DynUsersLookupListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divDynUsersLookupList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtDynUserLookupSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divDynUsersLookupList").html(result);
                return false;
            }
        });
        return false;
    });
}
//Select from Lookup
function SelectDynUserFromLookUp(id, userName) {
    selectedDynUserID = id;
    selectedDynUserUserName = userName;
    EventSelectDynUser();
}