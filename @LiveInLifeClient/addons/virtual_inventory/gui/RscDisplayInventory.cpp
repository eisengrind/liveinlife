
class lilc_RscPicture;
class RscText;
class RscListBox;
class RscButton;
class lilc_RscCombo;
class lilc_RscActiveText;

class RscDisplayInventory {
    class controlsBackground {
        class LiveInLifeIconPlayerBackground : lilc_RscPicture {
            idc = -1;
            text = "\x\lilc\addons\ui\images\logo.paa";
            colorText[] = {1, 1, 1, 0.1};
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.209 * safezoneH;
        };
    };

    class controls {
        class TitleBackgroundVI : RscText {
            idc = -1;
            text = "";
            x = 0.737188 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0.1, 0.1, 0.1, 1};
        };

        class TitleVI : RscText {
            idc = -1;
            text = "$STR_lilc_virtual_inventory_DialogName_TitleVI";
            x = 0.737188 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class FrameBackgroundVI : RscText {
            idc = -1;
            text = "";
            x = 0.737188 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.485852 * safezoneH;
            colorBackground[] = {0.05, 0.05, 0.05, 0.7};
        };

        class ListVI : RscListBox {
            idc = 1407;
            text = "";
            x = 0.742344 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.394148 * safezoneH;
            sizeEx = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            sizeEx2 = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            rowHeight = "2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            colorText[] = {1, 1, 1, 1};
            colorBackground[] = {0, 0, 0, 0};
            itemBackground[] = {1, 1, 1, 0.1};
            itemSpacing = 0.001;
        };

        class ButtonRemoveVI : RscButton {
            idc = -1;
            onButtonClick = "call lilc_virtual_inventory_fnc_vi_removeItem;";
            text = "$STR_lilc_virtual_inventory_DialogName_ButtonRemoveVI";
            x = 0.742344 * safezoneW + safezoneX;
            y = 0.72637 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonGiveVI : RscButton {
            idc = -1;
            onButtonClick = "call lilc_virtual_inventory_fnc_vi_giveItem;";
            text = "$STR_lilc_virtual_inventory_DialogName_ButtonGiveVI";
            x = 0.742344 * safezoneW + safezoneX;
            y = 0.699852 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ComboGiveUnitsVI : lilc_RscCombo {
            idc = 1408;
            text = "$STR_lilc_inventory_DialogName_ComboGiveUnitsVI";
            x = 0.742344 * safezoneW + safezoneX;
            y = 0.67864 * safezoneH + safezoneY;
            w = 0.0843229 * safezoneW;
            h = 0.0174815 * safezoneH;
        };

        class ButtonRefreshGiveUnitsVI : lilc_RscActiveText {
            idc = -1;
            tooltip = "$STR_lilc_virtual_inventory_DialogName_ButtonRefreshTooltipVI";
            onButtonClick = "call lilc_virtual_inventory_fnc_vi_updateUnits;";
            text = "\x\lilc\addons\ui\icons\refresh_x64.paa";
            x = 0.828556 * safezoneW + safezoneX;
            y = 0.67952 * safezoneH + safezoneY;
            w = 0.0094792 * safezoneW;
            h = 0.017037 * safezoneH;
        };
    };
};
