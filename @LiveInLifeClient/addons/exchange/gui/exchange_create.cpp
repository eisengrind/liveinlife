
class lilcm_exchange_create
{
    idd = 2303;
    name = "lilcm_exchange_create";
    movingEnable = 1;
    enableSimulation = 1;

    class controlsBackground
    {
        class FrameButtonBuyBackground : RscText
        {
            idc = 998;
            text = "";
            x = 0.391719 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.6};
        };

        class FrameButtonSellBackground : RscText
        {
            idc = 999;
            text = "";
            x = 0.5 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.2};
        };

        class FrameBackground: RscText
        {
            idc = 1001;

            x = 0.386562 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.495 * safezoneH;
            colorBackground[] = {0,0,0,0.4};
        };

        class FrameWrapperBackground: RscText
        {
            idc = 1001;

            x = 0.391719 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.216563 * safezoneW;
            h = 0.396 * safezoneH;
            colorBackground[] = {0,0,0,0.4};
        };
        class TitleCreateOffer: RscText
        {
            idc = 1000;
            moving = 1;
            text = ""; //--- ToDo: Localize;
            x = 0.386562 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
        };
    };

    class Controls
    {
        class ButtonClose: RscActiveText {
            idc = -1;
            style = 48;
            text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
            x = 0.601578 * safezoneW + safezoneX;
            y = 0.23798 * safezoneH + safezoneY;
            w = 0.0110416 * safezoneW;
            h = 0.0188889 * safezoneH;
            onButtonClick = "closeDialog 2303;";
            color[] = {1, 1, 1, 0.7};
            colorText[] = {1, 1, 1, 0.7};
            colorActive[] = {1, 1, 1, 1};
        };
        class ButtonBuyOffer: RscButton
        {
            idc = 1600;
            text = "Kaufen"; //--- ToDo: Localize;
            x = 0.391719 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "[nil, 'buy'] call lilc_exchange_fnc_openMenuCreate;";
            colorBackground[] = {0, 0, 0, 0};
            colorBackgroundActive[] = {0, 0, 0, 0};
            colorBackgroundDisabled[] = {0, 0, 0, 0};
            colorFocused[] = {0, 0, 0, 0};
            period = 0;
        };
        class ButtonSellOffer: RscButton
        {
            idc = 1601;

            text = "Verkaufen"; //--- ToDo: Localize;
            x = 0.5 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "[nil, 'sell'] call lilc_exchange_fnc_openMenuCreate;";
            colorBackground[] = {0, 0, 0, 0};
            colorBackgroundActive[] = {0, 0, 0, 0};
            colorBackgroundDisabled[] = {0, 0, 0, 0};
            colorFocused[] = {0, 0, 0, 0};
            period = 0;
        };
        class GroupSellOffer: RscControlsGroup
        {
            idc = 2300;
            x = 0.386562 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.396 * safezoneH;
            class Controls
            {
                class TitleAmount: RscText
                {
                    idc = 1002;
                    text = "Anzahl:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.011 * safezoneH;
                    w = 0.0979687 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
                };
                class TitlePrice: RscText
                {
                    idc = 1004;
                    text = "Stk./Preis:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.0979687 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
                };
                class EditAmount: RscEdit
                {
                    idc = 1400;
                    x = 0.113436 * safezoneW;
                    y = 0.011 * safezoneH;
                    w = 0.103125 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class EditPrice: RscEdit
                {
                    idc = 1401;
                    x = 0.113437 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.103125 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class TitleContainers: RscText
                {
                    idc = 1005;
                    text = "Lagerauswahl:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.077 * safezoneH;
                    w = 0.0979687 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
                };
                class ComboContainers: RscCombo
                {
                    idc = 2100;
                    x = 0.113438 * safezoneW;
                    y = 0.077 * safezoneH;
                    w = 0.103125 * safezoneW;
                    h = 0.022 * safezoneH;
                    onLBSelChanged = "_this call lilc_exchange_fnc_create_handleContainerOnLBSelChanged;";
                };
                class TitleItems: RscText
                {
                    idc = 1006;
                    text = "Itemauswahl:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.11 * safezoneH;
                    w = 0.20625 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
                };
                class ListItems: RscListbox
                {
                    idc = 1500;
                    x = 0.010313 * safezoneW;
                    y = 0.132 * safezoneH;
                    w = 0.20625 * safezoneW;
                    h = 0.253 * safezoneH;
                };
            };
        };
        class ButtonCreateOffer: RscButton
        {
            idc = 1601;

            text = "Verkaufen"; //--- ToDo: Localize;
            x = 0.391719 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "call lilc_exchange_fnc_create_createOffer;";
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.3};
        };
        class GroupBuyOffer: RscControlsGroup
        {
            idc = 2301;
            x = 0.386562 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.396 * safezoneH;
            class Controls
            {
                class TitleAmount: RscText
                {
                    idc = 1007;
                    text = "Anzahl:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.011 * safezoneH;
                    w = 0.0979687 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
                };
                class TitlePrice: RscText
                {
                    idc = 1008;
                    text = "Stk./Preis:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.0979687 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
                };
                class TitleItems: RscText
                {
                    idc = 1009;
                    text = "Itemauswahl:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.077 * safezoneH;
                    w = 0.20625 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])", 0.5};
                };
                class ListItems: RscListbox
                {
                    idc = 1501;
                    x = 0.010313 * safezoneW;
                    y = 0.099 * safezoneH;
                    w = 0.20625 * safezoneW;
                    h = 0.286 * safezoneH;
                };
                class EditAmount: RscEdit
                {
                    idc = 1402;
                    x = 0.113438 * safezoneW;
                    y = 0.011 * safezoneH;
                    w = 0.103125 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class EditPrice: RscEdit
                {
                    idc = 1403;
                    x = 0.113438 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.103125 * safezoneW;
                    h = 0.022 * safezoneH;
                };
            };
        };
    };
};
