
class CfgHints {
    class GVAR(normal) {
        title = ""; //if title == "" then no title is displayed
        color[] = {0.066, 0.729, 0.066, 1};
        colorBackground[] = {0, 0, 0, 0.4};
        sound = "defaultNotification";
    };

    class GVAR(warning) {
        title = "";
        sound = "defaultNotification";
        color[] = {0.921, 0.674, 0, 1};
        colorBackground[] = {0, 0, 0, 0.4};
    };

    class GVAR(error) {
        title = "";
        sound = "3DEN_notificationWarning";
        color[] = {0.819, 0.129, 0.129, 1};
        colorBackground[] = {0, 0, 0, 0.4};
    };
};
