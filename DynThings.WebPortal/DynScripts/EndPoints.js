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
function AttachEventEndPointAddForm(){
    $("#EndPointAddForm").on("submit", function (event) {
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

        LoadPart_EndPointListDiv();
        $('#mdl').modal('hide');
    });
};

//Attach : Edit Form Submit
function AttachEventEndPointEditForm(endPointID){
    $("#EndPointEditForm").on("submit", function (event) {
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
        $('#mdl').modal('hide');
        LoadPart_EndPointDetailsDiv(endPointID);
    });
};

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
function LoadPart_EndPointDetailsDiv(id) {
    var loadingpart = LoadDivLoading();
    $("#divEndPointMain").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/DetailsPV?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divEndPointMain").html(partialViewResult);
    });
}

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
function LoadPart_DialogEndPointEdit(id) {
    var loadingpart = LoadDivLoading();
    $("#modal").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/editpv?id=' + id,
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#modal").html(partialViewResult);
    });
}

function LoadEndpointEditor(id) {
    LoadPart_DialogEndPointEdit(id);
    LoadPart_EndPointDetailsDiv(id);
}

//Get History IOs
function LoadPart_EndPointHistoryDiv(Guid) {
    var loadingpart = LoadDivLoading();
    $("#SelectedEndPointID").val(Guid);
    $("#divEndPointHistory").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/EndPoints/GetPVEndPointHistory?guid=' + Guid + '&pageNumber=1&recordsPerPage=0',
        type: "GET",
    })
    .done(function (partialViewResult) {
        $("#divEndPointHistory").html(partialViewResult);
    });
}

//Get Commands
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