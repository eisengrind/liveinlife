
class lilc_hud
{
    name = "lilc_hud";
    idd = 1035;
    fadein = 0.5;
    duration = 2147483647;
    fadeout = 0.5;
    movingEnable = false;
    enableSimulation = true;
    onLoad = "uiNamespace setVariable ['lilc_hud', (_this select 0)];";
    objects[] = {};

    class controlsBackground
    {
        class PictureBackground : lilc_RscPicture
        {
            idc = 1200;
            text = "\x\lilc\addons\hud\ui\fade.paa";
            x = 0.898229 * safezoneW + safezoneX;
            y = 0.247926 * safezoneH + safezoneY;
            w = 0.12849 * safezoneW;
            h = 0.126444 * safezoneH;
        };
    };

    class controls
    {
        class TextInformation : lilc_RscStructuredText
        {
            idc = 1100;
            font = "PuristaMedium";
            text = ""; //--- ToDo: Localize;
            x = 0.87125 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.11 * safezoneH;
            colorBackground[] = {0, 0, 0, 0};
        };
    };
};
