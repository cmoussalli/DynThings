

//Get List
function LoadPart_EndPointIOsListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divEndPointIOsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPointIOs/ListPV?search=' + $(txtEndPointIOsSearch).val() + '&recordsperpage=0' + '&endPointID=1&ioTypeID=1',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divEndPointIOsList").html(partialViewResult);
        });
    return false;
};
