
class lilcm_exchange
{
    idd = 2302;
	name = "lilcm_exchange";
    movingEnable = 1;
    enableSimulation = 1;
	onUnload = "lilc_exchange_currentExchange = '';";

	class controlsBackground
	{
		class FrameButtonOffersBackground : RscText
		{
			idc = 998;
			text = "";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.6};
		};

		class FrameButtonAccountBackground : RscText
		{
			idc = 999;
			text = "";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.2};
		};

		class FrameWrapperBackground : RscText
		{
			idc = 1001;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.506 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};

		class FrameBackground : RscText
		{
			idc = 1002;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.451 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};

		class TitleExchange : RscText
		{
			moving = 1;
			idc = 1000;
			text = ""; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
		};
	};
	
	class controls
	{
		class ButtonClose: RscActiveText {
			idc = -1;
            style = 48;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
			x = 0.689028 * safezoneW + safezoneX;
			y = 0.23798 * safezoneH + safezoneY;
			w = 0.0110417 * safezoneW;
			h = 0.0188889 * safezoneH;
			onButtonClick = "closeDialog 2302;";
			color[] = {1, 1, 1, 0.7};
            colorText[] = {1, 1, 1, 0.7};
            colorActive[] = {1, 1, 1, 1};
		};

		class ButtonOffers : RscButton
		{
			idc = 1600;
			text = "Angebote"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[nil, 'offers'] call lilc_exchange_fnc_openMenu;";
			colorBackground[] = {0, 0, 0, 0};
			colorBackgroundActive[] = {0, 0, 0, 0};
			colorBackgroundDisabled[] = {0, 0, 0, 0};
			colorFocused[] = {0, 0, 0, 0};
			period = 0;
		};

		class ButtonAccount : RscButton
		{
			idc = 1601;
			text = "Mein Konto"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[nil, 'account'] call lilc_exchange_fnc_openMenu;";
			colorBackground[] = {0, 0, 0, 0};
			colorBackgroundActive[] = {0, 0, 0, 0};
			colorBackgroundDisabled[] = {0, 0, 0, 0};
			colorFocused[] = {0, 0, 0, 0};
			period = 0;
		};

		class GroupOffers: RscControlsGroup
		{
			idc = 2300;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.473 * safezoneH;

			class Controls
			{
				class FrameListSellsBackground : RscText
				{
					idc = -1;
					text = "";
					colorBackground[] = {0,0,0,0.3};
					x = 0.0154688 * safezoneW;
					y = 0.077 * safezoneH;
					w = 0.309375 * safezoneW;
					h = 0.154 * safezoneH;
				};
				
				class ListSells: lilc_RscListNBox
				{
					idc = 1500;
					x = 0.0154688 * safezoneW;
					y = 0.077 * safezoneH;
					w = 0.309375 * safezoneW;
					h = 0.154 * safezoneH;
					rowHeight = 0.05;
					drawSideArrows = 0;
					idcLeft = -1;
					idcRight = -1;
					columns[] = {0, 0.54, 0.71};
				};

				class TextSelectItem: RscText
				{
					idc = 1003;
					text = "Item:"; //--- ToDo: Localize;
					x = 0.0103125 * safezoneW;
					y = 0.022 * safezoneH;
					w = 0.0670311 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
				};

				class TextOffers: RscText
				{
					idc = 1004;
					text = "Angebote:"; //--- ToDo: Localize;
					x = 0.0103125 * safezoneW;
					y = 0.055 * safezoneH;
					w = 0.0670311 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
				};

				class TextSeller: RscText
				{
					idc = 1005;
					text = "Anbieter"; //--- ToDo: Localize;
					x = 0.0154688 * safezoneW;
					y = 0.231 * safezoneH;
					w = 0.170156 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
				};

				class TextAmount: RscText
				{
					idc = 1006;
					text = "Menge"; //--- ToDo: Localize;
					x = 0.185625 * safezoneW;
					y = 0.231 * safezoneH;
					w = 0.0567187 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
				};

				class TextPrice: RscText
				{
					idc = 1007;
					text = "Stk./Preis"; //--- ToDo: Localize;
					x = 0.242344 * safezoneW;
					y = 0.231 * safezoneH;
					w = 0.0825 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
				};

				class FrameBuys: RscFrame
				{
					idc = 1800;
					x = 0.33 * safezoneW;
					y = 0.099 * safezoneH;
					w = 0.0567187 * safezoneW;
					h = 0.11 * safezoneH;
				};

				class FrameSells: RscFrame
				{
					idc = 1801;
					x = 0.33 * safezoneW;
					y = 0.275 * safezoneH;
					w = 0.0567187 * safezoneW;
					h = 0.11 * safezoneH;
				};

				class ComboSelectItem: RscCombo
				{
					idc = 2100;
					x = 0.0825 * safezoneW;
					y = 0.022 * safezoneH;
					w = 0.309375 * safezoneW;
					h = 0.022 * safezoneH;
					onLBSelChanged = "_this call lilc_exchange_fnc_offers_handleOnLBSelChanged;";
				};

				class FrameListBuysBackground : RscText
				{
					idc = -1;
					text = "";
					colorBackground[] = {0,0,0,0.3};
					x = 0.0154688 * safezoneW;
					y = 0.253 * safezoneH;
					w = 0.309375 * safezoneW;
					h = 0.154 * safezoneH;
				};
				
				class ListBuys: lilc_RscListNBox
				{
					idc = 1501;
					x = 0.0154688 * safezoneW;
					y = 0.253 * safezoneH;
					w = 0.309375 * safezoneW;
					h = 0.154 * safezoneH;
					rowHeight = 0.05;
					drawSideArrows = 0;
					idcLeft = -1;
					idcRight = -1;
					columns[] = {0, 0.54, 0.71};
				};

				class ButtonCreateOffer: RscButton
				{
					idc = 1602;
					text = "Angebot erstellen"; //--- ToDo: Localize;
					x = 0.0103125 * safezoneW;
					y = 0.418 * safezoneH;
					w = 0.134062 * safezoneW;
					h = 0.033 * safezoneH;
					onButtonClick = "[] call lilc_exchange_fnc_openMenuCreate;";
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.3};
				};

				class TextFrameBuysAmount: RscText
				{
					idc = 1008;
					text = "Anzahl:"; //--- ToDo: Localize;
					x = 0.335156 * safezoneW;
					y = 0.11 * safezoneH;
					w = 0.0464063 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
				};

				class TextFrameSellsAmount: RscText
				{
					idc = 1009;
					text = "Anzahl:"; //--- ToDo: Localize;
					x = 0.335156 * safezoneW;
					y = 0.286 * safezoneH;
					w = 0.0464063 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
				};

				class EditFrameBuysAmount: RscEdit
				{
					idc = 1400;
					x = 0.335156 * safezoneW;
					y = 0.143 * safezoneH;
					w = 0.0464063 * safezoneW;
					h = 0.022 * safezoneH;
				};

				class ButtonFrameBuysBuy: RscButton
				{
					idc = 1603;
					text = "Kaufen"; //--- ToDo: Localize;
					x = 0.335156 * safezoneW;
					y = 0.176 * safezoneH;
					w = 0.0464063 * safezoneW;
					h = 0.022 * safezoneH;
					onButtonClick = "call lilc_exchange_fnc_offers_buy;";
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.3};
				};

				class ButtonFrameSellsSell: RscButton
				{
					idc = 1604;
					text = "Verkaufen"; //--- ToDo: Localize;
					x = 0.335156 * safezoneW;
					y = 0.352 * safezoneH;
					w = 0.0464063 * safezoneW;
					h = 0.022 * safezoneH;
					onButtonClick = "call lilc_exchange_fnc_offers_sell;";
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.3};
				};

				class EditFrameSellsAmount: RscEdit
				{
					idc = 1401;
					x = 0.335156 * safezoneW;
					y = 0.319 * safezoneH;
					w = 0.0464063 * safezoneW;
					h = 0.022 * safezoneH;
				};
			};
		};

		class GroupAccount : RscControlsGroup
		{
			idc = 2301;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.451 * safezoneH;

			class Controls
			{
				class ListWares: RscListbox
				{
					idc = 1502;
					x = 0.00515698 * safezoneW;
					y = 0.033 * safezoneH;
					w = 0.134062 * safezoneW;
					h = 0.33 * safezoneH;
				};

				class TitleWares: RscText
				{
					idc = 1010;
					text = "Warenlager:"; //--- ToDo: Localize;
					x = 0.00515698 * safezoneW;
					y = 0.011 * safezoneH;
					w = 0.134062 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
				};

				class ComboWareContainer: RscCombo
				{
					idc = 2101;
					x = 0.051563 * safezoneW;
					y = 0.374 * safezoneH;
					w = 0.0876563 * safezoneW;
					h = 0.022 * safezoneH;
				};

				class ButtonGetWare: RscButton
				{
					idc = 1605;
					text = "Ware ausgeben"; //--- ToDo: Localize;
					x = 0.00515698 * safezoneW;
					y = 0.407 * safezoneH;
					w = 0.134062 * safezoneW;
					h = 0.033 * safezoneH;
					onButtonClick = "call lilc_exchange_fnc_account_drawItem;";
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.3};
				};

				class TextWareContainer: RscText
				{
					idc = 1011;
					text = "Inventar:"; //--- ToDo: Localize;
					x = 0.00515597 * safezoneW;
					y = 0.374 * safezoneH;
					w = 0.0464063 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
				};

				class TitleCredit: RscText
				{
					idc = 1012;
					text = "Guthaben:"; //--- ToDo: Localize;
					x = 0.144376 * safezoneW;
					y = 0.011 * safezoneH;
					w = 0.242344 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
				};

				class TextCredit: RscText
				{
					idc = 1013;
					text = ""; //--- ToDo: Localize;
					x = 0.144376 * safezoneW;
					y = 0.044 * safezoneH;
					w = 0.128906 * safezoneW;
					h = 0.022 * safezoneH;
				};

				class ButtonGetCredits: RscButton
				{
					idc = 1606;
					text = "Guthaben auszahlen"; //--- ToDo: Localize;
					x = 0.278438 * safezoneW;
					y = 0.044 * safezoneH;
					w = 0.108281 * safezoneW;
					h = 0.022 * safezoneH;
					onButtonClick = "call lilc_exchange_fnc_account_drawCash;";
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.3};
				};

				class TitleMyOffers: RscText
				{
					idc = 1014;
					text = "Meine Angebote:"; //--- ToDo: Localize;
					x = 0.144376 * safezoneW;
					y = 0.088 * safezoneH;
					w = 0.242344 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
				};

				class FrameListMyOffersBackground : RscText
				{
					idc = -1;
					text = "";
					colorBackground[] = {0,0,0,0.3};
					x = 0.144376 * safezoneW;
					y = 0.132 * safezoneH;
					w = 0.242344 * safezoneW;
					h = 0.264 * safezoneH;
				};

				class ListMyOffers : lilc_RscListNBox
				{
					idc = 1503;
					x = 0.144376 * safezoneW;
					y = 0.132 * safezoneH;
					w = 0.242344 * safezoneW;
					h = 0.264 * safezoneH;
					rowHeight = 0.05;
					drawSideArrows = 0;
					idcLeft = -1;
					idcRight = -1;
					columns[] = {0, 0.265, 0.368, 0.54, 0.75};
				};

				class ButtonDeleteOffer: RscButton
				{
					idc = 1607;
					text = "Entfernen"; //--- ToDo: Localize;
					x = 0.273282 * safezoneW;
					y = 0.407 * safezoneH;
					w = 0.113437 * safezoneW;
					h = 0.033 * safezoneH;
					onButtonClick = "call lilc_exchange_fnc_account_removeOffer;";
					colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.3};
				};

				class TitleMyOffersItem: RscText
				{
					idc = 1015;
					text = "Item:"; //--- ToDo: Localize;
					x = 0.144376 * safezoneW;
					y = 0.11 * safezoneH;
					w = 0.0670312 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};

				class TitleMyOffersType: RscText
				{
					idc = 1016;
					text = "Typ:"; //--- ToDo: Localize;
					x = 0.211407 * safezoneW;
					y = 0.11 * safezoneH;
					w = 0.0257812 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};

				class TitleMyOffersAmount: RscText
				{
					idc = 1017;
					text = "Anzahl:"; //--- ToDo: Localize;
					x = 0.237188 * safezoneW;
					y = 0.11 * safezoneH;
					w = 0.04125 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};

				class TitleMyOffersPrice: RscText
				{
					idc = 1018;
					text = "Stk./Preis:"; //--- ToDo: Localize;
					x = 0.278438 * safezoneW;
					y = 0.11 * safezoneH;
					w = 0.0515625 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};

				class TitleMyOffersDate: RscText
				{
					idc = 1019;
					text = "Datum:"; //--- ToDo: Localize;
					x = 0.33 * safezoneW;
					y = 0.11 * safezoneH;
					w = 0.0567187 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
			};
		};
	};
};
