function Notify(notifyMessage) {
    $.notify({
        message: notifyMessage
    });
}

function NotifyWithTitle(notifyTitle, notifyMessage) {
    $.notify({
        title: '<strong>' + notifyTitle + '</strong>',
        message: notifyMessage
    });
}

function NotifyWithTitle(notifyTitle, notifyMessage) {
    $.notify({
        title: '<strong>' + notifyTitle + '</strong>',
        message: notifyMessage
    });
}

function NotifyWithImage(notifyMessage, notifyIcon) {
    $.notify({
        icon: notifyIcon,
        message: notifyMessage
    }, {
        icon_type: 'image'
    });
}


function NotifyReach() {
    var notify = $.notify('<strong>Saving</strong> Do not close this page...', {
        type: 'success',
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

