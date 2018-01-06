
class lilc_map_GroupMarkerCategories : lilc_RscControlsGroup
{
	idc = 2300;
	x = 0.133906 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.264 * safezoneH;
	class Controls
	{
		class FrameBackground : lilc_RscText
		{
			idc = 1001;
			x = 0.005156 * safezoneW;
			y = 0.033 * safezoneH;
			w = 0.103125 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};

		class TextTitle : lilc_RscText
		{
			idc = 1000;
			text = "Legende:"; //--- ToDo: Localize;
			x = 0.005156 * safezoneW;
			y = 0.011 * safezoneH;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.890196,0.294118,0,0.8};
		};

		class ListMarkerCategories : lilc_RscListNBox
		{
			idc = 1500;
			x = 0.005156 * safezoneW;
			y = 0.033 * safezoneH;
			w = 0.103125 * safezoneW;
			h = 0.22 * safezoneH;
			rowHeight = 0.05;
			drawSideArrows = 1;
			idcLeft = -1;
			idcRight = 2200;
		};

		class ButtonCheck : lilc_RscCheckbox
		{
			idc = 2200;
			x = 0;
			y = 0;
		};
	};
};
