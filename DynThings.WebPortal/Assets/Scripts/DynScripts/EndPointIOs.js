

//Get List
function LoadPart_EndPointIOsListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divEndPointIOsList").html(loadingpart);
    var drpdwnIOTypeID = document.getElementById("IOTypeID");
    var selectedIOTypeID = drpdwnIOTypeID.options[drpdwnIOTypeID.selectedIndex].value;
    $.ajax({
        url: getRootURL() + '/EndPointIOs/ListPV?search=' + $(txtEndPointIOsSearch).val() + '&recordsperpage=0' + '&endPointID=' + $(txtEndPointIDSearch).val() + '&ioTypeID=' + $(IOTypeID).val(),
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divEndPointIOsList").html(partialViewResult);
            AttachEventEndPointIOsListPager();
        });
    return false;
};


//Attach : Pager
function AttachEventEndPointIOsListPager() {
    $(document).on("click", "#EndPointIOsListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divEndPointIOsList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&search=" + $(txtEndPointIOsSearch).val() + '&recordsperpage=0' + '&endPointID=' + $(txtEndPointIDSearch).val() + '&ioTypeID=' + $(IOTypeID).val(),
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divEndPointIOsList").html(result);
                return false;
            }
        });
        return false;
    });
}