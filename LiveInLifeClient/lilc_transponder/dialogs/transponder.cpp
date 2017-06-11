
class lilcm_transponder_transponder {
    idd = 1580;
    name = "lilcm_transponder_transponder";
    enableSimulation = true;
    movingEnable = true;

    class controlsBackground {
        class FrameBackgroundBackground : lilc_RscPicture {
            idc = -1;
            text = "\x\lilc\addons\transponder\ui\transponder.paa";
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.299062 * safezoneW;
            h = 0.506 * safezoneH;
        };
    };

    class controls {
        class EditTransponderNumber : lilc_RscEdit {
            idc = 1581;
            text = "0000";
            onKeyDown = "_this call lilc_transponder_fnc_onKeyDown;";
            font = "tf_font_dots";
            shadow = 0;
            colorBackground[] = {0, 0, 0, 0};
            colorText[] = {0.847059, 0.839216, 0.121569, 0.95};
            x = 0.493911 * safezoneW + safezoneX;
            y = 0.441296 * safezoneH + safezoneY;
            w = 0.0655207 * safezoneW;
            h = 0.0319631 * safezoneH;
        };

        class TextFlightLevel : lilc_RscText {
            idc = 1582;
            text = "FL 000";
            font = "tf_font_dots";
            shadow = 0;
            colorText[] = {0.847059, 0.839216, 0.121569, 0.95};
            x = 0.494322 * safezoneW + safezoneX;
            y = 0.488074 * safezoneH + safezoneY;
            w = 0.0655208 * safezoneW;
            h = 0.0229259 * safezoneH;
        };

        class TextMode : lilc_RscText {
            idc = 1583;
            text = "ACS";
            font = "tf_font_dots";
            shadow = 0;
            colorText[] = {0.847059, 0.839216, 0.121569, 0.95};
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.512852 * safezoneH + safezoneY;
            w = 0.0377083 * safezoneW;
            h = 0.0292963 * safezoneH;
        };

        class TextModeNumber :lilc_RscText {
            idc = 1584;
            text = "1234";
            font = "tf_font_dots";
            shadow = 0;
            colorText[] = {0.847059, 0.839216, 0.121569, 0.95};
            x = 0.494271 * safezoneW + safezoneX;
            y = 0.512963 * safezoneH + safezoneY;
            w = 0.0655208 * safezoneW;
            h = 0.0294074 * safezoneH;
        };

        class Button1 : lilc_RscButtonMenu {
            idc = 1585;
            text = "";
            onButtonClick = "[] spawn lilc_transponder_fnc_on;";
			toolTip = "An/-Auschalten";
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0)";
			colorBackground[] = {0, 0, 0, 0};
            x = 0.458333 * safezoneW + safezoneX;
            y = 0.381482 * safezoneH + safezoneY;
            w = 0.0209375 * safezoneW;
            h = 0.0355556 * safezoneH;
        };

        class Button2 : Button1 {
            idc = 1586;
            onButtonClick = "call lilc_transponder_fnc_setVFR;";
			toolTip = "VFR Einstellung";
            x = 0.490104 * safezoneW + safezoneX;
            y = 0.381482 * safezoneH + safezoneY;
            w = 0.0209375 * safezoneW;
            h = 0.0355556 * safezoneH;
        };

        /*class Button3 : Button1 {
            idc = 1587;
            x = 0.521355 * safezoneW + safezoneX;
            y = 0.381481 * safezoneH + safezoneY;
            w = 0.0209375 * safezoneW;
            h = 0.0355556 * safezoneH;
        };*/

        class Button4 : Button1 {
            idc = 1588;
            onButtonClick = "call lilc_transponder_fnc_changeMode;";
			toolTip = "Modus ändern";
            x = 0.458334 * safezoneW + safezoneX;
            y = 0.587963 * safezoneH + safezoneY;
            w = 0.0209375 * safezoneW;
            h = 0.0355556 * safezoneH;
        };

        /*class Button5 : Button1 {
            idc = 1589;
            x = 0.489583 * safezoneW + safezoneX;
            y = 0.587963 * safezoneH + safezoneY;
            w = 0.0209375 * safezoneW;
            h = 0.0355556 * safezoneH;
        };*/
        
        class Button6 : Button1 {
            idc = 1590;
            onButtonClick = "[] spawn lilc_transponder_fnc_apply;";
			toolTip = "Übernehmen";
            x = 0.521354 * safezoneW + safezoneX;
            y = 0.587963 * safezoneH + safezoneY;
            w = 0.0209375 * safezoneW;
            h = 0.0355556 * safezoneH;
        };

        class ButtonUp : Button1 {
            idc = 1591;
            onButtonClick = "[true] call lilc_transponder_fnc_changeTransponderCode;";
            toolTip = "+";
            x = 0.576302 * safezoneW + safezoneX;
            y = 0.600963 * safezoneH + safezoneY;
            w = 0.0159375 * safezoneW;
            h = 0.0631111 * safezoneH;
        };

        class ButtonDown : ButtonUp {
            idc = 1592;
            onButtonClick = "[false] call lilc_transponder_fnc_changeTransponderCode;";
            toolTip = "-";
            x = 0.557812 * safezoneW + safezoneX;
            y = 0.600926 * safezoneH + safezoneY;
            w = 0.0180209 * safezoneW;
            h = 0.0631111 * safezoneH;
        };
    };
};
