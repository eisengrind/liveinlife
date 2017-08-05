
class lilcm_crafting {
	name = "lilcm_crafting";
	idd = 1310;
	enableSimulation = 1;
	movingEnable = 0;

	class controlsBackground {
		class FrameBackground : lilc_RscText
		{
			idc = 1000;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class TitleTitle : lilc_RscTitle
		{
			idc = 1001;
			text = "Crafting";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		
		class TitleRecipes : lilc_RscTitle
		{
			idc = 1002;
			text = "Rezepte";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		
		class TitleAmount : lilc_RscTitle
		{
			idc = 1004;
			text = "Anzahl";
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};

	class controls {
		class ListRecipes : lilc_RscListbox
		{
			idc = 1500;
            sizeEx = 0.032;
            onLBSelChanged = "_this call lilc_crafting_fnc_onLBSelChangedRecipes;";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.374 * safezoneH;
			font = "PuristaMedium";
		};
		
		class ButtonSearch : lilc_RscButtonMenu
		{
			idc = 1600;
			text = "Search";
            onButtonClick = "[(ctrlText 1400)] spawn lilc_crafting_fnc_updateMenuRecipes;";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class EditSearch : lilc_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ListNeeded : lilc_RscListbox
		{
			idc = 1501;
            sizeEx = 0.032;
            onLBDblClick = "_this call lilc_crafting_fnc_onLBDblClickNeeded;";
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.319 * safezoneH;
			font = "PuristaMedium";
		};

		class TextItemDisplayName : lilc_RscText
		{
			idc = 1003;
            style = 0x02;
			font = "PuristaMedium";
			text = "ItemDisplayName";
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class PictureRecipeIcon : lilc_RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.143 * safezoneH;
		};

		class TextDescription : lilc_RscStructuredText
		{
			idc = 1100;
			text = "<t size='0.9'>Beschreibung<br /><t size='0.7'>Dies sollte eigentlich für eine Testbeschreibung genutzt werden.</t></t>";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};

		/*
		class PicturePositionIcon : lilc_RscPicture
		{
			idc = 1201;
			text = "";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0191145 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class TextPositionName : lilc_RscText
		{
			idc = 1014;
			text = "Rezeptposition.";
			x = 0.457203 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.104687 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class PicturePositionNotavailable : lilc_RscPicture
		{
			idc = 1202;
			text = "notAvailable.paa"; //"\x\lilc\addons\crafting\icons\notAvailable.paa"
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0201042 * safezoneW;
			h = 0.033 * safezoneH;
		};
		*/
		
		class ButtonCraft : lilc_RscButtonMenu
		{
			idc = 1601;
			text = "Craft";
			onButtonClick = "[] spawn lilc_crafting_fnc_craftRecipe;";
			x = 0.572188 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class EditAmount : lilc_RscEdit
		{
			idc = 1401;
			text = "1";
			onChar = "_this spawn lilc_crafting_fnc_onCharEdit;";
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonTextClose : RscActiveText
		{
			idc = 1201;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
			onButtonClick = "closeDialog 1310;";
			style = 48;
			x = 0.674323 * safezoneW + safezoneX;
			y = 0.272703 * safezoneH + safezoneY;
			w = 0.00874995 * safezoneW;
			h = 0.0155185 * safezoneH;
			color[] = {1, 1, 1, 0.7};
            colorText[] = {1, 1, 1, 0.7};
            colorActive[] = {1, 1, 1, 1};
		};
	};
};
