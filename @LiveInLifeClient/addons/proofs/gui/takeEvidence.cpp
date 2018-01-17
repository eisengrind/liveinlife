
class lilcm_proofs_takeEvidence {
    idd = 2305;
    name = "lilcm_proofs_takeEvidence";
    movingEnable = 1;
    enableSimulation = 1;

    class controlsBackground {
        class FrameBackground: RscText {
            idc = 1000;
            x = 0.432968 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.341 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class TitleTitle: RscText {
            idc = 1001;
            text = "Gefundene Beweise";
            moving = 1;
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };
    };

    class Controls {
        class ButtonSaveProofs: RscButton {
            idc = 1600;
            text = "Einpacken"; //--- ToDo: Localize;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.632 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "call lilc_proofs_fnc_takeProof;";
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.3};
        };

        class ListProofs: RscListbox {
            idc = 1500;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.264 * safezoneH;
        };

        class TitleProofs: RscText {
            idc = 1002;
            text = "Beweise:"; //--- ToDo: Localize;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
        };

        class ButtonClose: RscActiveText {
            idc = 1200;
            style = 48;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = 0.554687 * safezoneW + safezoneX;
            y = 0.303704 * safezoneH + safezoneY;
            w = 0.0110417 * safezoneW;
            h = 0.0188889 * safezoneH;
            onButtonClick = "closeDialog 2305;";
            color[] = {1, 1, 1, 0.7};
            colorText[] = {1, 1, 1, 0.7};
            colorActive[] = {1, 1, 1, 1};
        };
    };
};
