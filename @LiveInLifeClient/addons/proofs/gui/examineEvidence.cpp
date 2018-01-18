
class lilcm_proofs_examineEvidence {
    idd = 2306;
    name = "lilcm_proofs_examineEvidence";
    movingEnable = 1;
    enableSimulation = 1;

    class controlsBackground {
        class TitleTitle: RscText {
            idc = 1000;
            moving = 1;
            text = "Beweise untersuchen"; //--- ToDo: Localize;
            x = 0.381407 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };
        class FrameBackground: RscText {
            idc = 1001;
            x = 0.381407 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.352 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.8};
        };
    };
    class controls {
        class ListEvidence: RscListbox {
            idc = 1500;
            x = 0.386562 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.271407 * safezoneH;
        };
        class FrameBackgroundInformation: lilc_RscStructuredText {
            idc = 1100;
            x = 0.484531 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.297 * safezoneH;
            colorBackground[] = {0, 0, 0, 0};
        };
        class TitleInformation: RscText {
            idc = 1002;
            text = "Informationen:"; //--- ToDo: Localize;
            x = 0.484532 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])",0.5};
        };
        class RscText_1003: RscText {
            idc = 1003;
            text = "Beweise (Inventar):"; //--- ToDo: Localize;
            x = 0.386562 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])",0.5};
        };
        class ProgressLoading: lilc_RscProgress {
            idc = 1200;
            text = "";
            x = 0.381406 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.011 * safezoneH;
            colorFrame[] = {0, 0, 0, 0};
        };
        class TextInformation: RscText {
            idc = 1004;
            x = 0.489687 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.228222 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.5};
        };
        class ButtonInsertToPDA: RscButton {
            idc = 1600;
            text = "Add to PDA"; //--- ToDo: Localize;
            x = 0.489687 * safezoneW + safezoneX;
            y = 0.632 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class ButtonExamineEvidence: RscButton {
            idc = 1601;
            text = "Examine"; //--- ToDo: Localize;
            x = 0.386562 * safezoneW + safezoneX;
            y = 0.643 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class ComboPDACategory: RscCombo {
            idc = 2100;
            x = 0.489687 * safezoneW + safezoneX;
            y = 0.61 * safezoneH + safezoneY;
            w = 0.117552 * safezoneW;
            h = 0.0184074 * safezoneH;
        };
        class ButtonClose: RscActiveText {
            idc = 1201;
            style = 48;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = 0.60625 * safezoneW + safezoneX;
            y = 0.315667 * safezoneH + safezoneY;
            w = 0.0108334 * safezoneW;
            h = 0.0174815 * safezoneH;
            onButtonClick = "closeDialog 2306;";
            color[] = {1, 1, 1, 0.7};
            colorText[] = {1, 1, 1, 0.7};
            colorActive[] = {1, 1, 1, 1};
        };
    };
};
