//Get List


function LoadPart_MediaFileListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divMediaFilesList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/MediaFiles/ListPV?searchfor=' + $(txtMediaFileSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divMediaFilesList").html(partialViewResult);
        });
    return false;
};

//Attach : Pager
function AttachEventMediaFilesListPager() {
    $(document).on("click", "#MediaFilesListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divMediaFilesList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtMediaFileSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divMediaFilesList").html(result);
                return false;
            }
        });
        return false;
    });
}

//Get Add
function LoadPart_DialogMediaFileAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/MediaFiles/addpv',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Attach : Add Form Submit
function AttachEventMediaFileAddForm() {
    $("#MediaFileAddForm").on("submit", function (event) {
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
                LoadPart_MediaFileListDiv();
            },
            error: function () {
                ServerResponse(resp);
            }

        })

        LoadPart_MediaFileListDiv();
        $('#mdl').modal('hide');
    });
};

//Get Edit
function LoadPart_DialogMediaFileEdit(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/MediaFiles/editpv?id=' + id,
        type: "GET",
    })
    .success(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Attach : Edit Form Submit
function AttachEventMediaFileEditForm(MediaFileID) {
    $("#MediaFileEditForm").on("submit", function (event) {
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
        LoadPart_MediaFileListDiv();
    });
};

//Get Delete
function LoadPart_DialogMediaFileDelete(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/MediaFiles/DeletePV?id=' + id,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}