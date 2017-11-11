
class shop_vehicles_menu {
    name = "shop_vehicles_menu";
	idd = 1240;
	onUnload = "(findDisplay 1240) displayRemoveEventHandler [""KeyDown"", shop_vehicles_escapeEventHandler];";
	onDestroy = "(findDisplay 1240) displayRemoveEventHandler [""KeyDown"", shop_vehicles_escapeEventHandler];";
	movingEnable = false;
	enableSimulation = true;
    
    class controlsBackground {
        class FrameDescriptionBackground : lilc_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0, 0, 0, 0.8};
            x = 0.025625 * safezoneW + safezoneX;
            y = 0.049 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.616 * safezoneH;
        };

        class FrameTitleBackground : lilc_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0, 0, 0, 0.8};
            x = 0.0617179 * safezoneW + safezoneX;
            y = 0.94 * safezoneH + safezoneY;
            w = 0.876562 * safezoneW;
            h = 0.044 * safezoneH;
        };
	};
	
	class controls {
        class TitleBottom : lilc_RscStructuredText {
            idc = 1241;
            text = "No Classname";
            x = 0.066875 * safezoneW + safezoneX;
            y = 0.951 * safezoneH + safezoneY;
            w = 0.86625 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextDescription : lilc_RscStructuredText {
            idc = 1242;
            text = "";
            x = 0.0307812 * safezoneW + safezoneX;
            y = 0.06 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.594 * safezoneH;
        };
        
        class ButtonArrowLeft : lilc_RscButtonMenu {
            idc = 1243;
            text = "Links";
            onButtonClick = "[] spawn lilc_shops_fnc_onVehicleArrowLeft;";
            x = 0.0101562 * safezoneW + safezoneX;
            y = 0.94 * safezoneH + safezoneY;
            w = 0.0464063 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class ButtonArrowRight : lilc_RscButtonMenu {
            idc = 1244;
            text = "Rechts";
            onButtonClick = "[] spawn lilc_shops_fnc_onVehicleArrowRight;";
            x = 0.943438 * safezoneW + safezoneX;
            y = 0.94 * safezoneH + safezoneY;
            w = 0.0464063 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class ButtonClose : lilc_RscButtonMenu {
            idc = -1;
            text = "X";
            onButtonClick = "call lilc_shops_fnc_closeVehicleMenu;";
            x = 0.964063 * safezoneW + safezoneX;
            y = 0.016 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class ButtonBuy : lilc_RscButtonMenu {
            idc = 1245;
            text = "Kaufen";
            onButtonClick = "call lilc_shops_fnc_buyVehicle;";
            x = 0.0978125 * safezoneW + safezoneX;
            y = 0.665 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
