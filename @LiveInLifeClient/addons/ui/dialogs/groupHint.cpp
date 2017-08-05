
class lilc_groupHint : lilc_RscControlsGroup
{
    idc = -1;
    x = 0.411041 * safezoneW + safezoneX;
    y = 0.00962966 * safezoneH + safezoneY;
    w = 0.194584 * safezoneW;
    h = 0.0375185 * safezoneH;

    class VScrollbar
    {
        width = 0.0001;
    };

    class HScrollbar
    {
        height = 0.0001;
    };

    class controls
    {
        class PictureColor : lilc_RscText
        {
            idc = 1612;
            text = "";
            x = -9.83477e-007 * safezoneW;
            y = -0.000926386 * safezoneH;
            w = 0.00515625 * safezoneW;
            h = 0.0392592 * safezoneH;
            colorBackgorund[] = {0, 0, 0, 1};
        };

        class FrameBackground : lilc_RscText
        {
            idc = 1613;
            text = "";
            x = 0.00531299 * safezoneW;
            y = -0.000925943 * safezoneH;
            w = 0.19026 * safezoneW;
            h = 0.0384445 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.4};
        };

		class TextMessage : lilc_RscStructuredText
		{
			idc = 1614;
			text = ""; //--- ToDo: Localize;
			x = 0.00731261 * safezoneW;
			y = 0.00630335 * safezoneH;
			w = 0.18441 * safezoneW;
			h = 0.022003 * safezoneH;
			colorBackground[] = {1,1,1,0.6};
            sizeEx = 0.034;
            shadow = 0;
		};
    };
};
