
class interactionMenu {
    name = "interactionMenu";
	idd = 1228;
	movingEnable = 0;
	enableSimulation = 1;
    
    class controlsBackground {
        class FrameTitleBackground : lilc_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0.7843, 0.7843, 0.7843, 1};
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class FrameButtonBackground : lilc_RscText {
            idc = 1240;
            text = "";
            colorBackground[] = {0.0863, 0.1451, 0.2118, 1};
            x = 0.44328 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.275 * safezoneH;
        };

        class FrameFooterBackground : lilc_RscText {
            idc = 1241;
            text = "";
            colorBackground[] = {0.7843, 0.7843, 0.7843, 1};
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.643 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.044 * safezoneH;
        };
	};
	
	class controls {
        class ButtonAction1 : lilc_RscButtonMenu {
            idc = 1229;
            text = "";
            colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class ButtonAction2 : lilc_RscButtonMenu {
            idc = 1230;
            text = "";
            colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonAction3 : lilc_RscButtonMenu {
            idc = 1231;
            text = "";
            colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonAction4 : lilc_RscButtonMenu {
            idc = 1232;
            text = "";
            colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonAction5 : lilc_RscButtonMenu {
            idc = 1233;
            text = "";
            colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.511 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonAction6 : lilc_RscButtonMenu {
            idc = 1234;
            text = "";
            colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonAction7 : lilc_RscButtonMenu {
            idc = 1235;
            text = "";
            colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class ButtonAction8 : lilc_RscButtonMenu {
            idc = 1236;
            text = "";
            colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
            x = 0.448438 * safezoneW + safezoneX;
	        y = 0.61 * safezoneH + safezoneY;
	        w = 0.103125 * safezoneW;
	        h = 0.022 * safezoneH;
        };

        class ButtonClose : lilc_RscButtonMenu {
            idc = 1242;
            text = "Close";
            onButtonClick = "closeDialog 0;";
            colorBackground[] = {0.7098, 0.7098, 0.7098, 1};
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.654 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle {
            idc = 1239;
            text = "";
            x = 0.446354 * safezoneW + safezoneX;
            y = 0.34074 * safezoneH + safezoneY;
            w = 0.107813 * safezoneW;
            h = 0.022 * safezoneH;
        };
	};
};
