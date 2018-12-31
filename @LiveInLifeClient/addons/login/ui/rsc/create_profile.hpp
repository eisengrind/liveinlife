
class GVAR(create_profile) {
    idd = IDD_create_profile;
    enableSimulation = 1;
    movingEnable = 0;
    fade = 0.5;
    onLoad = QUOTE([ARR_2(QQGVAR(create_profile),_this)] call FUNC(onCreateProfileLoad));
    onUnload = QUOTE([ARR_2(QQGVAR(create_profile),_this)] call FUNC(onCreateProfileUnload));

    class controlsBackground {
        class Title: GVAR(title_center) {
            idc = 1000;
            text = "Profile Creation"; //--- ToDo: Localize;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.402187 * safezoneW;
            h = 0.11 * safezoneH;
            sizeEx = 0.18;
        };

        class SelectSexIcon: RscPicture {
            idc = 1200;
            text = PATHTOF(data\ui\step-1-icon.paa);
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.0148958 * safezoneW;
            h = 0.0265185 * safezoneH;
        };

        class SelectFaceIcon: RscPicture {
            idc = 1201;
            text = PATHTOF(data\ui\step-2-icon.paa);
            x = 0.469062 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.0148958 * safezoneW;
            h = 0.0265185 * safezoneH;
        };

        class CompleteIcon: RscPicture {
            idc = 1202;
            text = PATHTOF(data\ui\step-3-icon.paa);
            x = 0.634062 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.0148958 * safezoneW;
            h = 0.0265185 * safezoneH;
        };

        class SelectSexTitle: GVAR(title) {
            idc = 1001;
            text = "Geschlecht waehlen"; //--- ToDo: Localize;
            x = 0.308177 * safezoneW + safezoneX;
            y = 0.314852 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = 0.04;
        };

        class SelectFaceTitle: GVAR(title) {
            idc = 1002;
            text = "Gesicht waehlen"; //--- ToDo: Localize;
            x = 0.482968 * safezoneW + safezoneX;
            y = 0.314852 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = 0.04;
        };

        class CompleteTitle: GVAR(title) {
            idc = 1003;
            text = "Abschliessen"; //--- ToDo: Localize;
            x = 0.647656 * safezoneW + safezoneX;
            y = 0.314852 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = 0.04;
        };

        class FaceCompleteLine: GVAR(input_line) {
            idc = 1004;
            x = 0.554114 * safezoneW + safezoneX;
            y = 0.327704 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.000925926 * safezoneH;
            colorBackground[] = {1,1,1,1};
        };

        class SexFaceLine: GVAR(input_line) {
            idc = 1005;
            x = 0.39323 * safezoneW + safezoneX;
            y = 0.327704 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.000925926 * safezoneH;
            colorBackground[] = {1,1,1,1};
        };
    };

    class controls {
        class SexButton: RscButton {
            idc = 1600;
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            x = 0.291146 * safezoneW + safezoneX;
            y = 0.304778 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.044 * safezoneH;
            onButtonClick = QUOTE([ARR_2('SelectSexButton',_this)] call FUNC(onCreateProfileButtonClick));
        };

        class FaceButton: RscButton {
            idc = 1601;
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackground[] = {0,0,0,0};
            x = 0.463801 * safezoneW + safezoneX;
            y = 0.304667 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.044 * safezoneH;
            onButtonClick = QUOTE([ARR_2('SelectFaceButton',_this)] call FUNC(onCreateProfileButtonClick));
        };

        class SelectSexGroup: RscControlsGroup {
            idc = 2300;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.402187 * safezoneW;
            h = 0.407 * safezoneH;

            class Controls {
                class MaleCheckbox: GVAR(checkbox) {
                    idc = 2800;
                    onCheckedChanged = QUOTE([ARR_2('MaleCheckbox',_this)] call FUNC(onCreateProfileCheckedChanged));
                    x = 0.108281 * safezoneW;
                    y = 0.11 * safezoneH;
                    w = 0.0464063 * safezoneW;
                    h = 0.077 * safezoneH;
                };

