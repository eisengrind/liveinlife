
class lilc_ui_aircraftInfo {
    name = "lilc_ui_aircraftInfo";
    idd = 1503;
    enableSimulation = 1;
    moveingEnable = 0;
	duration = 999999999999999999999999999;
    onLoad = "uiNamespace setVariable ['lilc_ui_aircraftInfo', (_this select 0)];";
    onUnload = "";
    
    class controlsBackground {};

    class controls {
        class FrameBackgroundBackground : lilc_RscText {
            idc = 1504;
            text = "";
            colorBackground[] = {0, 0, 0, 0.8};
            x = 0.226203 * safezoneW + safezoneX;
            y = 0.01226 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.088 * safezoneH;
        };

        class TextInformation : lilc_RscStructuredText {
            idc = 1505;
            text = "";
            x = 0.227761 * safezoneW + safezoneX;
            y = 0.0150741 * safezoneH + safezoneY;
            w = 0.156354 * safezoneW;
            h = 0.0825556 * safezoneH;
        };
    };
};
