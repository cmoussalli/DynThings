//Get List


function LoadPart_ThingCategoryListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divThingCategorysList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/ThingCategorys/ListPV?searchfor=' + $(txtThingCategorySearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divThingCategorysList").html(partialViewResult);
        });
    return false;
};

//Attach : Pager
function AttachEventThingCategorysListPager() {
    $(document).on("click", "#ThingCategorysListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divThingCategorysList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtThingCategorySearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divThingCategorysList").html(result);
                return false;
            }
        });
        return false;
    });
}

//Get Add
function LoadPart_DialogThingCategoryAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/ThingCategorys/addpv',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Attach : Add Form Submit
function AttachEventThingCategoryAddForm() {
    $("#ThingCategoryAddForm").on("submit", function (event) {
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
                LoadPart_ThingCategoryListDiv();
            },
            error: function () {
                ServerResponse(resp);
            }

        })

        LoadPart_ThingCategoryListDiv();
        $('#mdl').modal('hide');
    });
};

//Get Edit
function LoadPart_DialogThingCategoryEdit(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/ThingCategorys/editpv?id=' + id,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Attach : Edit Form Submit
function AttachEventThingCategoryEditForm(ThingCategoryID) {
    $("#ThingCategoryEditForm").on("submit", function (event) {
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
        LoadPart_ThingCategoryListDiv();
    });
};

//Get Delete
function LoadPart_DialogThingCategoryDelete(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/ThingCategorys/DeletePV?id=' + id,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}