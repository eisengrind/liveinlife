
class lilc_job_agent_select {
    name = "lilc_job_agent_select";
    idd = 2049;
    movingEnable = 1;
    enableSimulation = 1;

    class controlsBackground {
        class FrameBackground: RscText {
            idc = 1000;

            x = 0.427812 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.308 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class TitleTitle: RscText {
            idc = 1001;

            text = "Job auswaehlen"; //--- ToDo: Localize;
            x = 0.427812 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class ButtonClose: lilc_RscActiveText {
            idc = 1200;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            onButtonClick = "closeDialog 2049;";
            x = 0.5594 * safezoneW + safezoneX;
            y = 0.33698 * safezoneH + safezoneY;
            w = 0.0115625 * safezoneW;
            h = 0.0188889 * safezoneH;
            color[] = {1, 1, 1, 0.7};
            colorText[] = {1, 1, 1, 0.7};
            colorActive[] = {1, 1, 1, 1};
        };
    };

    class controls {
        class Jobs: RscCombo {
            idc = 2100;
            onLBSelChanged = "_this call lilc_job_agent_fnc_onLBSelChangedDeliverJob;";
            x = 0.432968 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonSelect: RscButton {
            idc = 1600;
            onButtonClick = "call lilc_job_agent_fnc_onButtonClickDeliver;";
            text = "Liefern"; //--- ToDo: Localize;
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.632 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleJob: RscText {
            idc = 1001;

            text = "Auftrag:"; //--- ToDo: Localize;
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class TitleItems: RscText {
            idc = 1001;

            text = "Gegenstaende:"; //--- ToDo: Localize;
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class ListItems: RscListbox {
            idc = 1500;
            x = 0.432968 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.176 * safezoneH;
        };
    };
};
