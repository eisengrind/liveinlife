
class lilc_job_agent_select {
    name = "lilc_job_agent_select";
    idd = 2049;
    movingEnable = 1;
    enableSimulation = 1;

    class controlsBackground {
        class FrameBackground: RscText {
            idc = 1000;
            x = 0.427812 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.099 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class TitleTitle: RscText {
            idc = 1001;
            text = "Job auswaehlen"; //--- ToDo: Localize;
            x = 0.427812 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,1};
        };
    };

    class controls {
        class Jobs: RscCombo {
            idc = 2100;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class ButtonSelect: RscButton {
            idc = 1600;
            text = "Auswaehlen"; //--- ToDo: Localize;
            onButtonClick = "call lilc_job_agent_fnc_onButtonClick_deliver";
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.522 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class ButtonClose: lilc_RscActiveText {
            idc = 1200;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            onButtonClick = "closeDialog 2049;";
            x = 0.559376 * safezoneW + safezoneX;
            y = 0.447222 * safezoneH + safezoneY;
            w = 0.0115625 * safezoneW;
            h = 0.0188889 * safezoneH;
            color[] = {1, 1, 1, 0.7};
            colorText[] = {1, 1, 1, 0.7};
            colorActive[] = {1, 1, 1, 1};
        };
    };
};
