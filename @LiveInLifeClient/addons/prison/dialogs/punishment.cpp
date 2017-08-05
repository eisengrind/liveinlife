
class lilcm_punishment
{
    name = "lilcm_punishment";
    idd = 1643;
	movingEnable = 0;
	enableSimulation = 1;

    class controlsBackground
    {
        class FrameBackground : lilc_RscText
        {
            idc = 1000;
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.242 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
        class TitleTitle : lilc_RscText
        {
            idc = 1001;
            text = "Strafverteilung"; //--- ToDo: Localize;
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };
    };

    class controls
    {
        class ComboPunishments : lilc_RscCombo
        {
            idc = 2100;
            onLBSelChanged = "call lilc_prison_fnc_onLBCurSelChangedPunishments;";
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitlePunishments : lilc_RscText
        {
            idc = 1002;
            text = "Strafe:"; //--- ToDo: Localize;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };

        class TitlePunishmentTime : lilc_RscText
        {
            idc = 1003;
            text = "Zeit:"; //--- ToDo: Localize;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };

        class ComboPunishmentTimes : lilc_RscCombo
        {
            idc = 2101;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class CheckSecurityIssue : lilc_RscCheckbox
        {
            idc = 2800;
            x = 0.447396 * safezoneW + safezoneX;
            y = 0.479852 * safezoneH + safezoneY;
            w = 0.011823 * safezoneW;
            h = 0.0201482 * safezoneH;
        };

        class CheckPsychatricKeeping : lilc_RscCheckbox
        {
            idc = 2801;
            x = 0.447396 * safezoneW + safezoneX;
            y = 0.523037 * safezoneH + safezoneY;
            w = 0.011823 * safezoneW;
            h = 0.0201482 * safezoneH;
        };

        class TextSecurityKeeping : lilc_RscText
        {
            idc = 1004;
            text = "Sicherheitsverwahrung"; //--- ToDo: Localize;
            x = 0.463906 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };

        class TextPsychatricKeeping : lilc_RscText
        {
            idc = 1005;
            text = "psych. Verwahrung"; //--- ToDo: Localize;
            x = 0.463906 * safezoneW + safezoneX;
            y = 0.522 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };

        class ButtonStartPunishment : lilc_RscButtonMenu
        {
            idc = 2400;
            text = "Strafe erteilen"; //--- ToDo: Localize;
            onButtonClick = "call lilc_prison_fnc_doPunish;";
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.566 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
