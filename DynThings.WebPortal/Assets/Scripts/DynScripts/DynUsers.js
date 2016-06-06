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
        url: getRootURL() + '/DynUsers/GetPVDynUserRoles?DynUserID=' + DynUserID,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divDynUserRoles").html(partialViewResult);
    });
}