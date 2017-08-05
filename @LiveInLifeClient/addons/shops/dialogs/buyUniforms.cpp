
class RscActiveText;
class lilcm_shops_clothing {
    name = "lilcm_shops_clothing";
	idd = 1201;
	movingEnable = false;
	enableSimulation = true;
    onMouseButtonDown = "_this call lilc_shops_fnc_onMouseButtonDownClothing;";
	onMouseButtonUp = "_this call lilc_shops_fnc_onMouseButtonUpClothing;";
    onMouseMoving = "_this call lilc_shops_fnc_onMouseMovingClothing;";
	//onUnload = "(findDisplay 1201) displayRemoveEventHandler [""KeyDown"", lilc_shops_escapeIndex];";
    
    class controlsBackground {
        class FrameBackgroundBackground : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.133906 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.363 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
			onMouseButtonDown = "true;";
			onMouseButtonUp = "true;";
        };

        class TitleTitle : lilc_RscTitle {
            idc = -1;
            text = "Kleiderhändler";
            x = 0.133905 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };
	};
	
	class controls {
        class ListItems : lilc_RscListbox {
            idc = 1202;
            text = "";
            sizeEx = 0.035;
            x = 0.139062 * safezoneW + safezoneX;
            y = 0.37263 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.256593 * safezoneH;
            onLBSelChanged = "call lilc_shops_fnc_onLBSelChangedClothing;";
        };

        class ComboCategories : lilc_RscCombo {
            idc = 1203;
            text = "";
            onLBSelChanged = "call lilc_shops_fnc_updateClothingMenu;";
            x = 0.139062 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextBalance : lilc_RscStructuredText {
            idc = 1204;
            text = "";
            x = 0.139578 * safezoneW + safezoneX;
            y = 0.63662 * safezoneH + safezoneY;
            w = 0.10776 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonBuy : lilc_RscButtonMenu {
            idc = 1205;
            text = "Kaufen";
            onButtonClick = "[] spawn lilc_shops_fnc_buyClothing;";
            x = 0.139062 * safezoneW + safezoneX;
            y = 0.665 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };
		
		class ButtonClose : RscActiveText {
            idc = 1206;
			style = 48;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = 0.240989 * safezoneW + safezoneX;
            y = 0.316593 * safezoneH + safezoneY;
            w = 0.00968748 * safezoneW;
            h = 0.0155185 * safezoneH;
			onButtonClick = "[] spawn lilc_shops_fnc_closeClothingMenu;";
			color[] = {1, 1, 1, 0.7};
            colorText[] = {1, 1, 1, 0.7};
            colorActive[] = {1, 1, 1, 1};
        };
	};
};
