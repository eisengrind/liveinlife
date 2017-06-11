
class lilcm_pda {
	name = "lilcm_pda";
	idd = 1642;
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class FrameBackgroundBackground : lilc_RscText
		{
			idc = -1;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.484 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};

		class TitleTitle : lilc_RscText
		{
			idc = -1;
			text = "Einwohner- und Informationsdatenbankzentrierte Zentrale"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
	};

	class controls {
		/****** SEARCH **********************************/
		/****** IDCs: 1400, 1600, 1500, 1601, 1002 ******/
		/************************************************/

		class search_EditSearch : lilc_RscEdit
		{
			idc = 1400;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class search_ButtonSearch : lilc_RscButtonMenu
		{
			idc = 1600;
			onButtonClick = "call lilc_pda_fnc_onButtonClickSearch;";
			text = "Search"; //--- ToDo: Localize;
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class search_ListPlayers : lilc_RscListbox
		{
			idc = 1500;
			sizeEx = 0.032;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.363 * safezoneH;
		};

		/*class search_ButtonPunishments : lilc_RscButtonMenu
		{
			idc = 1608;
			text = "Strafen";
			onButtonClick = "call lilc_pda_fnc_onButtonClickPunishments ";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class search_ButtonLicenses : lilc_RscButtonMenu
		{
			idc = 1609;
			text = "Lizenzen";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};*/

		class search_ButtonSelect : lilc_RscButtonMenu
		{
			idc = 1601;
			onButtonClick = "call lilc_pda_fnc_onButtonClickSelect;";
			text = "Select"; //--- ToDo: Localize;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class search_TitleUsers : lilc_RscText
		{
			idc = 1002;
			text = "Ergebnisse fÃ¼r <xyz>:"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.312074 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};


		/****** CATEGORIES ******************************************************************************/
		/****** IDCs: 1003, 1004, 1005, 1602, 1603, 1604, 2100, 1006, 1501, 1007, 1008, 1009, 2300, 1605 ******/
		/************************************************************************************************/
		
		class categories_TitleName : lilc_RscText
		{
			idc = 1003;
			text = "Name:"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.95};
		};

		class categories_TextUser : lilc_RscText
		{
			idc = 1004;
			text = ""; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class categories_TitleCategories : lilc_RscText
		{
			idc = 1005;
			text = "Kategorien:"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.95};
		};

		class categories_ButtonAddEntry : lilc_RscButtonMenu
		{
			idc = 1602;
			text = "hinzufÃ¼gen"; //--- ToDo: Localize;
			onButtonClick = "['create'] call lilc_pda_fnc_selectMenu;";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.95};
		};

		/*class categories_ButtonEditEntry : lilc_RscButtonMenu
		{
			idc = 1603;
			text = "bearbeiten"; //--- ToDo: Localize;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.95};
		};*/

		class categories_ButtonDeleteEntry : lilc_RscButtonMenu
		{
			idc = 1604;
			onButtonClick = "call lilc_pda_fnc_onButtonClickRemove;";
			text = "loeschen"; //--- ToDo: Localize;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.95};
		};

		class categories_ComboCategories : lilc_RscCombo
		{
			idc = 2100;
			onLBSelChanged = "call lilc_pda_fnc_onLBSelChangedCategory;";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class categories_TitleEntries : lilc_RscText
		{
			idc = 1006;
			text = "Eintraege:"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.95};
		};

		class categories_ListEntries : lilc_RscListbox
		{
			idc = 1501;
			sizeEx = 0.032;
			onLBSelChanged = "call lilc_pda_fnc_onLBSelChangedEntry;";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.286 * safezoneH;
		};

		class categories_TitleEntryTitle : lilc_RscText
		{
			idc = 1007;
			text = "Titel des Eintrages:"; //--- ToDo: Localize;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class categories_TextEntryTitle : lilc_RscText
		{
			idc = 1008;
			text = ""; //--- ToDo: Localize;
			x = 0.479377 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class categories_TitleDescription : lilc_RscText
		{
			idc = 1009;
			text = "Beschreibung des Eintrages:"; //--- ToDo: Localize;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class categories_GroupDescription : lilc_RscControlsGroup
		{
			idc = 2300;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.352 * safezoneH;

			class Controls
			{
				class categories_TextDescription : lilc_RscStructuredText
				{
					idc = 1100;
					x = 0.00515602 * safezoneW;
					y = 0.011 * safezoneH;
					w = 0.211406 * safezoneW;
					h = 1 * safezoneH;
					colorBackground[] = {0,0,0,0};
				};
			};
		};
		
		class categories_ButtonBack : lilc_RscButtonMenu
		{
			idc = 1605;
			onButtonClick = "['search'] call lilc_pda_fnc_selectMenu;";
			text = "Zurueck"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};


		/****** CATEGORIES ************************************************/
		/****** IDCs: 1010, 1401, 2101, 1011, 1012, 1402, 1607, 1606 ******/
		/******************************************************************/

		class create_TitleCombo : lilc_RscText
		{
			idc = 1010;
			text = "Kategorie:"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.95};
		};

		class create_EditTitle : lilc_RscEdit
		{
			idc = 1401;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class create_ComboCategories : lilc_RscCombo
		{
			idc = 2101;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class create_TitleEdit : lilc_RscText
		{
			idc = 1011;
			text = "Titel:"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.95};
		};

		class create_TitleDescription : lilc_RscText
		{
			idc = 1012;
			text = "Beschreibung:"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.95};
		};

		class create_EditDescription : lilc_RscEdit
		{
			idc = 1402;
			style = 16;
			htmlControl = true;
			autocomplete = "";
			lineSpacing = 1;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.381563 * safezoneW;
			h = 0.231 * safezoneH;
		};

		class create_ButtonBack : lilc_RscButtonMenu
		{
			idc = 1607;
			onButtonClick = "['categories'] call lilc_pda_fnc_selectMenu;";
			text = "Zurueck"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class create_ButtonAdd : lilc_RscButtonMenu
		{
			idc = 1606;
			onButtonClick = "call lilc_pda_fnc_onButtonClickAdd;";
			text = "HinzufÃ¼gen"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
