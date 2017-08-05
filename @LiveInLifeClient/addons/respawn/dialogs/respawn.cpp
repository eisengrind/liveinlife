
class lilc_respawn {
    name = "lilc_respawn";
    idd = 1040;
    fadein = 0;
	duration = 999999999999999999999999999;
	fadeout = 0;
    movingEnable = false;
    enableSimulation = true;
    onLoad = "uiNamespace setVariable ['lilc_respawn', (_this select 0)];";
    objects[] = {};
    
    class controlsBackground {
        /*class TextTimeStatusBackground : lilc_RscText {
            idc = -1;
            text = "";
            x = "0.066875 * safezoneW + safezoneX";
            y = "0.907 * safezoneH + safezoneY";
            w = "0.871406 * safezoneW";
            h = "0.011 * safezoneH";
            colorBackground[] = {(156/255), (19/255), (19/255), 0.9};
        };*/
    };
    
    class controls {
        class TextTimer : lilc_RscStructuredText
        {
            idc = 1041;
            text = "";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.797 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.066 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
            sizeEx = 0.07;
        };
    };
};
