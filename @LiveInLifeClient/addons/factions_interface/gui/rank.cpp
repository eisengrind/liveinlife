
class lilc_factions_interface_rank {
    name = "lilc_factions_interface_rank";
    idd = 2049;
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
            moving = 1;
            text = ""; //--- ToDo: Localize;
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class ButtonClose: RscActiveText {
            idc = 1602;
            onButtonClick = "closeDialog 2049;";
            color[] = {1,1,1,0.7};
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = 0.683594 * safezoneW + safezoneX;
            y = 0.249778 * safezoneH + safezoneY;
            w = 0.0111459 * safezoneW;
            h = 0.0173703 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
            colorText[] = {1,1,1,0.7};
            colorActive[] = {1,1,1,1};
        };
    };
    class controls {
        class TitleRankName: RscText {
            idc = 1002;
            text = "$STR_lilc_factions_interface_Config_rankName"; //--- ToDo: Localize;
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class ListPermissions: RscListNBox {
            idc = 1500;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.154 * safezoneH;
        };

        class ListVehicles: RscListNBox {
            idc = 1501;
            x = 0.308698 * safezoneW + safezoneX;
            y = 0.405518 * safezoneH + safezoneY;
            w = 0.186667 * safezoneW;
            h = 0.303482 * safezoneH;
        };

        class ListItems: RscListNBox {
            idc = 1502;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.186146 * safezoneW;
            h = 0.228222 * safezoneH;
        };

        class TitleItems: RscText {
            idc = 1003;
            text = "$STR_lilc_factions_interface_Config_items"; //--- ToDo: Localize;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class TitleVehicles: RscText {
            idc = 1004;
            text = "$STR_lilc_factions_interface_Config_vehicles"; //--- ToDo: Localize;
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.383519 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class TitlePermissions: RscText {
            idc = 1005;
            text = "$STR_lilc_factions_interface_Config_permissions"; //--- ToDo: Localize;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class EditRankName: RscEdit {
            idc = 1400;
            x = 0.381406 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleRankTag: RscText {
            idc = 1006;
            text = "$STR_lilc_factions_interface_Config_rankTag"; //--- ToDo: Localize;
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.305593 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class EditRankTag: RscEdit {
            idc = 1401;
            x = 0.381406 * safezoneW + safezoneX;
            y = 0.305704 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleRankIcon: RscText {
            idc = 1007;
            text = "$STR_lilc_factions_interface_Config_rankInsignia"; //--- ToDo: Localize;
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.331296 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class ComboRankIcon: RscCombo {
            idc = 2100;
            x = 0.381406 * safezoneW + safezoneX;
            y = 0.331296 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitlePaycheck: RscText {
            idc = 1008;
            text = "$STR_lilc_factions_interface_Config_paycheck"; //--- ToDo: Localize;
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class ComboPaycheck: RscCombo {
            idc = 2101;
            x = 0.381406 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonSave: RscButton {
            idc = 1600;
            text = "$STR_lilc_factions_interface_Config_save";
            x = 0.603124 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonBack: RscButton {
            idc = 1601;
            text = "$STR_lilc_factions_interface_Config_back";
            onButtonClick = "closeDialog 2049;";
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
