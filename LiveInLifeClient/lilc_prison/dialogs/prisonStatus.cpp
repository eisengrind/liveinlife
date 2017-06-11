
class lilc_prison_status {
    name = "lilc_prison_status";
	idd = 1520;
    fadein = 1;
	duration = 999999999999999999999999999;
	fadeout = 1;
	movingEnable = false;
	enableSimulation = true;
    onLoad = "uiNamespace setVariable ['lilc_prison_status', (_this select 0)];";
    
    class controlsBackground {
        class PictureBattery : lilc_RscPicture
        {
            idc = 1200;
            text = "\x\lilc\addons\prison\icons\hobble_battery.paa";
            x = 0.0153125 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.121 * safezoneH;
        };
    };

    class controls {
        class TextJailInfo : lilc_RscStructuredText {
            idc = 1621;
            text = "";
            x = 0.0101562 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.170156 * safezoneW;
            h = 0.264 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };

        class ProgressBattery : lilc_RscProgress
        {
            idc = 1201;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 0.0205719 * safezoneW + safezoneX;
            y = 0.53278 * safezoneH + safezoneY;
            w = 0.0520834 * safezoneW;
            h = 0.055 * safezoneH;
            colorFrame[] = {0, 0, 0, 0};
            colorBar[] = {1, 1, 1, 1};
        };
    };
};
