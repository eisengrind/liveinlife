
class lilcm_messageCreate
{
    idd = 1306;
    name = "lilcm_messageCreate";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class FrameBackground : lilc_RscText
        {
            idc = 1000;
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.268125 * safezoneW;
            h = 0.231 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class TitleTitle : lilc_RscText
        {
            idc = 1001;
            text = "Nachricht verfassen"; //--- ToDo: Localize;
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.268125 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };

        class TitleReceivers : lilc_RscText
        {
            idc = 1002;
            text = "EmpfÃ¤nger:"; //--- ToDo: Localize;
            x = 0.371094 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.257813 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.6};
        };

        class TitleMessage : lilc_RscText
        {
            idc = 1003;
            text = "Nachricht:"; //--- ToDo: Localize;
            x = 0.371094 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.257813 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.6};
        };
    };

    class controls
    {
        class ComboReceivers : lilc_RscCombo
        {
            idc = 2100;
            x = 0.371094 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.257813 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class EditMessage : lilc_RscEdit
        {
            idc = 1400;
			style = 16;
			htmlControl = true;
			autocomplete = "";
			lineSpacing = 1;
            canModify = true;
            maxChars = 512;
            x = 0.371094 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.257813 * safezoneW;
            h = 0.099 * safezoneH;
        };

        class ButtonSendMessage : lilc_RscButtonMenu
        {
            idc = 2400;
            text = "Senden"; //--- ToDo: Localize;
            onButtonClick = "call lilc_messages_fnc_sendMessage;";
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.588 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonClose : lilc_RscButtonMenu
        {
            idc = 2401;
            onButtonClick = "closeDialog 1306;";
            text = "SchlieÃŸen"; //--- ToDo: Localize;
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.623778 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
