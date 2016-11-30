
class lilc_hospital {
    name = "lilc_hospital";
    idd = 1040;
    fadein = 0;
	duration = 999999999999999999999999999;
	fadeout = 0;
    movingEnable = false;
    enableSimulation = true;
    onLoad = "uiNamespace setVariable ['lilc_hospital',_this select 0];";
    objects[] = {};
    
    class controlsBackground {
        class TextTimeStatusBackground : lilc_RscText {
            idc = -1;
            text = "";
            x = "0.066875 * safezoneW + safezoneX";
            y = "0.907 * safezoneH + safezoneY";
            w = "0.871406 * safezoneW";
            h = "0.011 * safezoneH";
            colorBackground[] = {(156/255), (19/255), (19/255), 0.9};
        };
    };
    
    class controls {
        class ProgressTimeStatus : lilc_RscProgress {
            idc = 1041;
            text = "";
            x = "0.066875 * safezoneW + safezoneX";
            y = "0.907 * safezoneH + safezoneY";
            w = "0.871406 * safezoneW";
            h = "0.011 * safezoneH";
            colorFrame[] = {0, 0, 0, 1};
            colorBackground[] = {(158/255), 0, (8/255), 0.9};
            colorBar[] = {(245/255), (100/255), (100/255), 0.9};
        };
    };
};
