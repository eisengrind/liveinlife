
class lilc_stats {
    name = "lilc_stats";
	idd = 1042;
    fadein = 0;
	duration = 999999999999999999999999999;
	fadeout = 0;
	movingEnable = false;
	enableSimulation = true;
    onLoad = "uiNamespace setVariable ['lilc_stats', (_this select 0)];";
	objects[] = {};
    
    class controlsBackground {
        class TextBackground : lilc_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0, 0, 0, 0.9};
            x = 0.797516 * safezoneW + safezoneX;
            y = 0.72836 * safezoneH + safezoneY;
            w = 0.190781 * safezoneW;
            h = 0.253 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle {
            idc = -1;
            text = "Statistiken";
            sizeEx = 0.045;
            x = 0.804219 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.177916 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class TextBar1Background1 : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.895587 * safezoneW + safezoneX;
            y = 0.78072 * safezoneH + safezoneY;
            w = 0.0882291 * safezoneW;
            h = 0.0182962 * safezoneH;
            colorBackground[] = {(115/255), (113/255)), (118/255), 0.9};
        };

        class TextBar2Background1 : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.895794 * safezoneW + safezoneX;
            y = 0.81592 * safezoneH + safezoneY;
            w = 0.0882291 * safezoneW;
            h = 0.0182962 * safezoneH;
            colorBackground[] = {(115/255), (113/255)), (118/255), 0.9};
        };

        class TextBar3Background1 : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.895794 * safezoneW + safezoneX;
            y = 0.8509 * safezoneH + safezoneY;
            w = 0.0882291 * safezoneW;
            h = 0.0182962 * safezoneH;
            colorBackground[] = {(115/255), (113/255)), (118/255), 0.9};
        };

        class TextBar4Background1 : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.895794 * safezoneW + safezoneX;
            y = 0.8872 * safezoneH + safezoneY;
            w = 0.0882291 * safezoneW;
            h = 0.0182962 * safezoneH;
            colorBackground[] = {(115/255), (113/255)), (118/255), 0.9};
        };

        class TextBar5Background1 : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.895794 * safezoneW + safezoneX;
            y = 0.9213 * safezoneH + safezoneY;
            w = 0.0882291 * safezoneW;
            h = 0.0182962 * safezoneH;
            colorBackground[] = {(115/255), (113/255)), (118/255), 0.9};
        };
    };
    
    class controls {
        class ProgressBar1 : lilc_RscProgress {
            idc = 1043;
            text = "";
            x = 0.895587 * safezoneW + safezoneX;
            y = 0.78072 * safezoneH + safezoneY;
            w = 0.0882291 * safezoneW;
            h = 0.0182962 * safezoneH;
            colorFrame[] = {0, 0, 0, 1};
            colorBar[] = {(167/255), (179/255), (184/255), 0.9};
        };

        class ProgressBar2 : lilc_RscProgress {
            idc = 1044;
            text = "";
            x = 0.895794 * safezoneW + safezoneX;
            y = 0.81592 * safezoneH + safezoneY;
            w = 0.0882291 * safezoneW;
            h = 0.0182962 * safezoneH;
            colorFrame[] = {0, 0, 0, 1};
            colorBar[] = {(167/255), (179/255), (184/255), 0.9};
        };

        class ProgressBar3 : lilc_RscProgress {
            idc = 1045;
            text = "";
            x = 0.895794 * safezoneW + safezoneX;
		    y = 0.8509 * safezoneH + safezoneY;
		    w = 0.0882291 * safezoneW;
		    h = 0.0182962 * safezoneH;
            colorFrame[] = {0, 0, 0, 1};
            colorBar[] = {(167/255), (179/255), (184/255), 0.9};
        };

        class ProgressBar4 : lilc_RscProgress {
            idc = 1046;
            text = "";
            x = 0.895794 * safezoneW + safezoneX;
            y = 0.8872 * safezoneH + safezoneY;
            w = 0.0882291 * safezoneW;
            h = 0.0182962 * safezoneH;
            colorFrame[] = {0, 0, 0, 1};
            colorBar[] = {(167/255), (179/255), (184/255), 0.9};
        };

        class ProgressBar5 : lilc_RscProgress {
            idc = 1047;
            text = "";
            x = 0.895794 * safezoneW + safezoneX;
            y = 0.9213 * safezoneH + safezoneY;
            w = 0.0882291 * safezoneW;
            h = 0.0182962 * safezoneH;
            colorFrame[] = {0, 0, 0, 1};
            colorBar[] = {(167/255), (179/255), (184/255), 0.9};
        };

        class TextPages : lilc_RscText {
            idc = 1048;
            text = "Seite 0 von 0";
            x = 0.851553 * safezoneW + safezoneX;
            y = 0.9543 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextBar1 : lilc_RscText {
            idc = 1049;
            text = "";
            sizeEx = 0.035;
            colorText[] = {(204/255), (202/255), (207/255), 0.9};
            x = 0.804219 * safezoneW + safezoneX;
            y = 0.775 * safezoneH + safezoneY;
            w = 0.0877083 * safezoneW;
            h = 0.0294072 * safezoneH;
        };
        
        class TextBar2 : lilc_RscText {
            idc = 1050;
            text = "";
            sizeEx = 0.035;
            colorText[] = {(204/255), (202/255), (207/255), 0.9};
            x = 0.804219 * safezoneW + safezoneX;
            y = 0.8102 * safezoneH + safezoneY;
            w = 0.0877083 * safezoneW;
            h = 0.0294072 * safezoneH;
        };

        class TextBar3 : lilc_RscText {
            idc = 1051;
            text = "";
            sizeEx = 0.035;
            colorText[] = {(204/255), (202/255), (207/255), 0.9};
            x = 0.804116 * safezoneW + safezoneX;
            y = 0.8454 * safezoneH + safezoneY;
            w = 0.0877083 * safezoneW;
            h = 0.0294072 * safezoneH;
        };

        class TextBar4 : lilc_RscText {
            idc = 1052;
            text = "";
            sizeEx = 0.035;
            colorText[] = {(204/255), (202/255), (207/255), 0.9};
            x = 0.804116 * safezoneW + safezoneX;
            y = 0.8806 * safezoneH + safezoneY;
            w = 0.0877083 * safezoneW;
            h = 0.0294072 * safezoneH;
        };

        class TextBar5 : lilc_RscText {
            idc = 1053;
            text = "";
            sizeEx = 0.035;
            colorText[] = {(204/255), (202/255), (207/255), 0.9};
            x = 0.804116 * safezoneW + safezoneX;
            y = 0.91558 * safezoneH + safezoneY;
            w = 0.0877083 * safezoneW;
            h = 0.0294072 * safezoneH;
        };
    };
};
