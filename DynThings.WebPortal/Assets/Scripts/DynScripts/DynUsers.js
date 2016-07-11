//Vars
var selectedDynUserID = 0;

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