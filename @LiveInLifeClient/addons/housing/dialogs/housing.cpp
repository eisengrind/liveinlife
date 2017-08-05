
class lilc_housingMenu {
    name = "lilc_housingMenu";
	idd = 1350;
	movingEnable = false;
	enableSimulation = true;
    
    class controlsBackground {
        class FrameTitleBarBackground : lilc_RscText {
            idc = -1;
            text = "";
            x = -0.000156274 * safezoneW + safezoneX;
            y = -0.00599999 * safezoneH + safezoneY;
            w = 1.00031 * safezoneW;
            h = 0.0485186 * safezoneH;
            colorBackground[] = {0.7843, 0.7843, 0.7843, 1};
        };
        
        class FrameSidebarBackground : lilc_RscText {
            idc = -1;
            text = "";
            x = -0.000781298 * safezoneW + safezoneX;
            y = 0.0425185 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.957 * safezoneH;
            colorBackground[] = {0.0863, 0.1451, 0.2118, 1};
        };

        class TitleDescription : lilc_RscTitle {
            idc = -1;
            text = "Description";
            font = "PuristaMedium";
            x = 0.00499997 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleBuyprice : lilc_RscTitle {
            idc = -1;
            text = "Buyprice";
            font = "PuristaMedium";
            x = 0.00499997 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleRentprice : lilc_RscTitle {
            idc = -1;
            text = "Rentprice";
            font = "PuristaMedium";
            x = 0.00499997 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };
	};
	
	class controls {
        class PictureHouse : lilc_RscPicture {
            idc = 1351;
            text = "";
            x = 0.00499997 * safezoneW + safezoneX;
            y = 0.082 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.154 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle {
            idc = 1352;
            text = "";
            font = "PuristaMedium";
            x = 0.00499997 * safezoneW + safezoneX;
            y = 0.0517778 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextDescription : lilc_RscText {
            idc = 1353;
            text = "";
            font = "PuristaLight";
            x = 0.00499997 * safezoneW + safezoneX;
            y = 0.271667 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.099 * safezoneH;
        };

        class TextBuyprice : lilc_RscText {
            idc = 1354;
            text = "";
            font = "PuristaLight";
            x = 0.00499997 * safezoneW + safezoneX;
            y = 0.402741 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class TextRentprice : lilc_RscText {
            idc = 1355;
            text = "";
            font = "PuristaLight";
            x = 0.00499997 * safezoneW + safezoneX;
            y = 0.468741 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class ButtonBuyHouse : lilc_RscButtonMenu {
            idc = 1356;
            text = "Buy";
            x = 0.00499997 * safezoneW + safezoneX;
            y = 0.969296 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
        };

        class ButtonRentHouse : lilc_RscButtonMenu {
            idc = 1357;
            text = "Rent";
            x = 0.00499997 * safezoneW + safezoneX;
            y = 0.94 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
        };

        class ButtonClose : lilc_RscButtonMenu {
            idc = 1358;
            text = "Close";
            x = 0.9125 * safezoneW + safezoneX;
            y = 0.0105 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0.7098, 0.7098, 0.7098, 1};
        };
    };
};
