

class lilc_shops_buyItemsMenu {
    name = "lilc_shops_buyItemsMenu";
	idd = 1205;
	movingEnable = false;
	enableSimulation = true;
    
    class controlsBackground {
        class FrameBackgroundTitle : lilc_RscText_whiteBackground {
            idc = -1;
            text = "";
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class FrameBackgroundBackground : lilc_RscText_darkBlueBackground {
            idc = -1;
            text = "";
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.275 * safezoneH;
        };

        class FrameBackgroundFooter : lilc_RscText_whiteBackground {
            idc = -1;
            text = "";
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.61 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle_darkBlueText {
            idc = -1;
            text = "Ausrüstung";
            x = 0.441198 * safezoneW + safezoneX;
            y = 0.307556 * safezoneH + safezoneY;
            w = 0.117604 * safezoneW;
            h = 0.022 * safezoneH;
        };
	};
	
	class controls {
        class ListItems : lilc_RscListbox {
            idc = 1206;
            text = "";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.176 * safezoneH;
            onLBSelChanged = "[(_this select 1)] call lilc_shops_fnc_onBuyItemChange;";
        };

        class ComboCategories : lilc_RscCombo {
            idc = 1207;
            text = "";
            onLBSelChanged = "call lilc_shops_fnc_updateBuyItemsMenu;";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class TextBalance : lilc_RscStructuredText {
            idc = 1208;
            text = "";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonBuy : lilc_RscButtonMenu_darkBlueBackground {
            idc = 1209;
            text = "";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonClose : lilc_RscButtonMenu_greyBackground {
            idc = -1;
            text = "Schliessen";
            onButtonClick = "closeDialog 1205;";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.621 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };
	};
};
