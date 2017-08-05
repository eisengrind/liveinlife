
class RscText;
class RscButton;
class RscPicture;
class RscActiveText;
class RscCombo;
class RscDisplayArcadeMap;
class RscDisplayInventory_DLCTemplate;
class RscListBox;
class RscProgress;
class lilc_RscButton;
class lilc_RscButtonMenu;
class lilc_RscEdit;
class lilc_RscPicture;
class RscControlsGroup;

class RscDisplayInventory {
	scriptName = "RscDisplayInventory";
	scriptPath = IGUI;
	onKeyDown = "if ((_this select 1) in [62, 56]) then { true; } else { false; };";
	onMouseButtonDown = "_this call lilc_inventory_fnc_onMouseButtonDown;";
	onMouseMoving = "_this call lilc_inventory_fnc_onMouseMoving;";
	onLoad = "[""onLoad"",_this,""RscDisplayInventory"",'IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); [] spawn { waitUntil { (!isNull (findDisplay 602)) }; call lilc_inventory_fnc_onInventoryOpened; };";
	onUnload = "[""onUnload"",_this,""RscDisplayInventory"",'IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay')";
	idd = 602;
	enableSimulation = 1;
	
	class Colors {
		dragValidBgr[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])", 0.5};
		dragInvalidBgr[] = {"(profilenamespace getvariable ['IGUI_ERROR_RGB_R',0.8])", "(profilenamespace getvariable ['IGUI_ERROR_RGB_G',0.0])", "(profilenamespace getvariable ['IGUI_ERROR_RGB_B',0.0])", 0.5};
		dragValidBar[] = {"(profilenamespace getvariable ['IGUI_WARNING_RGB_R',0.8])", "(profilenamespace getvariable ['IGUI_WARNING_RGB_G',0.5])", "(profilenamespace getvariable ['IGUI_WARNING_RGB_B',0.0])", 0.5};
		dragInvalidBar[] = {"(profilenamespace getvariable ['IGUI_ERROR_RGB_R',0.8])", "(profilenamespace getvariable ['IGUI_ERROR_RGB_G',0.0])", "(profilenamespace getvariable ['IGUI_ERROR_RGB_B',0.0])", 0.5};
		progressBar[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])", 1};
		progressBarBgr[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])", "(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])", "(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])", 0.75};
		highlight[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])", 0.5};
	};
	
	class controlsBackground {
		class LiveInLifeIconPlayerBackground : lilc_RscPicture {
			idc = -1;
			text = "\x\lilc\addons\ui\images\logo.paa";
			colorText[] = {1, 1, 1, 0.1};
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.209 * safezoneH;
		};
	};
	
	class controls {
		class Background {};
		class Title {};
		class ButtonOK {};
		class ButtonCancel {};
		
		class CA_ContainerBackground : RscText {
			idc = 1001;
			x = 0.264875 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.147969 * safezoneW;
			h = 0.545481 * safezoneH;
			colorBackground[] = {0.05, 0.05, 0.05, 0.7};
		};
		
		class CA_PlayerBackground : RscText {
			idc = 1002;
			x = 0.433484 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.301615 * safezoneW;
			h = 0.523369 * safezoneH;
			colorBackground[] = {0.05, 0.05, 0.05, 0.7};
		};
		
		class TitleBackground : RscText {
			idc = 1020;
			x = "14.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "24.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0.1, 0.1, 0.1, 1};
		};
		
		class PlayersName : RscText {
			idc = 111;
			text = $STR_DIARY_PLAYER_NAME;
			x = "15.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "19.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class RankBackground : RscText {
			idc = 1014;
			x = "15.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1.25 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "0.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {1, 1, 1, 0.2};
		};
		
		class RankPicture : RscPicture {
			idc = 1203;
			text = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
			x = "15.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1.25 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "0.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class ButtonBack : RscActiveText {
			idc = 2;
			style = 48;
			color[] = {1, 1, 1, 0.7};
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
			x = "38 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {1, 1, 1, 0.7};
			colorActive[] = {1, 1, 1, 1};
			tooltip = $STR_DISP_CLOSE;
		};
		
		class BackgroundSlotPrimary : RscPicture {
			idc = 1242;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotPrimaryMuzzle : BackgroundSlotPrimary {
			idc = 1243;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotPrimaryUnderBarrel : BackgroundSlotPrimary {
			idc = 1200;
			x = "28.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotPrimaryFlashlight : BackgroundSlotPrimary {
			idc = 1244;
			x = "30.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotPrimaryOptics : BackgroundSlotPrimary {
			idc = 1245;
			x = "32.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotPrimaryMagazineGL : BackgroundSlotPrimary {
			idc = 1267;
			x = "34.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotPrimaryMagazine : BackgroundSlotPrimary {
			idc = 1246;
			x = "36.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotSecondary : BackgroundSlotPrimary {
			idc = 1247;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "11.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotSecondaryMuzzle : BackgroundSlotPrimary {
			idc = 1248;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotSecondaryUnderBarrel : BackgroundSlotPrimary {
			idc = 1266;
			x = "29 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotSecondaryFlashlight : BackgroundSlotPrimary {
			idc = 1249;
			x = "31.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotSecondaryOptics : BackgroundSlotPrimary {
			idc = 1250;
			x = "33.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotSecondaryMagazine : BackgroundSlotPrimary {
			idc = 1251;
			x = "36.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotHandgun : BackgroundSlotPrimary {
			idc = 1252;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "17 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotHandgunMuzzle : BackgroundSlotPrimary {
			idc = 1253;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotHandgunUnderBarrel : BackgroundSlotPrimary {
			idc = 1268;
			x = "29 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotHandgunFlashlight : BackgroundSlotPrimary {
			idc = 1254;
			x = "31.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotHandgunOptics : BackgroundSlotPrimary {
			idc = 1255;
			x = "33.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotHandgunMagazine : BackgroundSlotPrimary {
			idc = 1256;
			x = "36.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotHeadgear : BackgroundSlotPrimary {
			idc = 1257;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotGoggles : BackgroundSlotPrimary {
			idc = 1258;
			x = "29.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotHMD : BackgroundSlotPrimary {
			idc = 1259;
			x = "32.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotBinoculars : BackgroundSlotPrimary {
			idc = 1260;
			x = "35.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotMap : BackgroundSlotPrimary {
			idc = 1261;
			x = "15.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.12 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotGPS : BackgroundSlotPrimary {
			idc = 1262;
			x = "17.32 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.12 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotCompass : BackgroundSlotPrimary {
			idc = 1263;
			x = "21.76 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.12 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotRadio : BackgroundSlotPrimary {
			idc = 1264;
			x = "19.54 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.12 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackgroundSlotWatch : BackgroundSlotPrimary {
			idc = 1265;
			x = "23.98 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.12 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class ExternalContainerBackground : RscPicture {
			colorText[] = {1, 1, 1, 0.1};
			idc = 1240;
			x = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "3.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "18.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class PlayerContainerBackground : ExternalContainerBackground {
			idc = 1241;
			x = "15.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "14 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class GroundTab : RscActiveText {
			idc = 6321;
			colorBackgroundSelected[] = {1, 1, 1, 1};
			colorFocused[] = {1, 1, 1, 0};
			soundDoubleClick[] = {"", 0.1, 1};
			color[] = {1, 1, 1, 1};
			colorBackground[] = {0, 0, 0, 1};
			x = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "5.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class SoldierTab : GroundTab {
			idc = 6401;
			x = "7 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "5.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class GroundContainer : RscListBox {
			class DLCTemplate : RscDisplayInventory_DLCTemplate {
				class Controls;	// External class reference
			};
			//onLBSelChanged = "_this call lilc_inventory_fnc_onContainerInventoryChange;";
			idc = 632;
			sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx2 = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			rowHeight = "2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			canDrag = 1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0, 0, 0, 0};
			itemBackground[] = {1, 1, 1, 0.1};
			itemSpacing = 0.001;
			x = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "3.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "18.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class SoldierContainer : GroundContainer {
			idc = 640;
		};
		
		class GroundFilter : RscCombo {
			idc = 6554;
			x = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class GroundLoad : RscProgress {
			idc = 6307;
			texture = "";
			textureExt = "";
			colorBar[] = {0.9, 0.9, 0.9, 0.9};
			colorExtBar[] = {1, 1, 1, 1};
			colorFrame[] = {1, 1, 1, 1};
			x = 0.271062 * safezoneW + safezoneX;
			y = 0.76136 * safezoneH + safezoneY;
			w = 0.136125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class SlotPrimary : GroundTab {
			class DLCTemplate : RscDisplayInventory_DLCTemplate {
				class Controls;	// External class reference
			};
			idc = 610;
			style = 0x30 + 0x800;
			color[] = {1, 1, 1, 1};
			colorBackground[] = {1, 1, 1, 0.1};
			colorBackgroundSelected[] = {1, 1, 1, 0.1};
			colorFocused[] = {0, 0, 0, 0};
			canDrag = 1;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotPrimaryMuzzle : SlotPrimary {
			idc = 620;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotPrimaryUnderBarrel : SlotPrimary {
			idc = 641;
			x = "28.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotPrimaryFlashlight : SlotPrimary {
			idc = 622;
			x = "30.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotPrimaryOptics : SlotPrimary {
			idc = 621;
			x = "32.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotPrimaryMagazineGL : SlotPrimary {
			idc = 644;
			x = "34.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotPrimaryMagazine : SlotPrimary {
			idc = 623;
			x = "36.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotSecondary : SlotPrimary {
			idc = 611;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "11.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotSecondaryMuzzle : SlotPrimary {
			idc = 624;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotSecondaryUnderBarrel : SlotPrimary {
			idc = 642;
			x = "29 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.59 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotSecondaryFlashlight : SlotPrimary {
			idc = 626;
			x = "31.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotSecondaryOptics : SlotPrimary {
			idc = 625;
			x = "33.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotSecondaryMagazine : SlotPrimary {
			idc = 627;
			x = "36.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotHandgun : SlotPrimary {
			idc = 612;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "17 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotHandgunMuzzle : SlotPrimary {
			idc = 628;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotHandgunUnderBarrel : SlotPrimary {
			idc = 643;
			x = "29 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotHandgunFlashlight : SlotPrimary {
			idc = 630;
			x = "31.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotHandgunOptics : SlotPrimary {
			idc = 629;
			x = "33.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotHandgunMagazine : SlotPrimary {
			idc = 631;
			x = "36.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotHeadgear : SlotPrimary {
			idc = 6240;
			x = "26.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotGoggles : SlotPrimary {
			idc = 6216;
			x = "29.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotHMD : SlotPrimary {
			idc = 6217;
			x = "32.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotBinoculars : SlotPrimary {
			idc = 6238;
			x = "35.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotMap : SlotPrimary {
			idc = 6211;
			x = "15.16 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotGPS : SlotPrimary {
			idc = 6215;
			x = "17.38 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotCompass : SlotPrimary {
			idc = 6212;
			x = "21.82 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotRadio : SlotPrimary {
			idc = 6214;
			x = "19.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class SlotWatch : SlotPrimary {
			idc = 6213;
			x = "24.04 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class UniformTab : GroundTab {
			idc = 6332;
			x = "15.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {1, 1, 1, 0.5};
		};
		
		class UniformSlot : SlotPrimary {
			idc = 6331;
			x = "15.35 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class UniformLoad : GroundLoad {
			idc = 6304;
			x = "15.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "5.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class UniformContainer : GroundContainer {
			idc = 633;
			onLBSelChanged = "_this spawn lilc_inventory_fnc_onLBSelChanged;";
			x = "15.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "14 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VestTab : UniformTab {
			idc = 6382;
			x = "18.85 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VestSlot : SlotPrimary {
			idc = 6381;
			x = "19.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class VestLoad : GroundLoad {
			idc = 6305;
			x = "18.85 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "5.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VestContainer : UniformContainer {
			idc = 638;
		};
		
		class BackpackTab : UniformTab {
			idc = 6192;
			x = "22.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackpackSlot : SlotPrimary {
			idc = 6191;
			x = "22.85 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0, 0, 0, 0.5};
		};
		
		class BackpackLoad : GroundLoad {
			idc = 6306;
			x = "22.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "5.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class BackpackContainer : UniformContainer {
			idc = 619;
		};
		
		class TotalLoad : GroundLoad {
			idc = 6308;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.76114 * safezoneH + safezoneY;
			w = 0.291137 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ContainerMarker : GroundTab {
			idc = 6325;
			x = 0.278797 * safezoneW + safezoneX;
			y = 0.79414 * safezoneH + safezoneY;
			w = 0.012375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class GroundMarker : ContainerMarker {
			idc = 6385;
			x = 0.292203 * safezoneW + safezoneX;
			y = 0.79414 * safezoneH + safezoneY;
			w = 0.012375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class SoldierMarker : ContainerMarker {
			idc = 6405;
			x = 0.264875 * safezoneW + safezoneX;
			y = 0.79414 * safezoneH + safezoneY;
			w = 0.012375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ContainerMoveAmount : lilc_RscEdit {
			idc = 1396;
			text = "0";
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.714444 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class ContainerMoveButton : lilc_RscButtonMenu {
			idc = 1397;
			text = "Move";
			onButtonClick = "[] spawn lilc_inventory_fnc_moveContainerItem;";
			x = 0.30927 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class PlayerMoveAmount : lilc_RscEdit {
			idc = 1398;
			text = "0";
			x = 0.439688 * safezoneW + safezoneX;
			y = 0.71537 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class PlayerMoveButton : lilc_RscButtonMenu {
			idc = 1399;
			text = "Move";
			onButtonClick = "[] spawn lilc_inventory_fnc_movePlayerItem;";
			x = 0.47625 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TitleBackgroundVI : TitleBackground {
			idc = -1;
			text = "";
			x = 0.737188 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TitleVI : PlayersName {
			idc = -1;
			text = "$STR_lilc_inventory_DialogName_TitleVI";
			x = 0.737188 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class FrameBackgroundVI : CA_PlayerBackground {
			idc = -1;
			text = "";
			x = 0.737188 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.473 * safezoneH;
		};

		class ListVI : UniformContainer {
			idc = 1407;
			text = "";
			x = 0.742344 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.418 * safezoneH;
		};

		class ButtonDropVI : lilc_RscButtonMenu {
			idc = -1;
			text = "$STR_lilc_inventory_DialogName_ButtonDropVI";
			x = 0.742344 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};

		
		class DropDownGroup : RscControlsGroup
		{
			idc = 1350;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.11 * safezoneH;

			class VScrollbar {
				autoScrollSpeed = -1;
				autoScrollDelay = 5;
				autoScrollRewind = 0;
				color[] = {1,1,1,0};
				width = 0.001;
			};
			
			class HScrollbar {
				autoScrollSpeed = -1;
				autoScrollDelay = 5;
				autoScrollRewind = 0;
				color[] = {1,1,1,0};
				height = 0.001;
			};

			class controls
			{
				class ButtonDropwdown1 : lilc_RscButton
				{
					idc = 1351;
					text = "";
					type = 1;
					style = 2;
					sizeEx = 0.02674;
					colorText[] = {1, 1, 1, 1};
					colorBackground[] = {0, 0, 0, 0.8};
					colorBackgroundActive[] = {0.63, 0.02, 0.02, 0.8};
					colorBackgroundDisabled[] = {1, 1, 1, 0};
					colorFocused[] = {0, 0, 0, 0.8};
					colorShadow[] = {1, 1, 1, 0};

					class Attributes
					{
						font = "PuristaSemiBold";
						color = "#E5E5E5";
						align = "center";
						shadow = "false";
					};

					shadow = 0;
					sizeEx = 0.030;
					x = 0 * safezoneW;
					y = 1.63913e-008 * safezoneH;
					w = 0.0928125 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class ButtonDropwdown2: ButtonDropwdown1
				{
					idc = 1352;
					x = 0 * safezoneW;
					y = 0.022 * safezoneH;
					w = 0.0928125 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class ButtonDropwdown3: ButtonDropwdown1
				{
					idc = 1353;
					x = 0 * safezoneW;
					y = 0.044 * safezoneH;
					w = 0.0928125 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class ButtonDropwdown4: ButtonDropwdown1
				{
					idc = 1354;
					x = 0 * safezoneW;
					y = 0.066 * safezoneH;
					w = 0.0928125 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class ButtonDropwdown5: ButtonDropwdown1
				{
					idc = 1355;
					x = 0 * safezoneW;
					y = 0.088 * safezoneH;
					w = 0.0928125 * safezoneW;
					h = 0.022 * safezoneH;
				};
				
				class ButtonDropwdown6: ButtonDropwdown1
				{
					idc = 1356;
					x = 0 * safezoneW;
					y = 0.110 * safezoneH;
					w = 0.0928125 * safezoneW;
					h = 0.022 * safezoneH;
				};
				
				class ButtonDropwdown7: ButtonDropwdown1
				{
					idc = 1357;
					x = 0 * safezoneW;
					y = 0.132 * safezoneH;
					w = 0.0928125 * safezoneW;
					h = 0.022 * safezoneH;
				};
				
				class ButtonDropwdown8: ButtonDropwdown1
				{
					idc = 1358;
					x = 0 * safezoneW;
					y = 0.154 * safezoneH;
					w = 0.0928125 * safezoneW;
					h = 0.022 * safezoneH;
				};
				
				class ButtonDropwdown9: ButtonDropwdown1
				{
					idc = 1359;
					x = 0 * safezoneW;
					y = 0.176 * safezoneH;
					w = 0.0928125 * safezoneW;
					h = 0.022 * safezoneH;
				};
			};
		};

		class ButtonCrafting : lilc_RscButtonMenu {
			idc = -1;
			text = "Crafting";
			onButtonClick = "[] spawn lilc_crafting_fnc_openMenu;";
			x = 0.737188 * safezoneW + safezoneX
			y = 0.75938 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
