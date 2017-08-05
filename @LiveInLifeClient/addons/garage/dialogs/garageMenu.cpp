
class RscActiveText;
class lilc_RscText;
class lilc_RscStructuredText;
class lilc_RscListbox;
class lilc_RscButtonMenu;
class lilc_RscCombo;
class lilc_RscFrame;

class lilcm_garage
{
    name = "lilcm_garage";
    idd = 1265;
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class FrameBackground : lilc_RscText
        {
            idc = 1000;
            x = 0.102969 * safezoneW + safezoneX;
            y = 0.214 * safezoneH + safezoneY;
            w = 0.190781 * safezoneW;
            h = 0.607778 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.8};
        };

        class TitleName : lilc_RscText
        {
            idc = 1001;
            text = "Garagenname"; //--- ToDo: Localize;
            x = 0.102969 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.190781 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.95};
        };

        class ButtonClose : RscActiveText
        {
            idc = 1206;
            style = 48;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = 0.280364 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.0133855 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "[] spawn lilc_garage_fnc_closeMenu;";
            color[] = {1, 1, 1, 0.7};
            colorText[] = {1, 1, 1, 0.7};
            colorActive[] = {1, 1, 1, 1};
        };

        class FrameGive : lilc_RscFrame
        {
            idc = 1203;
            text = "Fahrzeugübergabe";
            x = 0.108125 * safezoneW + safezoneX;
            y = 0.753 * safezoneH + safezoneY;
            w = 0.0974479 * safezoneW;
            h = 0.0604445 * safezoneH;
        };
    };

    class controls
    {
        class ListVehicles : lilc_RscListbox
        {
            idc = 1500;
            onLBSelChanged = "[(_this select 1)] call lilc_garage_fnc_onVehicleChange;";
            x = 0.108125 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.385 * safezoneH;
        };

        class TextVehicle : lilc_RscStructuredText
        {
            idc = 1100;
            text = "";
            x = 0.108125 * safezoneW + safezoneX;
            y = 0.613704 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.132 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.1};
        };

        class ButtonReveal : lilc_RscButtonMenu
        {
            idc = 2400;
            text = "Ausparken"; //--- ToDo: Localize;
            x = 0.216406 * safezoneW + safezoneX;["0.21125 * safezoneW + safezoneX","0.758445 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"]
            y = 0.753 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "call lilc_garage_fnc_reveal;";
            colorBackground[] = {0, 0, 0, 0.8};
        };

        class ComboPlayers : lilc_RscCombo
        {
            idc = 2401;
            x = 0.111198 * safezoneW + safezoneX;
            y = 0.765852 * safezoneH + safezoneY;
            w = 0.0912501 * safezoneW;
            h = 0.0184074 * safezoneH;
        };

        class ButtonGive : lilc_RscButtonMenu
        {
            idc = 2402;
            text = "Übergeben";
            onButtonClick = "call lilc_garage_fnc_giveToPlayer;";
            x = 0.111718 * safezoneW + safezoneX;
            y = 0.787852 * safezoneH + safezoneY;
            w = 0.0917708 * safezoneW;
            h = 0.020148 * safezoneH;
        };
    };
};
