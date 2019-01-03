
class GVAR(create_user) {
    idd = IDD_create_user;
    enableSimulation = 1;
    movingEnable = 0;
    onLoad = QUOTE([ARR_2(QQGVAR(create_user),_this)] call FUNC(onCreateUserLoad));

    class controlsBackground {
        class Title: GVAR(title_center) {
            idc = 1000;
            text = "User Creation"; //--- ToDo: Localize;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.402187 * safezoneW;
            h = 0.11 * safezoneH;
            sizeEx = 0.18;
        };

        class RemarkText: RscStructuredText {
            idc = 1100;
            text = "<t size=""0.75"">*the username and password given in this formular is used to create a webinterface user for this server. This webinterface is reachable under https://internet.eisengrind.de/</t>"; //--- ToDo: Localize;
            x = 0.134582 * safezoneW;
            y = 0.445556 * safezoneH;
            w = 0.266563 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };

        class NoticeText: RscStructuredText {
            idc = 1101;
            text = "<t size='1.4' shadow='0' font='RobotoCondensed'>Notice:</t><br /><t size='1.1' shadow='0'>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores </t>"; //--- ToDo: Localize;
            x = 0.211406 * safezoneW;
            y = 0.10537 * safezoneH;
            w = 0.185781 * safezoneW;
            h = 0.31263 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
    };

    class controls {
        class CompleteButton: GVAR(next_button) {
            idc = 1602;
            text = "Complete"; //--- ToDo: Localize;
            onButtonClick = QUOTE([ARR_2('CompleteButton',_this)] call FUNC(onCreateUserButtonClick));
            x = 0.319531 * safezoneW + safezoneX;
            y = 0.665 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class SteamID64Text: RscText {
            idc = 1400;
            x = 0.0670312 * safezoneW;
            y = 0.121 * safezoneH;
            w = 0.12875 * safezoneW;
            h = 0.0383334 * safezoneH;
            colorText[] = {RGBA_PRIMARY_COLOR};
            font = "RobotoCondensed";
            shadow = 0;
            sizeEx = 0.04;
        };

        class SteamID64Title: GVAR(input_title) {
            idc = 1001;
            text = "SteamID64"; //--- ToDo: Localize;
            x = 0.0670312 * safezoneW;
            y = 0.099 * safezoneH;
            w = 0.128906 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = 0.7 * GUI_GRID_H;
        };

        class SteamID64Line: GVAR(input_line) {
            idc = 1002;
            x = 0.0670312 * safezoneW;
            y = 0.162222 * safezoneH;
            w = 0.128906 * safezoneW;
            h = 0.000925925 * safezoneH;
            colorBackground[] = {1,1,1,0.5};
        };

        class UsernameTitle: GVAR(input_title) {
            idc = 1003;
            text = "Username*"; //--- ToDo: Localize;
            x = 0.0670312 * safezoneW;
            y = 0.176 * safezoneH;
            w = 0.128906 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = 0.7 * GUI_GRID_H;
        };

        class UsernameEdit: GVAR(input) {
            idc = 1401;
            onLoad = QUOTE([ARR_2('UsernameEdit',_this)] call FUNC(onCreateUserLoad));
            onSetFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateUserSetFocus));
            onKillFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateUserKillFocus));
            x = 0.0670312 * safezoneW;
            y = 0.198 * safezoneH;
            w = 0.12875 * safezoneW;
            h = 0.0383334 * safezoneH;
        };

        class UsernameLine: GVAR(input_line) {
            idc = 1004;
            x = 0.0677083 * safezoneW;
            y = 0.239815 * safezoneH;
            w = 0.128906 * safezoneW;
            h = 0.000925925 * safezoneH;
            colorBackground[] = {1,1,1,1};
        };

        class PasswordTitle: GVAR(input_title) {
            idc = 1005;
            text = "Password*"; //--- ToDo: Localize;
            x = 0.0670312 * safezoneW;
            y = 0.264 * safezoneH;
            w = 0.128906 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = 0.7 * GUI_GRID_H;
        };

        class RepeatPasswordTitle: GVAR(input_title) {
            idc = 1006;
            text = "Repeat Password*"; //--- ToDo: Localize;
            x = 0.0670312 * safezoneW;
            y = 0.352 * safezoneH;
            w = 0.128906 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = 0.7 * GUI_GRID_H;
        };

        class PasswordEdit: GVAR(input) {
            idc = 1402;
            onLoad = QUOTE([ARR_2('PasswordEdit',_this)] call FUNC(onCreateUserLoad));
            onSetFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateUserSetFocus));
            onKillFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateUserKillFocus));
            x = 0.0670312 * safezoneW;
            y = 0.286 * safezoneH;
            w = 0.12875 * safezoneW;
            h = 0.0383334 * safezoneH;
        };

        class PasswordLine: GVAR(input_line) {
            idc = 1007;
            x = 0.0677083 * safezoneW;
            y = 0.326852 * safezoneH;
            w = 0.128906 * safezoneW;
            h = 0.000925925 * safezoneH;
            colorBackground[] = {1,1,1,1};
        };

        class RepeatPasswordEdit: GVAR(input) {
            idc = 1403;
            onLoad = QUOTE([ARR_2('RepeatPasswordEdit',_this)] call FUNC(onCreateUserLoad));
            onSetFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateUserSetFocus));
            onKillFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateUserKillFocus));
            x = 0.0670312 * safezoneW;
            y = 0.374 * safezoneH;
            w = 0.12875 * safezoneW;
            h = 0.0383334 * safezoneH;
        };

        class RepeatPasswordLine: GVAR(input_line) {
            idc = 1008;
            x = 0.361458 * safezoneW + safezoneX;
            y = 0.639815 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.000925925 * safezoneH;
            colorBackground[] = {1,1,1,1};
        };
    };
};

