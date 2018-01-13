
class lilcm_shops_buyItems {
    name = "lilcm_shops_buyItems";
    idd = 1205;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class FrameBackground : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.341 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class FrameBackgroundShoppingCart : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.515469 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.264 * safezoneH;
            colorBackground[] = {0,0,0,0.4};
        };

        class Title : lilc_RscText {
            idc = 1206;
            text = "";
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };

        class TitleShoppingCart : lilc_RscText {
            idc = -1;
            text = "Warenkorb";
            x = 0.515469 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };
    };

    class controls {
        class ComboCategories : lilc_RscCombo {
            idc = 1207;
            x = 0.381406 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
            onLBSelChanged = "[] call lilc_shops_fnc_updateBuyItemsMenu;";
        };

        class ListItems : lilc_RscListbox {
            idc = 1208;
            sizeEx = 0.035;
            x = 0.381354 * safezoneW + safezoneX;
            y = 0.372407 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.292481 * safezoneH;
        };

        class ListShoppingCartItems : lilc_RscListbox {
            idc = 1209;
            sizeEx = 0.035;
            x = 0.520625 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.187 * safezoneH;
        };

        class TextSumOf : lilc_RscStructuredText {
            idc = 1210;
            text = "";
            x = 0.520625 * safezoneW + safezoneX;
            y = 0.593556 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonBuy : lilc_RscButtonMenu {
            idc = 1211;
            text = "Kaufen";
            onButtonClick = "call lilc_shops_fnc_buyItem;";
            x = 0.520625 * safezoneW + safezoneX;
            y = 0.621 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };

        class ButtonAdd : lilc_RscButtonMenu {
            idc = 1212;
            text = ">>";
            font = "PuristaMedium";
            onButtonClick = "call lilc_shops_fnc_addItem;";
            x = 0.487083 * safezoneW + safezoneX;
            y = 0.462481 * safezoneH + safezoneY;
            w = 0.026302 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonRemove : lilc_RscButtonMenu {
            idc = 1213;
            text = "";
            font = "PuristaMedium";
            onButtonClick = "call lilc_shops_fnc_removeItem;";
            x = 0.487083 * safezoneW + safezoneX;
            y = 0.489 * safezoneH + safezoneY;
            w = 0.026302 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
