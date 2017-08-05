
class lilc_ui_logo {
    name = "lilc_ui_logo";
	idd = 1500;
    fadein = 2;
	duration = 999999999999999999999999999;
	fadeout = 4;
	movingEnable = false;
	enableSimulation = true;
    onLoad = "uiNamespace setVariable ['lilc_ui_logo', (_this select 0)];";
	objects[] = {};
    
    class controlsBackground {
        class PictureLogo : lilc_RscPicture {
            idc = -1;
            text = "\x\lilc\addons\ui\images\logo.paa";
            x = 0.381406 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.418 * safezoneH;
        };
    };
};
