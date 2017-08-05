
class lilc_progressBar {
    name = "lilc_progressBar";
	idd = 1320;
    /*fadein=0;
	duration = 999999999999999999999999999;
	fadeout=0;*/
	movingEnable = false;
	enableSimulation = true;
    onLoad = "(_this select 0) call lilc_ui_fnc_progressKeyHandler;";
    /*onLoad = "uiNamespace setVariable ['lilc_progressBar', (_this select 0)];";
	objects[] = {};*/
    
    class controlsBackground {
        class FrameProgressBackground : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.273125 * safezoneW + safezoneX;
            y = 0.775 * safezoneH + safezoneY;
            w = 0.45375 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.95};
        };
    };
    
    class controls {
        class ProgressProgressBar : lilc_RscProgress {
            idc = 1321;
            text = "";
            x = 0.27776 * safezoneW + safezoneX;
            y = 0.783223 * safezoneH + safezoneY;
            w = 0.445 * safezoneW;
            h = 0.0275555 * safezoneH;
            colorFrame[] = {1, 1, 1, 0.3};
            colorBackground[] = {0, (94/255), (190/255), 1};
            colorBar[] = {0, (94/255), (190/255), 1};
        };
        
        class TextProgressText : lilc_RscStructuredText {
            idc = 1322;
            text = "";
            x = 0.279167 * safezoneW + safezoneX;
            y = 0.786111 * safezoneH + safezoneY;
            w = 0.442396 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
