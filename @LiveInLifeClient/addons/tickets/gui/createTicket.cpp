
class lilcm_createTicket {
    idd = 2048;
    name = "lilcm_createTicket";
    enableSimulation = 1;
    movingEnable = 1;

    class controlsBackground {
        class TitleTitle: RscText {
            idc = 1006;
            text = "$STR_lilc_tickets_Script_Ticket"; //--- ToDo: Localize;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class FrameBackground: RscText {
            idc = 1000;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.187 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class TitleTemplate: RscText {
            idc = 1003;
            text = "$STR_lilc_tickets_Config_Template"; //--- ToDo: Localize;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class TitleAmount: RscText {
            idc = 1004;
            text = "$STR_lilc_tickets_Config_Amount"; //--- ToDo: Localize;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.489 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };
    };
    class controls {
        class ComboTemplate: RscCombo {
            idc = 2100;
            onLBSelChanged = "_this call lilc_tickets_fnc_onLBSelChanged_templates;";
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class EditAmount: RscEdit {
            idc = 1400;
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.522 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextCurrency: RscText {
            idc = 1005;
            style = 1;
            text = ""; //--- ToDo: Localize;
            x = 0.443282 * safezoneW + safezoneX;
            y = 0.522 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };

        class ButtonIssue: RscButton {
            idc = 1600;
            onButtonClick = "[(findDisplay 2048) getVariable ['lilc_tickets_target', objNull], parseNumber ctrlText 1400] call lilc_tickets_fnc_sendTicket;";
            text = "$STR_lilc_tickets_Config_IssueTicket"; //--- ToDo: Localize;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonClose: RscActiveText {
            idc = 1200;
            style = 48;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = 0.550521 * safezoneW + safezoneX;
            y = 0.381482 * safezoneH + safezoneY;
            w = 0.0105209 * safezoneW;
            h = 0.017963 * safezoneH;
            onButtonClick = "closeDialog 2048;";
            color[] = {1, 1, 1, 0.7};
            colorText[] = {1, 1, 1, 0.7};
            colorActive[] = {1, 1, 1, 1};
        };
    };
};
