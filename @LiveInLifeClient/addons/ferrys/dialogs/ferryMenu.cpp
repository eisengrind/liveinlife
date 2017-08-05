
class lilcm_ferry
{
    idd = 1706;
    name = "lilcm_ferry";
    enableSimulation = 1;
    movingEnable = 0;

    class controlsBackground
    {
        class FrameBackground : lilc_RscText
        {
            idc = 1000;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.286 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
        class TitleTitle : lilc_RscText
        {
            idc = 1001;
            text = "FÃ¤hrplan"; //--- ToDo: Localize;
            x = 0.44328 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };
    };

    class controls
    {
        class ListNextFerry : lilc_RscListbox
        {
            idc = 1500;
            sizeEx = 0.032;
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.198 * safezoneH;
        };
        class ButtonWaitForFerry : lilc_RscButtonMenu
        {
            idc = 2400;
            text = "Wait for ferry"; //--- ToDo: Localize;
            onButtonClick = "";
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.588 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class ButtonBuyTicket : lilc_RscButtonMenu
        {
            idc = 2401;
            onButtonClick = "[lilc_ferrys_currentFerryHarbor] call lilc_ferrys_fnc_buyTicket;";
            text = "Buy ticket"; //--- ToDo: Localize;
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonClose : lilc_RscButtonCloseIcon
        {
            idc = 1200;
            onButtonClick = "closeDialog 1706;";
            x = 0.544375 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.0123438 * safezoneW;
            h = 0.022 * safezoneH;
			color[] = {1, 1, 1, 0.7};
            colorText[] = {1, 1, 1, 0.7};
            colorActive[] = {1, 1, 1, 1};
        };
    };
};
