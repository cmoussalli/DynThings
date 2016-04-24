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
            dataType: "json",
            success: function (resp) {
            }
        })
        //LoadPart_EndPointDetailsDiv(endPointID);
    });
};