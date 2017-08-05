
class lilc_ferryCounter {
    name = "lilc_ferryCounter";
    idd = 1040;
    fadein = 0;
	duration = 999999999999999999999999999;
	fadeout = 0;
    movingEnable = false;
    enableSimulation = true;
    onLoad = "uiNamespace setVariable ['lilc_ferryCounter', (_this select 0)];";
    objects[] = {};
    
    class controlsBackground {};    
    class controls {
        class TextTimeCounter : lilc_RscStructuredText
        {
            idc = 1100;
            text = ""; //--- ToDo: Localize;
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.764 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.099 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
    };
};


