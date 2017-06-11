
class lilc_playerHUD {
    name = "lilc_playerHUD";
	idd = 1035;
    fadein=0;
	duration = 999999999999999999999999999;
	fadeout=0;
	movingEnable = false;
	enableSimulation = true;
    onLoad = "uiNamespace setVariable ['lilc_playerHUD', (_this select 0)];";
	objects[] = {};
    
    class controlsBackground {};
    
    class controls {
        class FrameBackgroundBackground : lilc_RscText
        {
            idc = 1200;
            text = "";
            colorBackground[] = {0, 0, 0, 0.7};
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.962 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.044 * safezoneH;
        };
        
        class PictureHealth : lilc_RscPicture
        {
            idc = 1206;
            text = "\x\lilc\addons\ui\icons\hud\health.paa";
            x = 0.297864 * safezoneW + safezoneX;
            y = 0.969296 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.0247778 * safezoneH;
        };

        class PictureBlood : lilc_RscPicture
        {
            idc = 1201;
            text = "\x\lilc\addons\ui\icons\hud\blood.paa";
            x = 0.349271 * safezoneW + safezoneX;
            y = 0.969296 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.0247778 * safezoneH;
        };

        class PictureFood : lilc_RscPicture
        {
            idc = 1207;
            text = "\x\lilc\addons\ui\icons\hud\food.paa";
            x = 0.417448 * safezoneW + safezoneX;
            y = 0.969296 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.0247778 * safezoneH;
        };

        class PictureThirst : lilc_RscPicture
        {
            idc = 1208;
            text = "\x\lilc\addons\ui\icons\hud\thirst.paa";
            x = 0.473489 * safezoneW + safezoneX;
            y = 0.969296 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.0247778 * safezoneH;
        };

        class PictureMoney : lilc_RscPicture
        {
            idc = 1209;
            text = "\x\lilc\addons\ui\icons\hud\money.paa";
            x = 0.530104 * safezoneW + safezoneX;
            y = 0.969296 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.0247778 * safezoneH;
        };

        class PictureAdditionalCurrency : lilc_RscPicture
        {
            idc = 1210;
            text = "\x\lilc\addons\ui\icons\hud\grinds.paa";
            x = 0.625988 * safezoneW + safezoneX;
            y = 0.969296 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.0247778 * safezoneH;
        };
        
        class TextHealth : lilc_RscText
        {
            idc = 1000;
            x = 0.315938 * safezoneW + safezoneX;
            y = 0.971148 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextBlood : lilc_RscText
        {
            idc = 1006;
            x = 0.367188 * safezoneW + safezoneX;
            y = 0.971296 * safezoneH + safezoneY;
            w = 0.0464063 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextFood : lilc_RscText
        {
            idc = 1007;
            x = 0.435521 * safezoneW + safezoneX;
            y = 0.971148 * safezoneH + safezoneY;
            w = 0.0360937 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextThirst : lilc_RscText
        {
            idc = 1008;
            x = 0.491146 * safezoneW + safezoneX;
            y = 0.971297 * safezoneH + safezoneY;
            w = 0.0360937 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextMoney : lilc_RscText
        {
            idc = 1009;
            x = 0.547969 * safezoneW + safezoneX;
            y = 0.971259 * safezoneH + safezoneY;
            w = 0.0763021 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextAdditionalCurrency : lilc_RscText
        {
            idc = 1010;
            x = 0.64375 * safezoneW + safezoneX;
            y = 0.971296 * safezoneH + safezoneY;
            w = 0.0577604 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
