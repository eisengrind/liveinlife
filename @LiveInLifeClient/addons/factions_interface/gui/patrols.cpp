
class lilc_factions_interface_patrols {
    idd = 2051;
    name = "lilc_factions_interface_patrols";
    enableSimulation = 1;
    movingEnable = 1;

    class controlsBackground {
        class TitleTitle: RscTitle {
            idc = 1000;
            text = "Patroullien"; //--- ToDo: Localize;
            x = 0.360781 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.278437 * safezoneW;
            h = 0.022 * safezoneH;
            moving = 1;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class FrameBackground: RscText {
            idc = 1001;
            x = 0.360781 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.278437 * safezoneW;
            h = 0.352 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class ButtonClose: RscActiveText {
            idc = 1604;
            style = 48;
            color[] = {1,1,1,0.7};
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = 0.627239 * safezoneW + safezoneX;
            y = 0.315482 * safezoneH + safezoneY;
            w = 0.0111978 * safezoneW;
            h = 0.0173703 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
            colorText[] = {1,1,1,0.7};
            colorActive[] = {1,1,1,1};
        };
    };

    class controls {
        class TreeGroups: lilc_RscTree {
            idc = 1002;
            x = 0.365936 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.231 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
            onTreeSelChanged = "_this call lilc_factions_interface_fnc_onTreeSelChangedGroup;";
        };

        class TitleGroups: RscTitle {
            idc = 1003;
            text = "Gruppen:"; //--- ToDo: Localize;
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class ButtonGroupRefresh : RscActiveText {
            idc = 1605;
            style = 48;
            color[] = {1,1,1,0.7};
            text = "\x\lilc\addons\ui\icons\refresh_x64.paa";
            x = 0.467188 * safezoneW + safezoneX;
            y = 0.349074 * safezoneH + safezoneY;
            w = 0.0111978 * safezoneW;
            h = 0.0173703 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
            colorText[] = {1,1,1,0.7};
            colorActive[] = {1,1,1,1};
            onButtonClick = "call lilc_factions_interface_fnc_patrolRefresh;";
        };

        class ButtonJoin: RscButton {
            idc = 1600;
            text = "Gruppe beitreten"; //--- ToDo: Localize;
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.602704 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "call lilc_factions_interface_fnc_patrolJoin;";
        };

        class ButtonLeave: RscButton {
            idc = 1601;
            text = "Gruppe verlassen"; //--- ToDo: Localize;
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.654 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "call lilc_factions_interface_fnc_patrolLeave;";
        };

        class ButtonCreate: RscButton {
            idc = 1602;
            text = "Gruppe erstellen"; //--- ToDo: Localize;
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.62737 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "call lilc_factions_interface_fnc_patrolCreate;";
        };

        class TitleName: RscTitle {
            idc = 1005;
            text = "Name:"; //--- ToDo: Localize;
            x = 0.484531 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class TitleFrequency: RscTitle {
            idc = 1006;
            text = "Funkfrequenz:"; //--- ToDo: Localize;
            x = 0.484531 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class TitleDescription: RscTitle {
            idc = 1007;
            text = "Beschreibung:"; //--- ToDo: Localize;
            x = 0.484531 * safezoneW + safezoneX;
            y = 0.511 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class EditDescription: RscEdit {
            idc = 1400;
            x = 0.484531 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.11 * safezoneH;
        };

        class ButtonSave: RscButton {
            idc = 1603;
            text = "Save"; //--- ToDo: Localize;
            x = 0.556718 * safezoneW + safezoneX;
            y = 0.654 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "call lilc_factions_interface_fnc_patrolSave;";
        };

        class EditFrequency: RscEdit {
            idc = 1401;
            x = 0.484531 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class EditName: RscEdit {
            idc = 1402;
            x = 0.484531 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleIcon: RscTitle {
            idc = 1008;
            text = "Icon:"; //--- ToDo: Localize;
            x = 0.484531 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class ComboIcon: RscCombo {
            idc = 2100;
            x = 0.484531 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextDescription: RscText {
            idc = 1009;
            x = 0.484531 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.11 * safezoneH;
        };

        class TextFrequency: RscText {
            idc = 1010;
            x = 0.484531 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextName: RscText {
            idc = 1011;
            x = 0.484531 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
