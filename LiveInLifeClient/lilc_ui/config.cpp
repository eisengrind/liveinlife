
class CfgPatches {
    #include "CfgPatches.cpp"
};

class CfgFunctions {
    #include "CfgFunctions.cpp"
};

class lilc_RscControlsGroup;
class lilc_RscPicture;
class lilc_RscProgress;
class lilc_RscText;
class lilc_RscStructuredText;
class lilc_RscTitle;

#include "dialogs\progress.cpp"

class CfgHints
{
    #include "CfgHints.cpp"
};

class CfgUIGrids
{
    #include "CfgUIGrids.cpp"
};

class lilc_groupHint : lilc_RscControlsGroup
{
    idc = -1;
    x = 0.411041 * safezoneW + safezoneX;
    y = 0.00962966 * safezoneH + safezoneY;
    w = 0.194584 * safezoneW;
    h = 0.0375185 * safezoneH;

    class VScrollbar
    {
        width = 0.0001;
    };

    class HScrollbar
    {
        height = 0.0001;
    };

    class controls
    {
        class PictureColor : lilc_RscPicture
        {
            idc = 1612;
            text = "#(argb,8,8,3)color(0.066,0.729,0.066,1)";
            x = -9.83477e-007 * safezoneW;
            y = -0.000926386 * safezoneH;
            w = 0.00515625 * safezoneW;
            h = 0.0392592 * safezoneH;
        };

        class TextMessage : lilc_RscStructuredText
        {
            idc = 1613;
            text = "";
            x = 0.00531299 * safezoneW;
            y = -0.000925943 * safezoneH;
            w = 0.19026 * safezoneW;
            h = 0.0384445 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.4};
            sizeEx = 0.034;
            shadow = 0;
        };
    };
};

class RscTitles {
    #include "dialogs\logo.cpp"
    #include "dialogs\hud.cpp"
    #include "dialogs\hint.cpp"
    #include "dialogs\stats.cpp"
    #include "dialogs\loading.cpp"
    #include "dialogs\aircraftInfo.cpp"
};

class Extended_PreInit_EventHandlers {
    class lilc_ui_preInit {
        clientInit = "call compile preProcessFileLineNumbers '\x\lilc\addons\ui\XEH_preInit.sqf';";
    };
};
