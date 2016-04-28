var notifyTypeStr = "";

function GetNotifyTypeByCode(code) {
    var notifyTypeStr = 'info';
    switch (code) {
        case 's':
            notifyTypeStr = 'success';
            break;
        case 'w':
            notifyTypeStr = 'warning';
            break;
        case 'd':
            notifyTypeStr = 'danger';
            break;
        case 'i':
            notifyTypeStr = 'info';
            break;
    }
    return notifyTypeStr;
}

function Notify(notifyType, notifyMessage) {
    $.notify({
        message: notifyMessage
    }, {
        type: GetNotifyTypeByCode(notifyType)
    });
}

function NotifyWithTitle(notifyType, notifyTitle, notifyMessage) {
    $.notify({
        title: '<strong>' + notifyTitle + '</strong>',
        message: notifyMessage
    }, {
        type: GetNotifyTypeByCode(notifyType)
    });
}


function NotifyWithImage(notifyType, notifyMessage, notifyIcon) {
    $.notify({
        icon: notifyIcon,
        message: notifyMessage
    }, {
        icon_type: 'image',
        type: GetNotifyTypeByCode(notifyType)
    });
}


function NotifyReach() {
    var notify = $.notify('<strong>Saving</strong> Do not close this page...', {
        type: GetNotifyTypeByCode(notifyType),
        allow_dismiss: false,
        showProgressbar: true
    });

    setTimeout(function () {
        notify.update('message', '<strong>Saving</strong> Page Data.');
    }, 1000);

    setTimeout(function () {
        notify.update('message', '<strong>Saving</strong> User Data.');
    }, 2000);

    setTimeout(function () {
        notify.update('message', '<strong>Saving</strong> Profile Data.');
    }, 3000);

    setTimeout(function () {
        notify.update('message', '<strong>Checking</strong> for errors.');
    }, 4000);

}

