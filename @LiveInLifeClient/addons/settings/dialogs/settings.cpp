
class lilc_settings_menu {
    name = "lilc_settings_menu";
	idd = 1224;
	movingEnable = false;
	enableSimulation = true;
    
    class controlsBackground {
        class FrameBackground : lilc_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0, 0, 0, 0.75};
            x = 0.371094 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.257813 * safezoneW;
            h = 0.231 * safezoneH;
        };

        class Title : lilc_RscTitle {
            idc = -1;
            text = "Einstellungen";
            font = "PuristaMedium";
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleDistance : lilc_RscTitle {
            idc = -1;
            text = "Sichtweite";
            font = "PuristaMedium";
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.022 * safezoneH;
        };
	};
	
	class controls {
        class SliderDistance : lilc_RscXSliderH {
            idc = 1225;
            text = "";
            onSliderPosChanged = "[(_this select 1)] call lilc_settings_fnc_onSliderChange;";
            tooltip = "";
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class Check1 : lilc_RscCheckbox {
            idc = 1226;
            action = "call lilc_settings_fnc_onSwitchTags;";
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.0123438 * safezoneW;
            h = 0.022 * safezoneH;  
        };

        class TitleCheckText1 : lilc_RscTitle {
            idc = -1;
            text = "Spieler Tags";
            font = "PuristaMedium";
            x = 0.395844 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.228437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class Check2 : lilc_RscCheckbox {
            idc = 1227;
            onButtonClick = "if (profileNamespace getVariable ['lilc_joinIntroOff', false]) then { profileNamespace setVariable ['lilc_joinIntroOff', false]; } else { profileNamespace setVariable ['lilc_joinIntroOff', true]; }; call lilc_settings_fnc_updateMenu;";
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.489 * safezoneH + safezoneY;
            w = 0.0123438 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleCheckText2 : lilc_RscTitle {
            idc = -1;
            text = "Intro deaktivieren";
            font = "PuristaMedium";
            x = 0.395844 * safezoneW + safezoneX;
            y = 0.489 * safezoneH + safezoneY;
            w = 0.228437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonClose : lilc_RscButtonMenu {
            idc = -1;
            text = "Schließen";
            onButtonClick = "closeDialog 0;";
            x = 0.371094 * safezoneW + safezoneX;
            y = 0.558704 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
        };

        /*class ButtonKeys : lilc_RscButtonMenu {
            idc = -1;
            text = "Configure Keys";
            onButtonClick = "[] spawn { closeDialog 0; sleep 0.05; call lilc_settings_fnc_openKeyMenu; };";
            x = 0.455625 * safezoneW + safezoneX;
            y = 0.558593 * safezoneH + safezoneY;
            w = 0.12 * safezoneW;
            h = 0.022 * safezoneH;
        };*/
	};
};

class lilc_keySettings {
    name = "lilc_keySettings";
	idd = 1330;
	movingEnable = false;
	enableSimulation = true;

    class controlsBackground {
        class FrameBackground : lilc_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0.0863, 0.1451, 0.2118, 1};
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.299062 * safezoneW;
            h = 0.308 * safezoneH;
        };

        class FrameTitleBackground : lilc_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0.7843, 0.7843, 0.7843, 1};
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.299062 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class FrameFooterBackground : lilc_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0.7843, 0.7843, 0.7843, 1};
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.632 * safezoneH + safezoneY;
            w = 0.299062 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class FrameListBackground : lilc_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0.0549, 0.0823, 0.1176, 0.5};
            x = 0.355625 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.28875 * safezoneW;
            h = 0.231 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle {
            idc = -1;
            sizeEx = 0.038;
            text = "Live In Life Key Config";
            shadow = 0;
            font = "PuristaMedium";
            colorText[] = {0.0863, 0.1451, 0.2118, 1};
            x = 0.352604 * safezoneW + safezoneX;
            y = 0.294445 * safezoneH + safezoneY;
            w = 0.294896 * safezoneW;
            h = 0.0262963 * safezoneH;
        };

        class TitleHeaderActions : lilc_RscTitle {
            idc = -1;
            style = 0xC0;
            sizeEx = 0.028;
            text = "Actions";
            font = "PuristaMedium";
            colorBackground[] = {0.0588, 0.0862, 0.1137, 1};
            x = 0.355625 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleHeaderKeys : lilc_RscTitle {
            idc = -1;
            style = 0xC0;
            text = "Keys";
            sizeEx = 0.028;
            font = "PuristaMedium";
            colorBackground[] = {0.0588, 0.0862, 0.1137, 1};
            x = 0.5 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class TextDescription : lilc_RscText {
            idc = -1;
            sizeEx = 0.029;
            font = "PuristaLight";
            text = "Doubleclick on a row to change the key config.";
            x = 0.497917 * safezoneW + safezoneX;
            y = 0.592593 * safezoneH + safezoneY;
            w = 0.146614 * safezoneW;
            h = 0.0339259 * safezoneH;
        };
	};
	
	class controls {
        class ListKeys : lilc_RscListNBox {
            idc = 1331;
            text = "";
            idcLeft = -1;
			idcRight = -1;
            rowHeight = 0.05;
			sizeEx = 0.03;
			drawSideArrows = 0;
            font = "RobotoCondensed";
            onLBDblClick = "_this call lilc_settings_fnc_onLBKeyDblClick;";
            x = 0.355625 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.28875 * safezoneW;
            h = 0.231 * safezoneH;
        };

        class ButtonSave : lilc_RscButtonMenu {
            idc = 1332;
            text = "Save";
            font = "PuristaSemibold";
            onButtonClick = "[] spawn lilc_settings_fnc_saveKeyBindings;";
            colorBackground[] = {0.7098, 0.7098, 0.7098, 1};
            x = 0.356667 * safezoneW + safezoneX;
            y = 0.643926 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonClose : lilc_RscButtonMenu {
            idc = 1333;
            text = "Back";
            font = "PuristaSemibold";
            colorBackground[] = {0.7098, 0.7098, 0.7098, 1};
            onButtonClick = "[] spawn { closeDialog 0; sleep 0.05; call lilc_settings_fnc_openMenu; };";
            x = 0.444791 * safezoneW + safezoneX;
            y = 0.643519 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonDefault : lilc_RscButtonMenu {
            idc = 1334;
            text = "Default";
            font = "PuristaSemibold";
            colorBackground[] = {0.0667, 0.1137, 0.1647,1};
            onButtonClick = "[(lnbCurSelRow 1331)] call lilc_settings_fnc_keyDefault;";
            x = 0.355625 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonDelete : lilc_RscButtonMenu {
            idc = 1335;
            text = "Delete";
            font = "PuristaSemibold";
            colorBackground[] = {0.0667, 0.1137, 0.1647,1};
            onButtonClick = "[(lnbCurSelRow 1331)] call lilc_settings_fnc_keyDelete;";
            x = 0.427812 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.022 * safezoneH;
        };
	};
};
