//Get List


function LoadPart_EndPointTypeListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divEndPointTypesList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPointTypes/ListPV?searchfor=' + $(txtEndPointTypeSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divEndPointTypesList").html(partialViewResult);
        });
    return false;
};

//Attach : Pager
function AttachEventEndPointTypesListPager() {
    $(document).on("click", "#EndPointTypesListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divEndPointTypesList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtEndPointTypeSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divEndPointTypesList").html(result);
                return false;
            }
        });
        return false;
    });
}

//Get Add
function LoadPart_DialogEndPointTypeAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPointTypes/addpv',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Attach : Add Form Submit
function AttachEventEndPointTypeAddForm() {
    $("#EndPointTypeAddForm").on("submit", function (event) {
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
                LoadPart_EndPointTypeListDiv();
            },
            error: function () {
                ServerResponse(resp);
            }

        })

        LoadPart_EndPointTypeListDiv();
        $('#mdl').modal('hide');
    });
};

//Get Edit
function LoadPart_DialogEndPointTypeEdit(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPointTypes/editpv?id=' + id,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Attach : Edit Form Submit
function AttachEventEndPointTypeEditForm(EndPointTypeID) {
    $("#EndPointTypeEditForm").on("submit", function (event) {
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
        LoadPart_EndPointTypeListDiv();
    });
};

//Get Delete
function LoadPart_DialogEndPointTypeDelete(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPointTypes/DeletePV?id=' + id,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}