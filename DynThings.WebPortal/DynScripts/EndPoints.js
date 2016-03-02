//Attach : Pager
function AttachEventEndPointsListPager() {
    $(document).on("click", "#EndPointsListPager a[href]", function () {
        var loadingpart = LoadDivLoading();
        $("#divEndPointsList").html(loadingpart);
        $.ajax({
            url: $(this).attr("href") + "&searchfor=" + $(txtEndPointSearch).val() + '&recordsperpage=0',
            type: 'GET',
            cache: false,
            success: function (result) {
                $("#divEndPointsList").html(result);
                return false;
            }
        });
        return false;
    });
}

//Attach : Add Form Submit
//TODO

//Attach : Edit Form Submit
//TODO

//Get List
function LoadPart_EndPointListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divEndPointsList").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/ListPV?searchfor=' + $(txtEndPointSearch).val() + '&recordsperpage=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .done(function (partialViewResult) {
            $("#divEndPointsList").html(partialViewResult);
        });
    return false;
};

//Get Details
//TODO

//Get Add
function LoadPart_DialogEndPointAdd() {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/addpv',
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