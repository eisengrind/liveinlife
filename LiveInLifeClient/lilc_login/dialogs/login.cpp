/*
Accessible IDC's
 -> (edit) username = 1025
 -> (edit) password = 1026
 -> (button) signup = 1027
 -> (button) login  = 1028
*/

class login {
    name = "login";
	idd = 1024;
    fadein = 2;
	fadeout = 0;
	onUnload = "(findDisplay 1024) displayRemoveEventHandler [""KeyDown"", lilc_account_escapeEventHandler];";
	onDestroy = "(findDisplay 1024) displayRemoveEventHandler [""KeyDown"", lilc_account_escapeEventHandler];";
	movingEnable = false;
	enableSimulation = true;
    
    class controlsBackground {
		class FrameBackgound : lilc_RscText {
			idc = -1;
			text = "";
			colorBackground[] = {0.0863, 0.1451, 0.2118, 1};
			x = 0.371094 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.257813 * safezoneW;
            h = 0.286 * safezoneH;
		};
		
		class FrameBackgroundTitle : lilc_RscText {
			idc = -1;
			text = "";
			colorBackground[] = {0.7843, 0.7843, 0.7843, 1};
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class FrameBackgroundFooter : lilc_RscText {
			idc = -1;
			text = "";
			colorBackground[] = {0.7843, 0.7843, 0.7843, 1};
			x = 0.371094 * safezoneW + safezoneX;
            y = 0.632 * safezoneH + safezoneY;
            w = 0.257813 * safezoneW;
            h = 0.044 * safezoneH;
		};
		
		class TitleHeader : lilc_RscTitle {
			idc = -1;
			sizeEx = 0.045;
			font = "PuristaMedium";
			text = "Live In Life - Login";
			colorText[] = {0.0863, 0.1451, 0.2118, 1};
			x = 0.374219 * safezoneW + safezoneX;
			y = 0.31937 * safezoneH + safezoneY;
			w = 0.251614 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class TitleUsername : lilc_RscTitle {
			idc = -1;
			sizeEx = 0.04;
			text = "Benutzer:";
			font = "PuristaMedium";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls {
		class ComboUsername : lilc_RscCombo {
			idc = 1025;
			text = "";
			sizeEx = 0.040;
			font = "PuristaMedium";
			colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.382593 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.044 * safezoneH;
			rowHeight = "0.044 * safezoneH";
		};
		
		class TextError : lilc_RscStructuredText {
			idc = 1029;
			text = "";
			sizeEx = 0.02;
			font = "PuristaLight";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonLogin : lilc_RscButtonMenu {
			idc = 1027;
			text = "Einloggen";
			colorBackground[] = {0.7098, 0.7098, 0.7098, 1};
			onButtonClick = "[] spawn lilc_login_fnc_processLogin;";
			x = 0.37625 * safezoneW + safezoneX;
            y = 0.643 * safezoneH + safezoneY;
            w = 0.121719 * safezoneW;
            h = 0.022 * safezoneH;
		};
		
		class ButtonSignUp : lilc_RscButtonMenu {
			idc = 1028;
			text = "Neu erstellen";
			colorBackground[] = {0.7098, 0.7098, 0.7098, 1};
			onButtonClick = "[] spawn { closeDialog 1024; sleep 0.02; [] call lilc_login_fnc_openSignupMenu; };";
			x = 0.502552 * safezoneW + safezoneX;
            y = 0.643 * safezoneH + safezoneY;
            w = 0.121198 * safezoneW;
            h = 0.022 * safezoneH;
		};
	};
};