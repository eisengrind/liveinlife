
class shop_sell_menu {
    name = "shop_sell_menu";
	idd = 1250;
	movingEnable = false;
	enableSimulation = true;
    
    class controlsBackground {
        class FrameBackground : lilc_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0, 0, 0, 0.8};
            x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.528 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle {
            idc = -1;
            text = "Händler";
            x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.022 * safezoneH;
        };

        class TitleInventory : lilc_RscTitle {
            idc = -1;
            text = "Inventory";
            x = 0.453594 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
        };

		class TitleItems : lilc_RscTitle {
			idc = -1;
			text = "Items";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
		};
	};
	
	class controls {
        class ListInventory : lilc_RscListNBox {
            idc = 1251;
            text = "";
            rowHeight = 0.1;
			drawSideArrows = 0;
			idcLeft = -1;
			idcRight = -1;
			font = "PuristaMedium";
			colorPicture[] = {1,1,1,1};
			colorPictureSelected[] = {1,1,1,1};
			colorPictureDisabled[] = {1,1,1,1};
			color[] = {0, 0, 0, 0.25};
			colorBackground[] = {0.28,0.28,0.28,0.28};
            x = 0.453594 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.385 * safezoneH;
        };

		class ButtonUp : lilc_RscButtonMenu {
			idc = 1252;
			text = "+";
			onButtonClick = "call lilc_shops_fnc_increaseSellAmount;";
			x = 0.670156 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaBold";
		};
		
		class ButtonDown : lilc_RscButtonMenu {
			idc = 1253;
			text = "-";
			onButtonClick = "call lilc_shops_fnc_decreaseSellAmount;";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaBold";
		};
		
		class StructuredAmount : lilc_RscStructuredText {
			idc = 1254;
			text = "Anzahl (0)";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
		};
		
        class ButtonSell : lilc_RscButtonMenu {
            idc = 1255;
            text = "Verkaufen";
            onButtonClick = "call lilc_shops_fnc_sellItem;";
            x = 0.304062 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
        };

        class ButtonClose : lilc_RscButtonMenu {
            idc = 1256;
            text = "Schließen";
            onButtonClick = "closeDialog 0;";
            x = 0.5 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
        };

		class ListItems : lilc_RscListBox {
			idc = 1257;
			text = "";
			disabled = 1;
			sizeEx = 0.03;
			font = "PuristaMedium";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.385 * safezoneH;
		};
	};
};
