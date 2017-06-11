
class lilc_ferrys_ferryMenu {
    idd = 1510;
	movingEnable = 0;
	enableSimulation = 1;
    name = "lilc_ferrys_ferryMenu";
    fadein = 0;
	duration = 999999999999999999999999999;
	fadeout = 0;
    onLoad = "uiNamespace setVariable ['lilc_ferrys_ferryMenu', (_this select 0)];";
	objects[] = {};

    class controlsBackground {};

    class controls {
        class ProgressProgressbar : lilc_RscProgress {
            idc = 1511;
            text = "";
            colorFrame[] = {0, 0, 0, 0};
            x = -0.0104688 * safezoneW + safezoneX;
            y = 0.918 * safezoneH + safezoneY;
            w = 1.01578 * safezoneW;
            h = 0.099 * safezoneH;
        };

        class TextText : lilc_RscStructuredText {
            idc = 1512;
            text = "";
            x = 0.319531 * safezoneW + safezoneX;
            y = 0.938148 * safezoneH + safezoneY;
            w = 0.366094 * safezoneW;
            h = 0.044 * safezoneH;
        };
    };
};
