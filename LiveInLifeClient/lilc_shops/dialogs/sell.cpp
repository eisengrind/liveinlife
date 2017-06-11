
class lilcm_sell {
    name = "lilcm_sell";
	idd = 1250;
	movingEnable = false;
	enableSimulation = true;
    
    class controlsBackground {
        class FrameBackgroundTitle : lilc_RscText_whiteBackground {
            idc = -1;
            text = "";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
        };

        class FrameBackgroundBackground : lilc_RscText_darkBlueBackground {
            idc = -1;
            text = "";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.363 * safezoneH;
        };

        class FrameBackgroundFooter : lilc_RscText_whiteBackground {
            idc = -1;
            text = "";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.044 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle_darkBlueText {
            idc = -1;
            text = "Verkaeufer";
			x = 0.42526 * safezoneW + safezoneX;
			y = 0.307444 * safezoneH + safezoneY;
			w = 0.14901 * safezoneW;
			h = 0.022 * safezoneH;
        };
	};
	
	class controls {
		class ListItems : lilc_RscListbox {
			idc = 1251;
			text = "";
			sizeEx = 0.035;
			font = "PuristaMedium";
			colorText[] = {1, 1, 1, 0};
			colorSelect[] = {1, 1, 1, 0};
			colorSelect2[] = {1, 1, 1, 0};
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.308 * safezoneH;
		};

		class ButtonClose : lilc_RscButtonMenu_greyBackground {
			idc = 1252;
			text = "Close";
			onButtonClick = "closeDialog 1250;";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ButtonSell : lilc_RscButtonMenu_darkBlueBackground {
			idc = 1253;
			text = "Verkaufen";
			onButtonClick = "call lilc_shops_fnc_sellItem;";
			x = 0.426302 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
