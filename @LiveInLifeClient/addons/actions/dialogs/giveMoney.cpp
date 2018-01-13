
class lilcm_actions_giveMoney {
    idd = 1550;
    name = "lilcm_actions_giveMoney";
    enableSimulation = 1;
    movingEnable = 0;

    class controlsBackground {
        class FrameBackgroundBackground : lilc_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0, 0, 0, 0.8};
            x = 0.427812 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.132 * safezoneH;
        };

        class TitleMoneyEdit : lilc_RscTitle {
            idc = 1551;
            text = "Betrag an %1:";
            colorBackground[] = {0, 0, 0, 1};
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };

    class controls {
        class EditMoney : lilc_RscEdit {
            idc = 1552;
            text = "";
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class ButtonGive : lilc_RscButtonMenu {
            idc = -1;
            text = "Give Money";
            onButtonClick = "call lilc_actions_fnc_giveMoney;";
            x = 0.453594 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.033 * safezoneH;
        };
    };
};
