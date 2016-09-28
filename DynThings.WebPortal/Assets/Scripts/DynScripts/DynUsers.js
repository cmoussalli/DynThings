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

//Get Details
function LoadPart_DynUserDetailsDiv(id) {
    var loadingpart = LoadDivLoading();
    $("#divDynUserMain").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DynUsers/DetailsPV?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divDynUserMain").html(partialViewResult);
    });
}

//Get User Roles
function LoadPart_DynUserRolesDiv(DynUserID) {
    var loadingpart = LoadDivLoading();
    $("#SelectedDynUserID").val(DynUserID);
    $("#divDynUserRoles").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DynUsers/GetDynUserRolesPV?DynUserID=' + DynUserID,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divDynUserRoles").html(partialViewResult);
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
function LoadPart_DialogDynUserEdit(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DynUsers/editpv?id=' + id,
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