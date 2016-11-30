
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
    
    class controlsBackground {
        class FrameBackgroundHealth : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.869792 * safezoneW + safezoneX;
            y = 0.905556 * safezoneH + safezoneY;
            w = 0.125625 * safezoneW;
            h = 0.0142593 * safezoneH;
            colorBackground[] = {(70/255), (13/255), (13/255), 0.8};
        };

        class FrameBackgroundHunger : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.933177 * safezoneW + safezoneX;
            y = 0.922629 * safezoneH + safezoneY;
            w = 0.0623958 * safezoneW;
            h = 0.0128519 * safezoneH;
            colorBackground[] = {(1/255), (96/255), (39/255), 0.8};
        };

        class FrameBackgroundThirst : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.869792 * safezoneW + safezoneX;
            y = 0.921878 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.0137778 * safezoneH;
            colorBackground[] = {0, (89/255), (131/255), 0.8};
        };
    };
    
    class controls {
        class ProgressHealth : lilc_RscProgress {
            idc = 1036;
            text = "";
            x = 0.869792 * safezoneW + safezoneX;
            y = 0.905556 * safezoneH + safezoneY;
            w = 0.125625 * safezoneW;
            h = 0.0142593 * safezoneH;
            colorFrame[] = {0, 0, 0, 0};
            colorBackground[] = {(158/255), (30/255), (30/255), 1};
            colorBar[] = {(158/255), (30/255), (30/255), 1};
        };

        class ProgressHunger : lilc_RscProgress {
            idc = 1037;
            text = "";
            x = 0.933177 * safezoneW + safezoneX;
            y = 0.922629 * safezoneH + safezoneY;
            w = 0.0623958 * safezoneW;
            h = 0.0142593 * safezoneH;
            colorFrame[] = {0, 0, 0, 0};
            colorBackground[] = {(65/255), (161/255), (61/255), 1};
            colorBar[] = {(65/255), (161/255), (61/255), 1};
        };

        class ProgressThirst : lilc_RscProgress {
            idc = 1038;
            text = "";
            x = 0.869792 * safezoneW + safezoneX;
            y = 0.921778 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.0142593 * safezoneH;
            colorFrame[] = {0, 0, 0, 0};
            colorBackground[] = {0, (139/255), (205/255), 1};
            colorBar[] = {0, (139/255), (205/255), 1};
        };

        class PictureIconHealth : lilc_RscPicture {
            idc = -1;
            text = "\LiveInLifeClient\src\paa\gui\hud\iconHealth.paa";
            x = 0.869687 * safezoneW + safezoneX;
            y = 0.905629 * safezoneH + safezoneY;
            w = 0.00791668 * safezoneW;
            h = 0.0151854 * safezoneH;
        };

        class PictureIconHunger : lilc_RscPicture {
            idc = -1;
            text = "\LiveInLifeClient\src\paa\gui\hud\iconHunger.paa";
            x = 0.933333 * safezoneW + safezoneX;
            y = 0.922222 * safezoneH + safezoneY;
            w = 0.00791668 * safezoneW;
            h = 0.0151854 * safezoneH;
        };

        class PictureIconThirst : lilc_RscPicture {
            idc = -1;
            text = "\LiveInLifeClient\src\paa\gui\hud\iconThirst.paa";
            x = 0.869791 * safezoneW + safezoneX;
            y = 0.920371 * safezoneH + safezoneY;
            w = 0.00791668 * safezoneW;
            h = 0.0151854 * safezoneH;
        };
        
        class TextCash : lilc_RscText {
            idc = 1039;
            text = "$0";
            style = "0x01";
            colorText[] = {(146/255), (212/255), (165/255), 1};
            shadow = 2;
            sizeEx = 0.1;
            font = "PuristaLight";
            x = "0.778958 * safezoneW + safezoneX";
            y = "0.938148 * safezoneH + safezoneY";
            w = "0.216563 * safezoneW";
            h = "0.055 * safezoneH";
        };
    };
};
