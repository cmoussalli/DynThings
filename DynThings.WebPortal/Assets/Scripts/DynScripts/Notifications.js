//Var
var lastReceivedNotificationID = 0
var notificationsCount = 0;

//Get List
function LoadPart_UserNotificationsListDiv() {
    var loadingpart = LoadDivLoading();
    $("#divNotificationsArea").html(loadingpart);
    $.ajax({
        url: getRootURL() + '/UserNotifications/GetUnread?lastRecievedID=0',
        //page=" + $("#DynConfigCurrentPage").html,
        type: "GET",
    })
        .success(function (partialViewResult) {
            $("#divNotificationsArea").html(partialViewResult);
        });
    return false;
};

//API: Get Notifications Count
function API_GetNotificationsCount() {
    $.ajax({
        url: getRootURL() + '/api/Notifications/GetNotifications?lastNotificationID=' + lastReceivedNotificationID,
        type: "GET",
    })
        .success(function (partialViewResult) {
            if(partialViewResult.Message != 0)
            {
                LoadPart_UserNotificationsListDiv();
            }
        });
    return false;
};

//Set Notification as Read
function SetNotificationAsRead(notificationID) {
    var url = getRootURL() + 'UserNotifications/SetNotificationAsRead?id=' + notificationID
    $.ajax({
        url: url,
        type: "POST",
        success: function (resp) {
        },
        error: function (resp) {
        }
    })
    $('#divNotification_' + notificationID).hide();
    $('#lblNotificationsCount').text(notificationsCount - 1);

};