
class lilcm_shops_vehicles
{
    name = "lilcm_shops_vehicles";
    idd = 1700;
	movingEnable = 0;
    enableSimulation = 1;
    
    class controlsBackground
    {
        class FrameBackground : lilc_RscText
        {
            idc = 1000;
            x = 0.371094 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.257813 * safezoneW;
            h = 0.506 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class TitleTitle : lilc_RscText
        {
            idc = 1001;
            text = "";
            x = 0.371094 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.257813 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };
    };

    class controls
    {
        class ListVehicles : lilc_RscListbox
        {
            idc = 1500;
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.451 * safezoneH;
            onLBSelChanged = "_this call lilc_shops_fnc_vehicles_onLBSelChanged;";
        };

        class ButtonRent : lilc_RscButtonMenu
        {
            idc = 2400;
            text = "Mieten"; //TODO: localize
            x = 0.375782 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.122187 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "call lilc_shops_fnc_vehicles_rentBuyVehicle;";
        };

        class ButtonBuy : lilc_RscButtonMenu
        {
            idc = 2401;
            text = "Kaufen"; //TODO: localize
            x = 0.503073 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.120156 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "call lilc_shops_fnc_vehicles_buyVehicle;";
        };

        class GroupInformation : lilc_RscControlsGroup
        {
            idc = 2300;
            x = 0.628906 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.297 * safezoneH;
            class Controls
            {
                class FrameBackgroundInformation : lilc_RscText
                {
                    idc = 1002;
                    x = 0.00515597 * safezoneW;
                    y = 0.033 * safezoneH;
                    w = 0.113437 * safezoneW;
                    h = 0.253 * safezoneH;
                    colorBackground[] = {0,0,0,0.8};
                };

                class TitleInformation : lilc_RscText
                {
                    idc = 1003;
                    text = "Informationen"; //--- ToDo: Localize;
                    x = 0.00515597 * safezoneW;
                    y = 0.011 * safezoneH;
                    w = 0.113437 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {0,0,0,0.95};
                };

                class GroupInformationText : lilc_RscControlsGroup
                {
                    idc = 2301;
                    x = ((0.634532 * safezoneW + safezoneX) - (0.628906 * safezoneW + safezoneX));
                    y = ((0.259852 * safezoneH + safezoneY) - (0.225 * safezoneH + safezoneY));
                    w = 0.112499 * safezoneW;
                    h = 0.250446 * safezoneH;

                    class controls
                    {
                        class TextInformation : lilc_RscStructuredText
                        {
                            idc = 1100;
                            x = 0.00468673 * safezoneW;
                            y = 0.00914801 * safezoneH;
                            w = 0.103125 * safezoneW;
                            h = 0.231 * safezoneH;
                        };
                    };
                };
            };
        };
    };
};
