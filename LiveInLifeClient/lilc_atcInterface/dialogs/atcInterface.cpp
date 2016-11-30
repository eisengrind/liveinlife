
//Bg
["-0.0310938 * safezoneW + safezoneX","-0.028 * safezoneH + safezoneY","1.03641 * safezoneW","1.056 * safezoneH"]

//Interface
["0.226719 * safezoneW + safezoneX","0.038 * safezoneH + safezoneY","0.546562 * safezoneW","0.924 * safezoneH"]


class lilc_atcInterface {
    name = "lilc_atcInterface";
    idd = 1430;
    movingEnable = false;
    enableSimulation = true;
    
    class controlsBackground {
        class FrameBackgroundBlack : lilc_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0, 0, 0, 1};
            x = -0.0310938 * safezoneW + safezoneX;
            y = -0.028 * safezoneH + safezoneY;
            w = 1.03641 * safezoneW;
            h = 1.056 * safezoneH;
        };
    };
    
    class controls {
        class MapMapInterface : lilc_RscMapControlGreen {
            idc = 1431;
            text = "";
            x = 0.226719 * safezoneW + safezoneX;
            y = 0.038 * safezoneH + safezoneY;
            w = 0.546562 * safezoneW;
            h = 0.924 * safezoneH;
        };
    };
};

