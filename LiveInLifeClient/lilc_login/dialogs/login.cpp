
class lilc_RscButtonMainMenu : lilc_RscShortcutButton {
	idc = -1;
	type = 16;
	style = "0x02"; // + 0xC0
	default = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	animTextureNormal = "";
	animTextureDisabled = "";
	animTextureOver = "";
	animTextureFocused = "";
	animTexturePressed = "";
	animTextureDefault = "";
	colorBackground[] = {0, 0, 0, 0};
	colorBackgroundFocused[] = {0, 0, 0, 0};
	colorBackground2[] = {0, 0, 0, 0};
	color[] = {1, 1, 1, 1};
	colorFocused[] = {1, 1, 1, 1};
	color2[] = {0.7, 0.7, 0.7, 1};
	colorText[] = {1, 1, 1, 1};
	colorDisabled[] = {0, 0, 0, 0.6};
	period = 0;
	periodFocus = 0;
	periodOver = 0;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2)";
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	class TextPos
	{
		left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 30)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	class Attributes
	{
		font = "RobotoCondensed"; //font = "PuristaLight";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	class ShortcutPos
	{
		left = "(6.25 * 			(			((safezoneW / safezoneH) min 1.2) / 30)) - 0.0225 - 0.005";
		top = 0.005;
		w = 0.0225;
		h = 0.03;
	};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
	textureNoShortcut = "";
};

class lilcm_login {
	name = "lilcm_login";
	idd = 1024;
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground {};

	class controls {
		class GroupMainMenu : lilc_RscControlsGroup
		{
			idc = 2300;
			x = -0.056875 * safezoneW + safezoneX;
			y = -0.05 * safezoneH + safezoneY;
			w = 1.10344 * safezoneW;
			h = 1.1 * safezoneH;

			class Controls
			{
				class PictureLiveInLifeIcon : lilc_RscPicture
				{
					idc = 1200;
					text = "\x\lilc\addons\ui\icons\lil_icon_shadow_1024.paa";
					x = ((0.0978125 * safezoneW + safezoneX) - (-0.056875 * safezoneW + safezoneX));
					y = ((0.159 * safezoneH + safezoneY) - (-0.05 * safezoneH + safezoneY));
					w = 0.134062 * safezoneW;
					h = 0.231 * safezoneH;
				};

				class PictureModificationIcon : lilc_RscPicture
				{
					idc = 1201;
					text = "";
					x = ((0.12875 * safezoneW + safezoneX) - (-0.056875 * safezoneW + safezoneX));
					y = ((0.423 * safezoneH + safezoneY) - (-0.05 * safezoneH + safezoneY));
					w = 0.0639062 * safezoneW;
					h = 0.11 * safezoneH;
				};

				class TextLeaveServer : lilc_RscButtonMainMenu
				{
					idc = 1000;
					onButtonClick = "call lilc_login_fnc_logout;";
					onMouseEnter = "[(_this select 0), (configFile >> 'lilcm_login' >> 'controls' >> 'GroupMainMenu' >> 'controls' >> 'TextLeaveServer')] call lilc_ui_fnc_buttonMoveRight_onMouseEnter;";
					onMouseExit = "[(_this select 0), (configFile >> 'lilcm_login' >> 'controls' >> 'GroupMainMenu' >> 'controls' >> 'TextLeaveServer')] call lilc_ui_fnc_buttonMoveRight_onMouseExit;";
					text = "SERVER VERLASSEN"; //--- ToDo: Localize;
					x = ((0.0823437 * safezoneW + safezoneX) - (-0.056875 * safezoneW + safezoneX));
					y = ((0.83 * safezoneH + safezoneY) - (-0.05 * safezoneH + safezoneY));
					w = 0.221719 * safezoneW;
					h = 0.055 * safezoneH;
				};

				class TextSelectProfile : lilc_RscButtonMainMenu
				{
					idc = 1001;
					onButtonClick = "['profileMenu'] call lilc_login_fnc_selectMenu;";
					onMouseEnter = "[(_this select 0), (configFile >> 'lilcm_login' >> 'controls' >> 'GroupMainMenu' >> 'controls' >> 'TextSelectProfile')] call lilc_ui_fnc_buttonMoveRight_onMouseEnter;";
					onMouseExit = "[(_this select 0), (configFile >> 'lilcm_login' >> 'controls' >> 'GroupMainMenu' >> 'controls' >> 'TextSelectProfile')] call lilc_ui_fnc_buttonMoveRight_onMouseExit;";
					text = "PROFIL AUSWÃ„HLEN"; //--- ToDo: Localize;
					x = ((0.0823437 * safezoneW + safezoneX) - (-0.056875 * safezoneW + safezoneX));
					y = ((0.764 * safezoneH + safezoneY) - (-0.05 * safezoneH + safezoneY));
					w = 0.221719 * safezoneW;
					h = 0.055 * safezoneH;
				};

				class TitleMainMenu : lilc_RscButtonMainMenu
				{
					idc = 1003;
					size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)";
					sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)";
					text = "HauptmenÃ¼"; //--- ToDo: Localize;
					x = ((0.0875 * safezoneW + safezoneX) - (-0.056875 * safezoneW + safezoneX));
					y = ((0.61 * safezoneH + safezoneY) - (-0.05 * safezoneH + safezoneY));
					w = 0.139219 * safezoneW;
					h = 0.022 * safezoneH;
				};

				class GroupResume : lilc_RscControlsGroup
				{
					idc = 2300;
					x = ((0.0771875 * safezoneW + safezoneX) - (-0.056875 * safezoneW + safezoneX));
					y = ((0.643 * safezoneH + safezoneY) - (-0.05 * safezoneH + safezoneY));
					w = 1 * safezoneW;
					h = 0.121 * safezoneH;

