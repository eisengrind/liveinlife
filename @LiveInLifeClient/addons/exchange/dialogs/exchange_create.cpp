
class lilcm_exchange_create
{
    idd = 2303;
    name = "lilcm_exchange_create";
    movingEnable = 1;
    enableSimulation = 1;

    class Controls
    {
        class TitleCreateOffer: RscText
        {
            idc = 1000;
            moving = 1;
            text = "Angebot erstellen"; //--- ToDo: Localize;
            x = 0.386562 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.77])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.51])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.08])","(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])"};
        };
        class FrameBackground: RscText
        {
            idc = 1001;
            x = 0.386562 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.495 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
        class ButtonBuyOffer: RscButton
        {
            idc = 1600;
            text = "Kaufen"; //--- ToDo: Localize;
            x = 0.391719 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class ButtonSellOffer: RscButton
        {
            idc = 1601;
            text = "Verkaufen"; //--- ToDo: Localize;
            x = 0.499999 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class FrameBackgroundSelection: RscText
        {
            idc = 1002;
            x = 0.391719 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.216563 * safezoneW;
            h = 0.407 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
        class GroupBuy: RscControlsGroup
        {
            idc = 2300;
            x = 0.386562 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.407 * safezoneH;
            class Controls
            {
                class ButtonCreateOffer: RscButton
                {
                    idc = 1602;
                    text = "Angebot erstellen"; //--- ToDo: Localize;
                    x = 0.128906 * safezoneW;
                    y = 0.418 * safezoneH;
                    w = 0.0928125 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class EditAmountBuyOffer: RscEdit
                {
                    idc = 1400;
                    x = 0.103125 * safezoneW;
                    y = 0.011 * safezoneH;
                    w = 0.113437 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class TitleAmountBuyOffer: RscText
                {
                    idc = 1003;
                    text = "Anzahl:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.011 * safezoneH;
                    w = 0.0876563 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {0,0,0,1};
                };
                class TitlePriceBuyOffer: RscText
                {
                    idc = 1004;
                    text = "Stk./Preis:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.0876563 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {0,0,0,1};
                };
                class EditPriceBuyOffer: RscEdit
                {
                    idc = 1401;
                    x = 0.103125 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.113437 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class TitleItemBuyOffer: RscText
                {
                    idc = 1005;
                    text = "Item:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.077 * safezoneH;
                    w = 0.20625 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {0,0,0,1};
                };
                class ListItemBuyOffer: RscListbox
                {
                    idc = 1500;
                    x = 0.010313 * safezoneW;
                    y = 0.099 * safezoneH;
                    w = 0.20625 * safezoneW;
                    h = 0.297 * safezoneH;
                };
            };
        };
        class RscControlsGroup_2301: RscControlsGroup
        {
            idc = 2301;
            x = 0.386562 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.407 * safezoneH;
            class Controls
            {
                class TitleAmountSellOffer: RscText
                {
                    idc = 1006;
                    text = "Anzahl:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.011 * safezoneH;
                    w = 0.0876563 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {0,0,0,1};
                };
                class TitlePriceSellOffer: RscText
                {
                    idc = 1007;
                    text = "Stk./Preis:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.0876563 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {0,0,0,1};
                };
                class EditAmountSellOffer: RscEdit
                {
                    idc = 1402;
                    x = 0.103125 * safezoneW;
                    y = 0.011 * safezoneH;
                    w = 0.113437 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class EditPriceSellOffer: RscEdit
                {
                    idc = 1403;
                    x = 0.103125 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.113437 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class TitleInventorySellOffer: RscText
                {
                    idc = 1008;
                    text = "Inventar:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.077 * safezoneH;
                    w = 0.0876563 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {0,0,0,1};
                };
                class ComboInventorySellOffer: RscCombo
                {
                    idc = 2100;
                    x = 0.103125 * safezoneW;
                    y = 0.077 * safezoneH;
                    w = 0.113437 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class TitleItemSellOffer: RscText
                {
                    idc = 1009;
                    text = "Item:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.099 * safezoneH;
                    w = 0.20625 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {0,0,0,1};
                };
                class ListItemSellOffer: RscListbox
                {
                    idc = 1501;
                    x = 0.010313 * safezoneW;
                    y = 0.121 * safezoneH;
                    w = 0.20625 * safezoneW;
                    h = 0.275 * safezoneH;
                };
            };
        };
        };
};
