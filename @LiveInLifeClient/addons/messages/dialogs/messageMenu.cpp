
class lilcm_messageMenu
{
    idd = 1307;
    name = "lilcm_messageMenu";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class FrameBackground : lilc_RscText
        {
            idc = 1000;
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.278437 * safezoneW;
            h = 0.319 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class TitleTitle : lilc_RscText
        {
            idc = 1001;
            text = "Nachrichten"; //--- ToDo: Localize;
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.278437 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };

        class TitleMessages : lilc_RscText
        {
            idc = 1002;
            text = "Nachrichten:"; //--- ToDo: Localize;
            x = 0.371094 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };

        class TitleText : lilc_RscText
        {
            idc = 1003;
            text = "Text:"; //--- ToDo: Localize;
            x = 0.520625 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };
    };

    class controls
    {
        class ButtonCreateMessage : lilc_RscButtonMenu
        {
            idc = 2400;
            onButtonClick = "call lilc_messages_fnc_openMenuCreate;";
            text = "Verfassen"; //--- ToDo: Localize;
            x = 0.577344 * safezoneW + safezoneX;
            y = 0.632 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ListMessages : lilc_RscListbox
        {
            idc = 1500;
            sizeEx = 0.0318;
            onLBSelChanged = "_this call lilc_messages_fnc_message_onLBSelChanged;";
            x = 0.371094 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.242 * safezoneH;
        };

        class TextMessage : lilc_RscStructuredText
        {
            idc = 1100;
            text = "Testtext"; //--- ToDo: Localize;
            x = 0.520625 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.242 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };

        class ButtonClose : lilc_RscButtonMenu
        {
            idc = 2401;
            onButtonClick = "closeDialog 1307;";
            text = "Schliessen"; //--- ToDo: Localize;
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.669519 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
