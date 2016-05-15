function LoadPart_ConfigDetailsMainDiv() {
    var loadingpart = LoadDivLoading();
    $("#divConfigMain").html(loadingpart);
    $.ajax({
        url: getRootURL() + 'Config/MainPV',
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divConfigMain").html(partialViewResult);
    });
}

function LoadPart_ConfigDetailsGridsDiv() {
    var loadingpart = LoadDivLoading();
    $("#divConfigGrids").html(loadingpart);
    $.ajax({
        url: getRootURL() + 'Config/GridsPV',
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divConfigGrids").html(partialViewResult);
    });
}

function LoadPart_ConfigDetailsDevModeDiv() {
    var loadingpart = LoadDivLoading();
    $("#divConfigDevMode").html(loadingpart);
    $.ajax({
        url: getRootURL() + 'Config/DevModePV',
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divConfigDevMode").html(partialViewResult);
    });
}


//Attach : Edit Form Submit : Grids
function AttachEventConfigGridsEditForm() {
    $("#ConfigGridsEditForm").on("submit", function (event) {
        event.preventDefault();
        var url = $(this).attr("action");
        var formData = $(this).serialize();
        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            dataType: "text",
            success: function (resp) {
                Notify('s','Saved', 'Configuration has been saved');
            },
            error: function () {
                NotifyWithTitle('d','Error','Configuration has not been saved');
            }
        })
        //LoadPart_EndPointDetailsDiv(endPointID);
    });
};

//Attach : Edit Form Submit : DevMode
function AttachEventConfigDevModeEditForm() {
    $("#ConfigDevModeEditForm").on("submit", function (event) {
        event.preventDefault();
        var url = $(this).attr("action");
        var formData = $(this).serialize();
        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            dataType: "text",
            success: function (resp) {
                Notify('s', 'Saved', 'Configuration has been saved');
            },
            error: function () {
                NotifyWithTitle('d', 'Error', 'Configuration has not been saved');
            }
        })
        //LoadPart_EndPointDetailsDiv(endPointID);
    });
};
