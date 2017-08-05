
class lilcm_reviveOptions {
    idd = 1600;
    name = "lilcm_reviveOptions";
    onLoad = "(_this select 0) displayAddEventHandler ['KeyDown', { true; }];";

    class controlsBackground {};
    class controls {
        class ButtonDie : RscButton {
            idc = 1601;
            text = "Ins Licht gehen";
            x = 0.335 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.055 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
            font = "PuristaSemibold";
            onButtonClick = "call lilc_medical_fnc_reviveOptionsSelectDeath;";
        };

        class ButtonLive : RscButton {
            idc = 1602;
            text = "Weiterleben";
            x = 0.530937 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.055 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
            font = "PuristaSemibold";
            onButtonClick = "call lilc_medical_fnc_reviveOptionsSelectLive;";
        };
    };
};