                class FemaleCheckbox: GVAR(checkbox) {
                    idc = 2801;
                    onCheckedChanged = QUOTE([ARR_2('FemaleCheckbox',_this)] call FUNC(onCreateProfileCheckedChanged));
                    x = 0.2475 * safezoneW;
                    y = 0.11 * safezoneH;
                    w = 0.0464063 * safezoneW;
                    h = 0.077 * safezoneH;
                };

                class MaleTitle: GVAR(title_center) {
                    idc = 1006;
                    text = "Maennlich"; //--- ToDo: Localize;
                    x = 0.077344 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.113437 * safezoneW;
                    h = 0.088 * safezoneH;
                    sizeEx = 0.055;
                };

                class FemaleTitle: GVAR(title_center) {
                    idc = 1007;
                    text = "Weiblich"; //--- ToDo: Localize;
                    x = 0.211406 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.113437 * safezoneW;
                    h = 0.088 * safezoneH;
                    sizeEx = 0.055;
                };

                class ContinueButton: GVAR(next_button) {
                    idc = 1602;
                    text = "Continue"; //--- ToDo: Localize;
                    x = 0.020625 * safezoneW;
                    y = 0.275 * safezoneH;
                    w = 0.103125 * safezoneW;
                    h = 0.044 * safezoneH;
                    colorBackground[] = {0.180392,0.588235,0.180392,1};
                    sizeEx = 0.04;
                    onButtonClick = QUOTE([ARR_2('SexContinueButton',_this)] call FUNC(onCreateProfileButtonClick));
                };
            };
        };

        class SelectFaceGroup: RscControlsGroup {
            idc = 2301;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.402187 * safezoneW;
            h = 0.407 * safezoneH;

            class Controls {
                class FaceR2S: RscPicture {
                    idc = 1203;
                    text = "";
                    x = 0.0515628 * safezoneW;
                    y = 0.055 * safezoneH;
                    w = pixelW * 210;
                    h = pixelH * 210;
                    colorBackground[] = {0.5,0.5,0.5,1};
                };

                class FacesList: GVAR(list) {
                    idc = 1500;
                    onLBSelChanged = QUOTE([ARR_2('FacesList',_this)] call FUNC(onCreateProfileLBSelChanged));
                    x = 0.20625 * safezoneW;
                    y = 0.055 * safezoneH;
                    w = 0.149531 * safezoneW;
                    h = 0.165 * safezoneH;
                };

                class ContinueButton: GVAR(next_button) {
                    idc = 1603;
                    text = "Continue"; //--- ToDo: Localize;
                    x = 0.020625 * safezoneW;
                    y = 0.308 * safezoneH;
                    w = 0.103125 * safezoneW;
                    h = 0.044 * safezoneH;
                    onButtonClick = QUOTE([ARR_2('FaceContinueButton',_this)] call FUNC(onCreateProfileButtonClick));
                    sizeEx = 0.04;
                };
            };
        };

        class CompleteGroup: RscControlsGroup {
            idc = 2302;
            x = 0.298904 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.402187 * safezoneW;
            h = 0.44 * safezoneH;

            class Controls {
                class CompleteButton: GVAR(next_button) {
                    idc = 1603;
                    text = "Complete"; //--- ToDo: Localize;
                    x = 0.015471 * safezoneW;
                    y = 0.385 * safezoneH;
                    w = 0.103125 * safezoneW;
                    h = 0.044 * safezoneH;
                    onButtonClick = QUOTE([ARR_2('CompleteButton',_this)] call FUNC(onCreateProfileButtonClick));
                    sizeEx = 0.04;
                };

