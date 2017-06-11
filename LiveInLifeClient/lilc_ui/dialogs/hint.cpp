
class lilc_ui_hint
{
    name = "lilc_ui_hint";
    idd = 1610;
    fadein = 0;
    duration = 999999999999999999999999999;
    fadeout = 0;
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "uiNamespace setVariable ['lilc_ui_hint', (_this select 0)];";
    objects[] = {};

    class controlsBackground
    {
    };
    class controls
    {
        /*class GroupBox1 : lilc_RscControlsGroup {
            idc = 1611;
            x = 0.411041 * safezoneW + safezoneX;
            y = 0.00962966 * safezoneH + safezoneY;
            w = 0.194584 * safezoneW;
            h = 0.0375185 * safezoneH;
			
            class VScrollbar {
				width = 0.0001;
			};
			
			class HScrollbar {
				height = 0.0001;
			};
			
            class controls {
                class PictureColor : lilc_RscPicture {
                    idc = 1612;
                    text = "#(argb,8,8,3)color(0.066,0.729,0.066,1)";
                    x = -9.83477e-007 * safezoneW;
                    y = -0.000926386 * safezoneH;
                    w = 0.00515625 * safezoneW;
                    h = 0.0392592 * safezoneH;
                };

                class TextMessage : lilc_RscStructuredText {
                    idc = 1613;
                    text = "";
                    x = 0.00531299 * safezoneW;
                    y = -0.000925943 * safezoneH;
                    w = 0.19026 * safezoneW;
                    h = 0.0384445 * safezoneH;
                    colorBackground[] = {0,0,0,0.4};
                    sizeEx = 0.034;
					shadow = 0;
                };
            };
        };

        class GroupBox2 : lilc_RscControlsGroup {
            idc = 1614;
            x = 0.410938 * safezoneW + safezoneX;
            y = 0.0518518 * safezoneH + safezoneY;
            w = 0.194584 * safezoneW;
            h = 0.0375185 * safezoneH;
			
            class VScrollbar {
				width = 0.0001;
			};
			
			class HScrollbar {
				height = 0.0001;
			};
			
            class controls {
                class PictureColor : lilc_RscPicture {
                    idc = 1615;
                    text = "#(argb,8,8,3)color(0.066,0.729,0.066,1)";
                    x = -9.83477e-007 * safezoneW;
                    y = -0.000926386 * safezoneH;
                    w = 0.00515625 * safezoneW;
                    h = 0.0392592 * safezoneH;
                };

                class TextMessage : lilc_RscStructuredText {
                    idc = 1616;
                    text = "";
                    x = 0.00499899 * safezoneW;
                    y = -0.000999999 * safezoneH;
                    w = 0.19026 * safezoneW;
                    h = 0.0384445 * safezoneH;
                    colorBackground[] = {0,0,0,0.4};
                    sizeEx = 0.034;
					shadow = 0;
                };
            };
        };

        class GroupBox3 : lilc_RscControlsGroup {
            idc = 1617;
            x = 0.410938 * safezoneW + safezoneX;
            y = 0.0944441 * safezoneH + safezoneY;
            w = 0.194584 * safezoneW;
            h = 0.0375185 * safezoneH;
			
            class VScrollbar {
				width = 0.0001;
			};
			
			class HScrollbar {
				height = 0.0001;
			};
			
            class controls {
                class PictureColor : lilc_RscPicture {
                    idc = 1618;
                    text = "#(argb,8,8,3)color(0.066,0.729,0.066,1)";
                    x = -0.000105011 * safezoneW;
                    y = -0.000629302 * safezoneH;
                    w = 0.00515625 * safezoneW;
                    h = 0.0383333 * safezoneH;
                };

                class TextMessage : lilc_RscStructuredText {
                    idc = 1619;
					text = "";
                    x = 0.00531301 * safezoneW;
                    y = -0.0012965 * safezoneH;
                    w = 0.19026 * safezoneW;
                    h = 0.0384445 * safezoneH;
                    colorBackground[] = {0,0,0,0.4};
                    sizeEx = 0.034;
					shadow = 0;
                };
            };
        };

        class GroupBox4 : lilc_RscControlsGroup {
            idc = 1620;
            x = 0.410938 * safezoneW + safezoneX;
            y = 0.137037 * safezoneH + safezoneY;
            w = 0.194584 * safezoneW;
            h = 0.0375185 * safezoneH;
			
            class VScrollbar {
				width = 0.0001;
			};
			
			class HScrollbar {
				height = 0.0001;
			};
			
            class controls {
                class PictureColor : lilc_RscPicture {
                    idc = 1621;
                    text = "#(argb,8,8,3)color(0.066,0.729,0.066,1)";
                    x = 0.000104003 * safezoneW;
                    y = -0.00129699 * safezoneH;
                    w = 0.00515625 * safezoneW;
                    h = 0.0392592 * safezoneH;
                };

                class TextMessage : lilc_RscStructuredText {
                    idc = 1622;
					text = "";
                    x = 0.005364 * safezoneW;
                    y = -0.001074 * safezoneH;
                    w = 0.19026 * safezoneW;
                    h = 0.0384445 * safezoneH;
                    colorBackground[] = {0,0,0,0.4};
                    sizeEx = 0.034;
					shadow = 0;
                };
            };
        };

        class GroupBox5 : lilc_RscControlsGroup {
            idc = 1623;
            x = 0.410938 * safezoneW + safezoneX;
            y = 0.17963 * safezoneH + safezoneY;
            w = 0.194584 * safezoneW;
            h = 0.0375185 * safezoneH;
			
            class VScrollbar {
				width = 0.0001;
			};
			
			class HScrollbar {
				height = 0.0001;
			};
			
            class controls {
                class PictureColor : lilc_RscPicture {
                    idc = 1624;
                    text = "#(argb,8,8,3)color(0.066,0.729,0.066,1)";
                    x = 0.000104003 * safezoneW;
                    y = -0.00129699 * safezoneH;
                    w = 0.00515625 * safezoneW;
                    h = 0.0392592 * safezoneH;
                };

                class TextMessage : lilc_RscStructuredText {
                    idc = 1625;
					text = "";
                    x = 0.00499899 * safezoneW;
                    y = -0.000592987 * safezoneH;
                    w = 0.19026 * safezoneW;
                    h = 0.0384445 * safezoneH;
                    colorBackground[] = {0,0,0,0.4};
                    sizeEx = 0.034;
					shadow = 0;
                };
            };
        };*/
    };
};