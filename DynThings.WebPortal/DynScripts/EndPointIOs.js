

//Get List
function LoadPart_EndPointIOsListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divEndPointIOsList").html(loadingpart);
    var drpdwnIOTypeID = document.getElementById("IOTypeID");
    var selectedIOTypeID = drpdwnIOTypeID.options[drpdwnIOTypeID.selectedIndex].value;
    $.ajax({
        url: getRootURL() + '/EndPointIOs/ListPV?search=' + $(txtEndPointIOsSearch).val() + '&recordsperpage=0' + '&endPointID=' + $(txtEndPointIDSearch).val() + '&ioTypeID=' + selectedIOTypeID,
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divEndPointIOsList").html(partialViewResult);
        });
    return false;
};
