
class lilc_RscControlsGroup;
class RscText;
class lilc_RscTree;

class lilc_marker_filter_GroupMarkerCategories : lilc_RscControlsGroup
{
    idc = -1;
    x = 0.025625 * safezoneW + safezoneX;
    y = 0.291 * safezoneH + safezoneY;
    w = 0.12375 * safezoneW;
    h = 0.352 * safezoneH;

    class Controls
    {
        class TitleTitle : RscText
        {
            idc = 1000;
            style = 2;
            text = "Legende"; //--- ToDo: Localize;
            x = 0.0051562 * safezoneW;
            y = 0.011 * safezoneH;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };

        class TreeList : lilc_RscTree
        {
            idc = 1500;
            x = 0.0051562 * safezoneW;
            y = 0.033 * safezoneH;
            w = 0.113437 * safezoneW;
            h = 0.308 * safezoneH;
        };
    };
};
