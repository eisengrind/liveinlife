
class lilcm_licenses
{
    idd = 1301;
    name = "lilcm_licenses";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class FrameBackground : lilc_RscText
        {
            idc = 1000;
            x = 0.355625 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.28875 * safezoneW;
            h = 0.352 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class TitleTitle : lilc_RscText
        {
            idc = -1;
            text = "Lizenzvergabe"; //--- ToDo: Localize;
            x = 0.355625 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.28875 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.9};
        };
    };

    class controls
    {
        class ListLicenses : lilc_RscListbox
        {
            idc = 1500;
            x = 0.360781 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.281481 * safezoneH;
        };

        class ListAvailableLicenses : lilc_RscListbox
        {
            idc = 1501;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.281481 * safezoneH;
        };

        class ButtonAddLicense : lilc_RscButtonMenu
        {
            idc = 2400;
            onButtonClick = "[(lbData [1500, (lbCurSel 1500)])] call lilc_licenses_fnc_removeLicense;";
            text = "HinzufÃ¼gen"; //--- ToDo: Localize;
            x = 0.360781 * safezoneW + safezoneX;
            y = 0.643 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonRemoveLicense : lilc_RscButtonMenu
        {
            idc = 2401;
            onButtonClick = "[(lbData [1501, (lbCurSel 1501)])] call lilc_licenses_fnc_removeLicense;";
            text = "Entfernen"; //--- ToDo: Localize;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.643 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleLicenses : lilc_RscText
        {
            idc = 1001;
            text = "Erteilbare Lizenzen:"; //--- ToDo: Localize;
            x = 0.360781 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleAvailableLicenses : lilc_RscText
        {
            idc = 1002;
            text = "Vorhandene Lizenzen:"; //--- ToDo: Localize;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
		class ButtonClose : RscActiveText {
            idc = 1200;
			style = 48;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = 0.632344 * safezoneW + safezoneX;
            y = 0.305704 * safezoneH + safezoneY;
            w = 0.01 * safezoneW;
            h = 0.0151852 * safezoneH;
			onButtonClick = "closeDialog 1301;";
			color[] = {1, 1, 1, 0.7};
            colorText[] = {1, 1, 1, 0.7};
            colorActive[] = {1, 1, 1, 1};
        };
    };
};
