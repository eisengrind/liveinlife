
class lilc_garageMenu {
    name = "lilc_garageMenu";
	idd = 1265;
	movingEnable = false;
	enableSimulation = true;
    
    class controlsBackground {
        class FrameTitleBackground : lilc_RscText_whiteBackground {
            idc = -1;
            x = 0.0926562 * safezoneW + safezoneX;
            y = 0.17 * safezoneH + safezoneY;
            w = 0.216563 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class FrameBackground : lilc_RscText_darkBlueBackground {
            idc = -1;
            x = 0.0926562 * safezoneW + safezoneX;
            y = 0.203 * safezoneH + safezoneY;
            w = 0.216563 * safezoneW;
            h = 0.572 * safezoneH;
        };

        class FrameFooterBackground : lilc_RscText_whiteBackground {
            idc = -1;
            x = 0.0926562 * safezoneW + safezoneX;
            y = 0.775 * safezoneH + safezoneY;
            w = 0.216563 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle_darkBlueText {
            idc = -1;
            text = "Garage";
            x = 0.0958335 * safezoneW + safezoneX;
            y = 0.175926 * safezoneH + safezoneY;
            w = 0.210937 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleVehicles : lilc_RscTitle {
            idc = -1;
            text = "Fahrzeuge in Garage:";
            x = 0.0978125 * safezoneW + safezoneX;
            y = 0.214122 * safezoneH + safezoneY;
            w = 0.20625 * safezoneW;
            h = 0.0219906 * safezoneH;
        };
	};
	
    class controls {
        class ListVehicles : lilc_RscListbox {
            idc = 1266;
            text = "";
            sizeEx = 0.033;
            onLBSelChanged = "[(_this select 1)] call lilc_garage_fnc_onVehicleChange;";
            x = 0.0978125 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.20625 * safezoneW;
            h = 0.352 * safezoneH;
        };

        class TextDescription : lilc_RscStructuredText {
            idc = 1267;
            text = "";
            x = 0.0978125 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.20625 * safezoneW;
            h = 0.132 * safezoneH;
        };

        class ButtonReveal : lilc_RscButtonMenu_darkBlueBackground {
            idc = 1268;
            text = "Ausparken";
            onButtonClick = "call lilc_garage_fnc_reveal;";
            x = 0.154531 * safezoneW + safezoneX;
            y = 0.742 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonClose : lilc_RscButtonMenu_greyBackground {
            idc = 1269;
            text = "Schließen";
            onButtonClick = "call lilc_garage_fnc_closeMenu;";
            x = 0.206094 * safezoneW + safezoneX;
            y = 0.785878 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.0219906 * safezoneH;
        };
	};
};
