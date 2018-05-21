
class RscControlsGroup;
class lilc_RscButton;
class RscButton;

class RscDisplayInventory {
    onKeyDown = "if ((_this select 1) in [62, 56]) then { true; } else { false; };";
    onMouseButtonDown = "_this call lilc_inventory_menu_fnc_onMouseButtonDown;";
    onMouseMoving = "_this call lilc_inventory_menu_fnc_onMouseMoving;";
    onLoad = "[""onLoad"",_this,""RscDisplayInventory"",'IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); [] spawn { waitUntil { (!isNull (findDisplay 602)) }; call lilc_inventory_menu_fnc_onInventoryOpened; };";

    class controls {
        class DropDownGroup : RscControlsGroup
        {
            idc = 1350;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.11 * safezoneH;

            class VScrollbar {
                autoScrollSpeed = -1;
                autoScrollDelay = 5;
                autoScrollRewind = 0;
                color[] = {1,1,1,0};
                width = 0.001;
            };

            class HScrollbar {
                autoScrollSpeed = -1;
                autoScrollDelay = 5;
                autoScrollRewind = 0;
                color[] = {1,1,1,0};
                height = 0.001;
            };

            class controls
            {
                class ButtonDropwdown1 : lilc_RscButton
                {
                    idc = 1351;
                    text = "";
                    type = 1;
                    style = 2;
                    colorText[] = {1, 1, 1, 1};
                    colorBackground[] = {0, 0, 0, 0.8};
                    colorBackgroundActive[] = {0.63, 0.02, 0.02, 0.8};
                    colorBackgroundDisabled[] = {1, 1, 1, 0};
                    colorFocused[] = {0, 0, 0, 0.8};
                    colorShadow[] = {1, 1, 1, 0};

                    class Attributes
                    {
                        font = "PuristaSemiBold";
                        color = "#E5E5E5";
                        align = "center";
                        shadow = "false";
                    };

                    shadow = 0;
                    sizeEx = 0.030;
                    x = 0 * safezoneW;
                    y = 1.63913e-008 * safezoneH;
                    w = 0.0928125 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class ButtonDropwdown2: ButtonDropwdown1
                {
                    idc = 1352;
                    x = 0 * safezoneW;
                    y = 0.022 * safezoneH;
                    w = 0.0928125 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class ButtonDropwdown3: ButtonDropwdown1
                {
                    idc = 1353;
                    x = 0 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.0928125 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class ButtonDropwdown4: ButtonDropwdown1
                {
                    idc = 1354;
                    x = 0 * safezoneW;
                    y = 0.066 * safezoneH;
                    w = 0.0928125 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class ButtonDropwdown5: ButtonDropwdown1
                {
                    idc = 1355;
                    x = 0 * safezoneW;
                    y = 0.088 * safezoneH;
                    w = 0.0928125 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class ButtonDropwdown6: ButtonDropwdown1
                {
                    idc = 1356;
                    x = 0 * safezoneW;
                    y = 0.110 * safezoneH;
                    w = 0.0928125 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class ButtonDropwdown7: ButtonDropwdown1
                {
                    idc = 1357;
                    x = 0 * safezoneW;
                    y = 0.132 * safezoneH;
                    w = 0.0928125 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class ButtonDropwdown8: ButtonDropwdown1
                {
                    idc = 1358;
                    x = 0 * safezoneW;
                    y = 0.154 * safezoneH;
                    w = 0.0928125 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class ButtonDropwdown9: ButtonDropwdown1
                {
                    idc = 1359;
                    x = 0 * safezoneW;
                    y = 0.176 * safezoneH;
                    w = 0.0928125 * safezoneW;
                    h = 0.022 * safezoneH;
                };
            };
        };

        class ButtonCrafting : RscButton {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0.8};
            colorBackgroundActive[] = {0, 0, 0, 1};
            colorBackgroundDisabled[] = {0, 0, 0, 0.8};
            text = "Crafting";
            onButtonClick = "[] spawn lilc_crafting_fnc_openMenu;";
            x = 0.737188 * safezoneW + safezoneX;
            y = 0.75938 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.033 * safezoneH;
        };
    };
};
