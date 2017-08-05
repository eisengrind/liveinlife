
class lilcm_vehicleInformations
{
    name = "lilcm_vehicleInformations";
    idd = 1304;
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class FrameBackground : lilc_RscText
        {
            idc = 1000;
            x = 0.427812 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.121 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class TitleTitle : lilc_RscTitle
        {
            idc = 1001;
            text = "Fahrzeug Informationen"; //--- ToDo: Localize;
            x = 0.427812 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };
    };

    class controls
    {
        class TitleCarHolder : lilc_RscTitle
        {
            idc = 1002;
            text = "Fahrzeughalter:"; //--- ToDo: Localize;
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };

        class TextCarHolder : lilc_RscText
        {
            idc = 1003;
            text = ""; //--- ToDo: Localize;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitlePlate : lilc_RscTitle
        {
            idc = 1004;
            text = "Kennzeichen:"; //--- ToDo: Localize;
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };

        class TextPlate : lilc_RscText
        {
            idc = 1005;
            text = ""; //--- ToDo: Localize;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextLoading : lilc_RscText
        {
            idc = 1006;
            text = "lade...";
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.099 * safezoneH;
        };

        class ButtonClose : lilc_RscButtonCloseIcon
        {
            idc = 1200;
            onButtonClick = "closeDialog 1304;";
            x = 0.560625 * safezoneW + safezoneX;
            y = 0.370371 * safezoneH + safezoneY;
            w = 0.00979163 * safezoneW;
            h = 0.0164444 * safezoneH;
        };
    };
};
