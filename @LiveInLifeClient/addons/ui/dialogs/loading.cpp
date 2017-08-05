
class lilc_ui_loading {
    name = "lilc_ui_loading";
	idd = 1501;
    fadein = 0;
	duration = 999999999999999999999999999;
	fadeout = 0;
	movingEnable = false;
	enableSimulation = true;
    onLoad = "uiNamespace setVariable ['lilc_ui_loading', (_this select 0)];";
    
    class controlsBackground {
        class PictureBackground : lilc_RscPicture {
            idc = 1501;
            text = "\x\lilc\addons\ui\images\loading\loading_background.paa";
            x = 0.9125 * safezoneW + safezoneX;
            y = 0.852 * safezoneH + safezoneY;
            w = 0.0721354 * safezoneW;
            h = 0.125519 * safezoneH;
        };
    };

    class controls {
        class PictureLoading1 : lilc_RscPicture {
            idc = 1502;
            text = "\x\lilc\addons\ui\images\loading\loading_1.paa";
            x = 0.9125 * safezoneW + safezoneX;
            y = 0.852 * safezoneH + safezoneY;
            w = 0.0721354 * safezoneW;
            h = 0.125519 * safezoneH;
        };

        class PictureLoading2 : lilc_RscPicture {
            idc = 1503;
            text = "\x\lilc\addons\ui\images\loading\loading_2.paa";
            x = 0.9125 * safezoneW + safezoneX;
            y = 0.852 * safezoneH + safezoneY;
            w = 0.0721354 * safezoneW;
            h = 0.125519 * safezoneH;
        };

        class PictureLoading3 : lilc_RscPicture {
            idc = 1504;
            text = "\x\lilc\addons\ui\images\loading\loading_3.paa";
            x = 0.9125 * safezoneW + safezoneX;
            y = 0.852 * safezoneH + safezoneY;
            w = 0.0721354 * safezoneW;
            h = 0.125519 * safezoneH;
        };

        class PictureLoading4 : lilc_RscPicture {
            idc = 1505;
            text = "\x\lilc\addons\ui\images\loading\loading_4.paa";
            x = 0.9125 * safezoneW + safezoneX;
            y = 0.852 * safezoneH + safezoneY;
            w = 0.0721354 * safezoneW;
            h = 0.125519 * safezoneH;
        };

        class PictureLoading5 : lilc_RscPicture {
            idc = 1506;
            text = "\x\lilc\addons\ui\images\loading\loading_5.paa";
            x = 0.9125 * safezoneW + safezoneX;
            y = 0.852 * safezoneH + safezoneY;
            w = 0.0721354 * safezoneW;
            h = 0.125519 * safezoneH;
        };

        class PictureLoading6 : lilc_RscPicture {
            idc = 1507;
            text = "\x\lilc\addons\ui\images\loading\loading_6.paa";
            x = 0.9125 * safezoneW + safezoneX;
            y = 0.852 * safezoneH + safezoneY;
            w = 0.0721354 * safezoneW;
            h = 0.125519 * safezoneH;
        };

        class PictureLoading7 : lilc_RscPicture {
            idc = 1508;
            text = "\x\lilc\addons\ui\images\loading\loading_7.paa";
            x = 0.9125 * safezoneW + safezoneX;
            y = 0.852 * safezoneH + safezoneY;
            w = 0.0721354 * safezoneW;
            h = 0.125519 * safezoneH;
        };
        
        class PictureLoading8 : lilc_RscPicture {
            idc = 1509;
            text = "\x\lilc\addons\ui\images\loading\loading_8.paa";
            x = 0.9125 * safezoneW + safezoneX;
            y = 0.852 * safezoneH + safezoneY;
            w = 0.0721354 * safezoneW;
            h = 0.125519 * safezoneH;
        };

        class TextInfo : lilc_RscStructuredText {
            idc = 1510;
            text = "";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.055 * safezoneH;
        };
    };
};
