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