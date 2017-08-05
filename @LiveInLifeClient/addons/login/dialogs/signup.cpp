/*
Accessible IDC's
 -> (edit) username = 1030
 -> (edit) password = 1031
 -> (edit) email    = 1032
 -> (button) signup = 1033
 -> (button) login  = 1034
*/

class signup {
    name = "signup";
	idd = 1029;
    fadein = 2;
	fadeout = 0;
    onUnload = "(findDisplay 1029) displayRemoveEventHandler [""KeyDown"", lilc_account_escapeEventHandler];";
	onDestroy = "(findDisplay 1029) displayRemoveEventHandler [""KeyDown"", lilc_account_escapeEventHandler];";
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
			text = "Live in Life - Registrierung";
            sizeEx = 0.045;
            font = "PuristaMedium";
            colorText[] = {0.0863, 0.1451, 0.2118, 1};
            shadow = 0;
			x = 0.374219 * safezoneW + safezoneX;
            y = 0.31937 * safezoneH + safezoneY;
            w = 0.251614 * safezoneW;
            h = 0.022 * safezoneH;
		};
		
		class TitleFirstname : lilc_RscTitle {
			idc = -1;
            sizeEx = 0.04;
			text = "Roleplay-Vorname:";
            font = "PuristaMedium";
			x = 0.37625 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.022 * safezoneH;
		};
		
		class TitleGender : lilc_RscTitle {
			idc = -1;
            sizeEx = 0.04;
			text = "Geschlecht:";
            font = "PuristaMedium";
			x = 0.37625 * safezoneW + safezoneX;
            y = 0.511 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.022 * safezoneH;
		};
		
		class TitleLastname : lilc_RscTitle {
			idc = -1;
            sizeEx = 0.04;
			text = "Roleplay-Nachname:";
            font = "PuristaMedium";
			x = 0.37625 * safezoneW + safezoneX;
            y = 0.434 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.022 * safezoneH;
		};
	};
    
    class controls {
        class EditFirstname : lilc_RscEdit {
            idc = 1030;
            text = "";
            sizeEx = 0.035;
            font = "PuristaMedium";
            colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.382593 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.044 * safezoneH;
        };
        
        class EditLastname : lilc_RscEdit {
            idc = 1031;
            text = "";
            sizeEx = 0.035;
            font = "PuristaMedium";
            colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.459593 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.044 * safezoneH;
        };
        
        class ComboGender : lilc_RscCombo {
            idc = 1032;
            text = "";
            sizeEx = 0.040;
            font = "PuristaMedium";
            colorBackground[] = {0.0667, 0.1137, 0.1647, 1};
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.536593 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.044 * safezoneH;
            rowHeight = "0.044 * safezoneH";
        };
        
        class ButtonSignup : lilc_RscButtonMenu {
            idc = 1033;
            text = "Registrieren";
            colorBackground[] = {0.7098, 0.7098, 0.7098, 1};
            onButtonClick = "[] spawn lilc_login_fnc_processSignup;";
            x = 0.502552 * safezoneW + safezoneX;
            y = 0.643 * safezoneH + safezoneY;
            w = 0.121198 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class ButtonBack : lilc_RscButtonMenu {
            idc = 1034;
            text = "Zum Login";
            colorBackground[] = {0.7098, 0.7098, 0.7098, 1};
            onButtonClick = "[] spawn { closeDialog 1029; sleep 0.02; [] call lilc_login_fnc_openLoginMenu; };";
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.643 * safezoneH + safezoneY;
            w = 0.121719 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class TextError : lilc_RscStructuredText {
			idc = 1035;
			text = "";
			sizeEx = 0.02;
            font = "PuristaLight";
			x = 0.37625 * safezoneW + safezoneX;
            y = 0.601667 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.022 * safezoneH;
		};
    };
};