/* #Cysaku
$[
    1.063,
    ["userCreate",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
    [1000,"Title",[1,"User Creation",["0.298906 * safezoneW + safezoneX","0.192 * safezoneH + safezoneY","0.402187 * safezoneW","0.11 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","4"],[]],
    [1602,"CompleteButton",[1,"Complete",["0.319531 * safezoneW + safezoneX","0.665 * safezoneH + safezoneY","0.103125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","1.2"],[]],
    [1100,"RemarkText",[1,"<t size=""0.7"">the username and password given in this formular is used to create a webinterface user for this server. This webinterface is reachable under https://internet.eisengrind.de/</t>",["0.134582 * safezoneW","0.445556 * safezoneH","0.266563 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0],[-1,-1,-1,-1],"","-1"],[]],
    [1400,"SteamID64Edit",[1,"",["0.0670312 * safezoneW","0.121 * safezoneH","0.12875 * safezoneW","0.0383334 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1001,"SteamID64Title",[1,"SteamID64",["0.0670312 * safezoneW","0.099 * safezoneH","0.128906 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],
    [1002,"SteamID64Line",[1,"",["0.0670312 * safezoneW","0.162222 * safezoneH","0.128906 * safezoneW","0.000925925 * safezoneH"],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],"","-1"],[]],
    [1003,"UsernameTitle",[1,"Username",["0.0670312 * safezoneW","0.176 * safezoneH","0.128906 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],
    [1401,"UsernameEdit",[1,"",["0.0670312 * safezoneW","0.198 * safezoneH","0.12875 * safezoneW","0.0383334 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1004,"UsernameLine",[1,"",["0.0677083 * safezoneW","0.239815 * safezoneH","0.128906 * safezoneW","0.000925925 * safezoneH"],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],"","-1"],[]],
    [1005,"PasswordTitle",[1,"Password",["0.0670312 * safezoneW","0.264 * safezoneH","0.128906 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],
    [1006,"RepeatPasswordTitle",[1,"Repeat Password",["0.0670312 * safezoneW","0.352 * safezoneH","0.128906 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],
    [1402,"PasswordEdit",[1,"",["0.0670312 * safezoneW","0.286 * safezoneH","0.12875 * safezoneW","0.0383334 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1007,"PasswordLine",[1,"",["0.0677083 * safezoneW","0.326852 * safezoneH","0.128906 * safezoneW","0.000925925 * safezoneH"],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],"","-1"],[]],
    [1403,"RepeatPasswordEdit",[1,"",["0.0670312 * safezoneW","0.374 * safezoneH","0.12875 * safezoneW","0.0383334 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1008,"RepeatPasswordLine",[1,"",["0.361458 * safezoneW + safezoneX","0.639815 * safezoneH + safezoneY","0.128906 * safezoneW","0.000925925 * safezoneH"],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],"","-1"],[]],
    [1101,"NoticeText",[1,"<t size='1.4' shadow='0' font='RobotoCondensed'>Notice:</t><br /><t size='1.1' shadow='0'>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores </t>",["0.211406 * safezoneW","0.10537 * safezoneH","0.185781 * safezoneW","0.31263 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0],[-1,-1,-1,-1],"","-1"],[]]
]
*/

