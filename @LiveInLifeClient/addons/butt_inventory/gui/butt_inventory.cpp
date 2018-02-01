
class lilcm_butt_inventory {
    idd = 2308;
    name = "lilcm_butt_inventory";
    onUnload = "[player, ''] call lilc_common_fnc_switchMove;";
    enableSimulation = 1;
    movingEnable = 1;

    class ControlsBackground {
        class FrameBackground: RscText {
            idc = 1000;
            x = 0.371093 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.257813 * safezoneW;
            h = 0.297 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.8};
        };

        class TitleTitle: RscText {
            idc = 1001;
            text = "Items verstecken"; //--- ToDo: Localize;
            x = 0.371092 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.257813 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };
    };

    class Controls {
        class ListInventory: RscListbox {
            idc = 1500;
            x = 0.375729 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.119115 * safezoneW;
            h = 0.227407 * safezoneH;
        };

        class ListHideplace: RscListbox {
            idc = 1501;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.227407 * safezoneH;
        };

        class TitleInventory: RscText {
            idc = 1002;
            text = "Inventar:"; //--- ToDo: Localize;
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0, 0, 0, 1};
        };

        class TitleHideplace: RscText {
            idc = 1003;
            text = "Versteck:"; //--- ToDo: Localize;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0, 0, 0, 1};
        };

        class ButtonHide: RscButton {
            idc = 1600;
            text = "Verstecken"; //--- ToDo: Localize;
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.61 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "call lilc_butt_inventory_fnc_hideItem;";
        };

        class ButtonRemove: RscButton {
            idc = 1601;
            text = "Entfernen"; //--- ToDo: Localize;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.61 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "call lilc_butt_inventory_fnc_removeItem;";
        };

        class TextAmount: RscText {
            idc = 1004;
            text = "0 / 10"; //--- ToDo: Localize;
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.0515625 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonClose: RscActiveText {
            idc = 1201;
            style = 48;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = 0.60625 * safezoneW + safezoneX;
            y = 0.315667 * safezoneH + safezoneY;
            w = 0.0108334 * safezoneW;
            h = 0.0174815 * safezoneH;
            onButtonClick = "closeDialog 2308;";
            color[] = {1, 1, 1, 0.7};
            colorText[] = {1, 1, 1, 0.7};
            colorActive[] = {1, 1, 1, 1};
        };
    };
};
