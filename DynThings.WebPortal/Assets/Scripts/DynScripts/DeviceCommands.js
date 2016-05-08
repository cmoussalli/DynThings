//Attach : Pager
function AttachEventDeviceCommandsListPager() {
    $(document).on("click", "#DeviceCommandsListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divDeviceCommandsList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtDeviceCommandSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divDeviceCommandsList").html(result);
                return false;
            }
        });
        return false;
    });
};

//Attach : Add Form Submit
//TODO

//Attach : Edit Form Submit
function AttachEventDeviceCommandEditForm(deviceCommandID) {
    $("#DeviceCommandEditForm").on("submit", function (event) {
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

        LoadPart_DeviceCommandDetailsDiv(deviceCommandID);
        $('#mdl').modal('hide');
    });
}

//Get List
function LoadPart_DeviceCommandListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divDeviceCommandsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DeviceCommands/ListPV?searchfor=' + $(txtDeviceCommandSearch).val() + '&recordsperpage=0',
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divDeviceCommandsList").html(partialViewResult);
        });
    return false;
};

//Get Details
function LoadPart_DeviceCommandDetailsDiv(id) {
    var loadingpart = LoadDivLoading();
    $("#divCommandMain").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DeviceCommands/DetailsPV?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divCommandMain").html(partialViewResult);
    });
}

//Get Add
function LoadPart_DialogDeviceCommandAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DeviceCommands/addpv',
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Edit
function LoadPart_DialogDeviceCommandEdit(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DeviceCommands/editpv?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Delete
function LoadPart_DialogDeviceCommandDelete(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DeviceCommands/deletepv?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Execute
function LoadPart_DialogDeviceCommandExecute(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/DeviceCommands/executepv?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Button: Edit
function LoadDeviceCommandEditor(id) {
    LoadPart_DialogDeviceCommandEdit(id);
    LoadPart_DeviceCommandDetailsDiv(id);
}