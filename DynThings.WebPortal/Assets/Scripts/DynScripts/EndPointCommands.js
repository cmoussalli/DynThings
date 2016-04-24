//Attach : Pager
function AttachEventEndPointCommandsListPager() {
    $(document).on("click", "#EndPointCommandsListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divEndPointCommandsList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtEndPointCommandSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divEndPointCommandsList").html(result);
                return false;
            }
        });
        return false;
    });
};

//Attach : Add Form Submit
//TODO

//Attach : Edit Form Submit
function AttachEventEndPointCommandEditForm(EndPointCommandID) {
    $("#EndPointCommandEditForm").on("submit", function (event) {
        event.preventDefault();
        var url = $(this).attr("action");
        var formData = $(this).serialize();
        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            dataType: "json",
            success: function (resp) {
            }
        })

        LoadPart_EndPointCommandDetailsDiv(EndPointCommandID);
        $('#mdl').modal('hide');
    });
}

//Get List
function LoadPart_EndPointCommandListDiv(search) {
    var loadingpart = LoadDivLoading();
    $("#divEndPointCommandsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPointCommands/ListPV?searchfor=' + search + '&recordsperpage=0',
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divEndPointCommandsList").html(partialViewResult);
        });
    return false;
};
//Get List By EndPointID
function LoadPart_EndPointCommandListByEndPointIDDiv(endPointID, search) {
    var loadingpart = LoadDivLoading();
    $("#divEndPointCommandsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/EndPointCommandsListByEndPointIDPV?searchfor=' + search + '&EndPointID=' + endPointID + '&recordsperpage=0',
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divEndPointCommandsList").html(partialViewResult);
        });
    return false;
}

//Get Details
function LoadPart_EndPointCommandDetailsDiv(id) {
    var loadingpart = LoadDivLoading();
    $("#divCommandMain").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPointCommands/DetailsPV?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divCommandMain").html(partialViewResult);
    });
}

//Get Add
function LoadPart_DialogEndPointCommandAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPointCommands/addpv',
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Edit
function LoadPart_DialogEndPointCommandEdit(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPointCommands/editpv?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Execute
function LoadPart_DialogEndPointCommandExecute(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPointCommands/executepv?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Button: Edit
function LoadEndPointCommandEditor(id) {
    LoadPart_DialogEndPointCommandEdit(id);
    LoadPart_EndPointCommandDetailsDiv(id);
}






