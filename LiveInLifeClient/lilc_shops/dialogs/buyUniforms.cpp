
class lilc_shops_buyUniformsMenu {
    name = "lilc_shops_buyUniformsMenu";
	idd = 1201;
	movingEnable = false;
	enableSimulation = true;
	onUnload = "(findDisplay 1201) displayRemoveEventHandler [""KeyDown"", lilc_shops_escapeIndex];";
	onDestroy = "(findDisplay 1201) displayRemoveEventHandler [""KeyDown"", lilc_shops_escapeIndex];";
    
    class controlsBackground {
        class FrameBackgroundTitle : lilc_RscText_whiteBackground {
            idc = -1;
            text = "";
            x = 0.242187 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class FrameBackgroundBackground : lilc_RscText_darkBlueBackground {
            idc = -1;
            text = "";
            x = 0.242187 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.275 * safezoneH;
        };

        class FrameBackgroundFooter : lilc_RscText_whiteBackground {
            idc = -1;
            text = "";
            x = 0.242187 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle_darkBlueText {
            idc = -1;
            text = "Kleidung";
            x = 0.245313 * safezoneW + safezoneX;
            y = 0.296297 * safezoneH + safezoneY;
            w = 0.117604 * safezoneW;
            h = 0.022 * safezoneH;
        };
	};
	
	class controls {
        class ListItems : lilc_RscListbox {
            idc = 1202;
            text = "";
            x = 0.247343 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.176 * safezoneH;
            onLBSelChanged = "[(_this select 1)] call lilc_shops_fnc_onBuyUniformChange;";
        };

        class ComboCategories : lilc_RscCombo {
            idc = 1203;
            text = "";
            onLBSelChanged = "call lilc_shops_fnc_updateBuyUniformsMenu;";
            x = 0.247344 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class TextBalance : lilc_RscStructuredText {
            idc = 1204;
            text = "";
            x = 0.247344 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonBuy : lilc_RscButtonMenu_darkBlueBackground {
            idc = 1205;
            text = "Kaufen";
            onButtonClick = "[] spawn lilc_shops_fnc_buyUniform;";
            x = 0.247343 * safezoneW + safezoneX;
            y = 0.566 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonClose : lilc_RscButtonMenu_greyBackground {
            idc = -1;
            text = "Schliessen";
            onButtonClick = "[] spawn lilc_shops_fnc_closeBuyUniformsMenu;";
            x = 0.247344 * safezoneW + safezoneX;
            y = 0.61 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };
	};
};
