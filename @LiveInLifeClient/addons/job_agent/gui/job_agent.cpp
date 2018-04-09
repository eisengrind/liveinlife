
class lilc_job_agent {
    name = "lilc_job_agent";
    idd = 2048;
    movingEnable = 1;
    enableSimulation = 1;

    class controlsBackground {
        class FrameBackground: RscText {
            idc = 1000;
            x = 0.340156 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.319688 * safezoneW;
            h = 0.374 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.8};
        };

        class TitleJobAgent: RscText {
            idc = 1001;
            text = ""; //--- ToDo: Localize;
            x = 0.340156 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.319688 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0, 0, 0, 1};
        };
    };

    class controls {
        class TitleJobs: RscText {
            idc = 1002;
            text = "Jobs:"; //--- ToDo: Localize;
            x = 0.345312 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0, 0, 0, 1};
        };

        class ListJobs: RscListbox {
            idc = 1500;
            x = 0.345312 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.275 * safezoneH;
            onLBSelChanged = "_this call lilc_job_agent_fnc_onLBSelChangedJobs;";
        };

        class ButtonTake: RscButton {
            idc = 1600;
            text = "Annehmen"; //--- ToDo: Localize;
            x = 0.345312 * safezoneW + safezoneX;
            y = 0.665 * safezoneH + safezoneY;
            w = 0.309375 * safezoneW;
            h = 0.044 * safezoneH;
            onButtonClick = "call lilc_job_agent_fnc_onButtonClickAccept;";
        };

        class GroupJobDescription: RscControlsGroup {
            idc = 2300;
            x = 0.443282 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.216563 * safezoneW;
            h = 0.319 * safezoneH;
            class Controls {
                class TextJobDescription: RscStructuredText {
                    idc = 1100;
                    x = 0.00515573 * safezoneW;
                    y = 0.011 * safezoneH;
                    w = 0.20625 * safezoneW;
                    h = 0.297 * safezoneH;
                };
            };
        };

        class ButtonClose : lilc_RscActiveText {
            idc = 1200;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            onButtonClick = "closeDialog 2048;";
            x = 0.647397 * safezoneW + safezoneX;
            y = 0.325926 * safezoneH + safezoneY;
            w = 0.0115625 * safezoneW;
            h = 0.0188889 * safezoneH;
            color[] = {1, 1, 1, 0.7};
            colorText[] = {1, 1, 1, 0.7};
            colorActive[] = {1, 1, 1, 1};
        };
    };
};
