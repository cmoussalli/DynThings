//Attach : Pager
function AttachEventDevicesListPager() {
    $(document).on("click", "#DevicesListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divDevicesList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtDeviceSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divDevicesList").html(result);
                return false;
            }
        });
        return false;
    });
}

//Attach : Add Form Submit
function AttachEventDeviceAddForm() {
    $("#DeviceAddForm").on("submit", function (event) {
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

        LoadPart_DeviceListDiv();
        $('#mdl').modal('hide');
    });
}

//Attach : Edit Form Submit
function AttachEventDeviceEditForm(deviceID) {
    $("#DeviceEditForm").on("submit", function (event) {
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
        LoadPart_DeviceDetailsDiv(deviceID);
        $('#mdl').modal('hide');
    });
}

//Get List
function LoadPart_DeviceListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divDevicesList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Devices/GetListPV?searchfor=' + $(txtDeviceSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divDevicesList").html(partialViewResult);
        });
    return false;
};

//Get Details
//TODO

//Get Add
function LoadPart_DialogDeviceAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/Devices/addpv',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

//Get Edit
//TODO

//Button: Edit
//TODO