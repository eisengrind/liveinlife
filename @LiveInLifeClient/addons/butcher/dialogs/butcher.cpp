
class lilcm_butcher
{
    idd = 1300;
    name = "lilcm_butcher";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground
    {
        class FrameBackground : lilc_RscText
        {
            idc = 1000;
            x = 0.396875 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.20625 * safezoneW;
            h = 0.242 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class TitleButcher : lilc_RscText
        {
            idc = 1001;
            text = "Butcher"; //--- ToDo: Localize;
            x = 0.396875 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.20625 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };
    };

    class controls
    {
		class ButtonClose : RscActiveText {
            idc = 1206;
			style = 48;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = 0.590937 * safezoneW + safezoneX;
            y = 0.370667 * safezoneH + safezoneY;
            w = 0.0105209 * safezoneW;
            h = 0.016111 * safezoneH;
			onButtonClick = "[] spawn lilc_shops_fnc_closeClothingMenu;";
			color[] = {1, 1, 1, 0.7};
            colorText[] = {1, 1, 1, 0.7};
            colorActive[] = {1, 1, 1, 1};
        };

        class ListItems : lilc_RscListbox
        {
            idc = 1500;
            sizeEx = 0.032;
            x = 0.505157 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.198 * safezoneH;
        };

        class ListVehicles : lilc_RscListbox
        {
            idc = 1501;
            sizeEx = 0.032;
            onLBSelChanged = "_this call lilc_butcher_fnc_onLBSelChanged_Vehicles;";
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.165 * safezoneH;
        };

        class ButtonButcher : lilc_RscButtonMenu
        {
            idc = 2400;
            onButtonClick = "[] spawn lilc_butcher_fnc_onButtonClick_Butcher;";
            text = "Ausschlachten"; //--- ToDo: Localize;
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleVehicles : lilc_RscText
        {
            idc = -1;
            text = "Fahrzeuge:"; //--- ToDo: Localize;
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class TitleItems : lilc_RscText
        {
            idc = -1;
            text = "Items:"; //--- ToDo: Localize;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