					class Controls
					{
						class TextResumeGame : lilc_RscButtonMainMenu
						{
							idc = 1002;
							onButtonClick = "[] spawn lilc_login_fnc_selectProfile;";
							onMouseEnter = "[(_this select 0), (configFile >> 'lilcm_login' >> 'controls' >> 'GroupMainMenu' >> 'controls' >> 'GroupResume' >> 'controls' >> 'TextResumeGame')] call lilc_ui_fnc_buttonMoveRight_onMouseEnter; [(ctrlParentControlsGroup (_this select 0)) controlsGroupCtrl 1004, (configFile >> 'lilcm_login' >> 'controls' >> 'GroupMainMenu' >> 'controls' >> 'GroupResume' >> 'controls' >> 'TextName')] call lilc_ui_fnc_buttonMoveRight_onMouseEnter; [(ctrlParentControlsGroup (_this select 0)) controlsGroupCtrl 1005, (configFile >> 'lilcm_login' >> 'controls' >> 'GroupMainMenu' >> 'controls' >> 'GroupResume' >> 'controls' >> 'TextFaction')] call lilc_ui_fnc_buttonMoveRight_onMouseEnter;";
							onMouseExit = "[(_this select 0), (configFile >> 'lilcm_login' >> 'controls' >> 'GroupMainMenu' >> 'controls' >> 'GroupResume' >> 'controls' >> 'TextResumeGame')] call lilc_ui_fnc_buttonMoveRight_onMouseExit; [(ctrlParentControlsGroup (_this select 0)) controlsGroupCtrl 1004, (configFile >> 'lilcm_login' >> 'controls' >> 'GroupMainMenu' >> 'controls' >> 'GroupResume' >> 'controls' >> 'TextName')] call lilc_ui_fnc_buttonMoveRight_onMouseExit; [(ctrlParentControlsGroup (_this select 0)) controlsGroupCtrl 1005, (configFile >> 'lilcm_login' >> 'controls' >> 'GroupMainMenu' >> 'controls' >> 'GroupResume' >> 'controls' >> 'TextFaction')] call lilc_ui_fnc_buttonMoveRight_onMouseExit;";
							text = "WEITERSPIELEN"; //--- ToDo: Localize;
							x = 0.005156 * safezoneW;
							y = 0.055 * safezoneH;
							w = 0.221719 * safezoneW;
							h = 0.055 * safezoneH;
						};

						class TextName : lilc_RscText
						{
							idc = 1004;
							text = ""; //--- ToDo: Localize;
							x = 0.0154685 * safezoneW;
							y = 0.011 * safezoneH;
							w = 0.12375 * safezoneW;
							h = 0.022 * safezoneH;
						};

						class TextFaction : lilc_RscText
						{
							idc = 1005;
							text = ""; //--- ToDo: Localize;
							x = 0.0154685 * safezoneW;
							y = 0.033 * safezoneH;
							w = 0.12375 * safezoneW;
							h = 0.022 * safezoneH;
						};
					};
				};
			};
		};

		class GroupSelectProfileMenu : lilc_RscControlsGroup
		{
			idc = 2301;
			x = -0.056875 * safezoneW + safezoneX;
			y = -0.05 * safezoneH + safezoneY;
			w = 1.10344 * safezoneW;
			h = 1.1 * safezoneH;

			class Controls
			{
				class TextBackToMainMenu : lilc_RscButtonMainMenu
				{
					idc = 1000;
					onMouseEnter = "[(_this select 0), (configFile >> 'lilcm_login' >> 'controls' >> 'GroupSelectProfileMenu' >> 'controls' >> 'TextBackToMainMenu')] call lilc_ui_fnc_buttonMoveRight_onMouseEnter;";
					onMouseExit = "[(_this select 0), (configFile >> 'lilcm_login' >> 'controls' >> 'GroupSelectProfileMenu' >> 'controls' >> 'TextBackToMainMenu')] call lilc_ui_fnc_buttonMoveRight_onMouseExit;";
					text = "ZURÃœCK"; //--- ToDo: Localize;
					onButtonClick = "['mainMenu'] call lilc_login_fnc_selectMenu;";
					x = 0.139219 * safezoneW;
					y = 0.88 * safezoneH;
					w = 0.221719 * safezoneW;
					h = 0.055 * safezoneH;
				};

				class ListProfiles : lilc_RscListbox
				{
					idc = 1500;
					x = 0.144375 * safezoneW;
					y = 0.275 * safezoneH;
					w = 0.20625 * safezoneW;
					h = 0.429 * safezoneH;
					sizeEx = 0.05;
					rowHeight = 0.06;
					font = "PuristaMedium";
					colorBackground[] = {0.2, 0.2, 0.2, 0.5};
				};

				class TextSelect : lilc_RscButtonMainMenu
				{
					idc = 1000;
					onButtonClick = "['selectProfile'] call lilc_login_fnc_selectMenu;";
					onMouseEnter = "[(_this select 0), (configFile >> 'lilcm_login' >> 'controls' >> 'GroupSelectProfileMenu' >> 'controls' >> 'TextSelect')] call lilc_ui_fnc_buttonMoveRight_onMouseEnter;";
					onMouseExit = "[(_this select 0), (configFile >> 'lilcm_login' >> 'controls' >> 'GroupSelectProfileMenu' >> 'controls' >> 'TextSelect')] call lilc_ui_fnc_buttonMoveRight_onMouseExit;";
					text = "ANNEHMEN"; //--- ToDo: Localize;
					x = 0.144375 * safezoneW;
					y = 0.715 * safezoneH;
					w = 0.20625 * safezoneW;
					h = 0.055 * safezoneH;
				};
			};
		};
	};
};