                class FirstnameEdit: GVAR(input) {
                    idc = 1400;
                    onLoad = QUOTE([ARR_2('FirstnameEdit',_this)] call FUNC(onCreateProfileLoad));
                    onSetFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileSetFocus));
                    onKillFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileKillFocus));
                    x = 0.0556774 * safezoneW;
                    y = 0.066 * safezoneH;
                    w = 0.12875 * safezoneW;
                    h = 0.0383334 * safezoneH;
                };

                class MiddleNameEdit: GVAR(input) {
                    idc = 1401;
                    onLoad = QUOTE([ARR_2('MiddleNameEdit',_this)] call FUNC(onCreateProfileLoad));
                    onSetFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileSetFocus));
                    onKillFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileKillFocus));
                    x = 0.216042 * safezoneW;
                    y = 0.066 * safezoneH;
                    w = 0.128229 * safezoneW;
                    h = 0.0374074 * safezoneH;
                };

                class FirstnameTitle: GVAR(input_title) {
                    idc = 1008;
                    text = "Firstname"; //--- ToDo: Localize;
                    x = 0.056719 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.128906 * safezoneW;
                    h = 0.022 * safezoneH;
                    sizeEx = 0.03;
                };

                class MiddleNameTitle: GVAR(input_title) {
                    idc = 1009;
                    text = "Middle Name (optional)"; //--- ToDo: Localize;
                    x = 0.216563 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.128906 * safezoneW;
                    h = 0.022 * safezoneH;
                    sizeEx = 0.03;
                };

                class MiddleNameLine: GVAR(input_line) {
                    idc = 1010;
                    x = 0.216044 * safezoneW;
                    y = 0.104444 * safezoneH;
                    w = 0.128906 * safezoneW;
                    h = 0.000925926 * safezoneH;
                    colorBackground[] = {1,1,1,1};
                };

                class FirstnameLine: GVAR(input_line) {
                    idc = 1011;
                    x = 0.055627 * safezoneW;
                    y = 0.104444 * safezoneH;
                    w = 0.128906 * safezoneW;
                    h = 0.000925926 * safezoneH;
                    colorBackground[] = {1,1,1,1};
                };

                class LastnameEdit: GVAR(input) {
                    idc = 1402;
                    onLoad = QUOTE([ARR_2('LastnameEdit',_this)] call FUNC(onCreateProfileLoad));
                    onSetFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileSetFocus));
                    onKillFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileKillFocus));
                    x = 0.139219 * safezoneW;
                    y = 0.152852 * safezoneH;
                    w = 0.12375 * safezoneW;
                    h = 0.0376297 * safezoneH;
                };

                class LastnameTitle: GVAR(input_title) {
                    idc = 1012;
                    text = "Lastname"; //--- ToDo: Localize;
                    x = 0.139219 * safezoneW;
                    y = 0.132 * safezoneH;
                    w = 0.12375 * safezoneW;
                    h = 0.022 * safezoneH;
                    sizeEx = 0.03;
                };

                class LastnameLine: GVAR(input_line) {
                    idc = 1013;
                    x = 0.139221 * safezoneW;
                    y = 0.192444 * safezoneH;
                    w = 0.12375 * safezoneW;
                    h = 0.000925926 * safezoneH;
                    colorBackground[] = {1,1,1,1};
                };

                class BirthdayTitle: GVAR(input_title) {
                    idc = 1014;
                    text = "Birthday"; //--- ToDo: Localize;
                    x = 0.138698 * safezoneW;
                    y = 0.216296 * safezoneH;
                    w = 0.12375 * safezoneW;
                    h = 0.022 * safezoneH;
                    sizeEx = 0.03;
                };

                class DayCombo: GVAR(combo) {
                    idc = 2100;
                    onLoad = QUOTE([ARR_2('DayCombo',_this)] call FUNC(onCreateProfileLoad));
                    onSetFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileSetFocus));
                    onKillFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileKillFocus));
                    x = 0.139219 * safezoneW;
                    y = 0.242 * safezoneH;
                    w = 0.0257812 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class MonthCombo: GVAR(combo) {
                    idc = 2101;
                    onLoad = QUOTE([ARR_2('MonthCombo',_this)] call FUNC(onCreateProfileLoad));
                    onSetFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileSetFocus));
                    onKillFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileKillFocus));
                    onLBSelChanged = QUOTE([ARR_2('MonthCombo',_this)] call FUNC(onCreateProfileLBSelChanged));
                    x = 0.166563 * safezoneW;
                    y = 0.242 * safezoneH;
                    w = 0.0592708 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class YearCombo: GVAR(combo) {
                    idc = 2102;
                    onLoad = QUOTE([ARR_2('YearCombo',_this)] call FUNC(onCreateProfileLoad));
                    onSetFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileSetFocus));
                    onKillFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileKillFocus));
                    onLBSelChanged = QUOTE([ARR_2('YearCombo',_this)] call FUNC(onCreateProfileLBSelChanged));
                    x = 0.228385 * safezoneW;
                    y = 0.242 * safezoneH;
                    w = 0.0345833 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class DayLine: GVAR(input_line) {
                    idc = 1015;
                    x = 0.139742 * safezoneW;
                    y = 0.268519 * safezoneH;
                    w = 0.0252604 * safezoneW;
                    h = 0.000925926 * safezoneH;
                    colorBackground[] = {1,1,1,1};
                };

                class MonthLine: GVAR(input_line) {
                    idc = 1016;
                    x = 0.167085 * safezoneW;
                    y = 0.268463 * safezoneH;
                    w = 0.0588021 * safezoneW;
                    h = 0.000925926 * safezoneH;
                    colorBackground[] = {1,1,1,1};
                };

                class YearLine: GVAR(input_line) {
                    idc = 1017;
                    x = 0.228908 * safezoneW;
                    y = 0.268519 * safezoneH;
                    w = 0.034323 * safezoneW;
                    h = 0.000925926 * safezoneH;
                    colorBackground[] = {1,1,1,1};
                };

                class OriginCountryTitle: GVAR(input_title) {
                    idc = 1018;
                    text = "Origin Country"; //--- ToDo: Localize;
                    x = 0.056719 * safezoneW;
                    y = 0.297 * safezoneH;
                    w = 0.12375 * safezoneW;
                    h = 0.022 * safezoneH;
                    sizeEx = 0.03;
                };

                class EntryReasonTitle: GVAR(input_title) {
                    idc = 1019;
                    text = "Reason for entry"; //--- ToDo: Localize;
                    x = 0.216563 * safezoneW;
                    y = 0.297 * safezoneH;
                    w = 0.12375 * safezoneW;
                    h = 0.022 * safezoneH;
                    sizeEx = 0.03;
                };

                class EntryReasonEdit: GVAR(input) {
                    idc = 1403;
                    onLoad = QUOTE([ARR_2('EntryReasonEdit',_this)] call FUNC(onCreateProfileLoad));
                    onSetFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileSetFocus));
                    onKillFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileKillFocus));
                    x = 0.221719 * safezoneW;
                    y = 0.319 * safezoneH;
                    w = 0.128229 * safezoneW;
                    h = 0.0374074 * safezoneH;
                };

                class EntryReasonLine: GVAR(input_line) {
                    idc = 1020;
                    x = 0.221929 * safezoneW;
                    y = 0.355964 * safezoneH;
                    w = 0.128906 * safezoneW;
                    h = 0.000925926 * safezoneH;
                    colorBackground[] = {1,1,1,1};
                };

                class OriginCountryCombo: GVAR(combo) {
                    idc = 2103;
                    onLoad = QUOTE([ARR_2('OriginCountryCombo',_this)] call FUNC(onCreateProfileLoad));
                    onSetFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileSetFocus));
                    onKillFocus = QUOTE([ARR_2(QQGVAR(input_complete),_this)] call FUNC(onCreateProfileKillFocus));
                    x = 0.0577617 * safezoneW;
                    y = 0.32537 * safezoneH;
                    w = 0.12375 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class OriginCountryLine: GVAR(input_line) {
                    idc = 1021;
                    x = 0.056825 * safezoneW;
                    y = 0.355963 * safezoneH;
                    w = 0.128906 * safezoneW;
                    h = 0.000925926 * safezoneH;
                    colorBackground[] = {1,1,1,1};
                };
            };
        };
    };
};

