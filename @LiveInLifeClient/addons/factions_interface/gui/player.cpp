
class lilc_factions_interface_player {
    name = "lilc_factions_interface_player";
    idd = 2050;
    enableSimulation = 1;
    movingEnable = 1;

    class controlsBackground {
        class FrameBackground: RscText {
            idc = 1000;
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.077 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class TitleTitle: RscText {
            idc = 1001;
            moving = 1;
            text = ""; //--- ToDo: Localize;
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class ButtonClose: RscActiveText {
            idc = 1602;
            onButtonClick = "closeDialog 2050;";
            color[] = {1,1,1,0.7};
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = 0.570748 * safezoneW + safezoneX;
            y = 0.381469 * safezoneH + safezoneY;
            w = 0.0103647 * safezoneW;
            h = 0.0173703 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
            colorText[] = {1,1,1,0.7};
            colorActive[] = {1,1,1,1};
        };
    };

    class controls {
        class ButtonBack: RscButton {
            idc = 1600;
            text = "$STR_lilc_factions_interface_Config_back"; //--- ToDo: Localize;
            onButtonClick = "closeDialog 2050;";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonSave: RscButton {
            idc = 1601;
            text = "$STR_lilc_factions_interface_Config_save"; //--- ToDo: Localize;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleRank: RscText {
            idc = 1003;
            text = "$STR_lilc_factions_interface_Config_rank"; //--- ToDo: Localize;
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class ComboRank: RscCombo {
            idc = 2100;
            x = 0.469062 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
