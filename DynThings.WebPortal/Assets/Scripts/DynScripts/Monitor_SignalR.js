function signalRReceive(cmd, message) {
    alert('recived: cms=' + cmd + '    message=' + message);
    switch (cmd) {
        case 'thingendInput':
            var res = message.split('_');
            LoadPart_MonitorThingEnd(res[0], res[1]);
            alert(res[0] + '  ' + res[1]);
            break;
        case 'thingendLog':
            LoadPart_MonitorThingLogsList();
            break;

    }
};