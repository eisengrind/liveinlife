
class lilc_factions_interface_overview {
    name = "lilc_factions_interface_overview";
    idd = 2048;
    enableSimulation = 1;
    movingEnable = 1;

    class controlsBackground {
        class FrameBackground: RscText {
            idc = 1000;
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.484 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class TitleTitle: RscText {
            idc = 1001;
            text = "$STR_lilc_factions_interface_Config_overview"; //--- ToDo: Localize;
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };
    };
    class controls {
        class ListPlayers: RscListbox {
            idc = 1500;
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.363 * safezoneH;
        };

        class TitlePlayers: RscText {
            idc = 1002;
            text = "$STR_lilc_factions_interface_Config_players"; //--- ToDo: Localize;
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class TitleRanks: RscText {
            idc = 1003;
            text = "$STR_lilc_factions_interface_Config_ranks"; //--- ToDo: Localize;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class ListRanks: RscListbox {
            idc = 1501;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.363 * safezoneH;
        };

        class ButtonPlayerEdit: RscButton {
            idc = 1602;
            text = "$STR_lilc_factions_interface_Config_edit"; //--- ToDo: Localize;
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.668704 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonRankAdd: RscButton {
            idc = 1603;
            text = "$STR_lilc_factions_interface_Config_add"; //--- ToDo: Localize;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.669519 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonRankEdit: RscButton {
            idc = 1604;
            text = "$STR_lilc_factions_interface_Config_edit"; //--- ToDo: Localize;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.695222 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonRankRemove: RscButton {
            idc = 1605;
            text = "$STR_lilc_factions_interface_Config_remove"; //--- ToDo: Localize;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonClose: RscActiveText {
            idc = 1606;
            onButtonClick = "closeDialog 2048;";
            color[] = {1,1,1,0.7};
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = 0.684425 * safezoneW + safezoneX;
            y = 0.250445 * safezoneH + safezoneY;
            w = 0.0103125 * safezoneW;
            h = 0.0173704 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
            colorText[] = {1,1,1,0.7};
            colorActive[] = {1,1,1,1};
        };
    };
};
