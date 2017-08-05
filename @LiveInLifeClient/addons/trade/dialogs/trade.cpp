
class lilcm_trade {
    idd = 1640;
    name = "lilcm_trade";
    enableSimulation = 1;
    movingEnable = 0;

    class controlsBackground {
        class TitleMyInventory : lilc_RscText
        {
            idc = -1;
            text = "Mein Inventar";
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };

        class TitleOfferTradePartner : lilc_RscText
        {
            idc = -1;
            text = "Angebot Handelspartner";
            x = 0.510312 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };

        class TitleMyMoneyOffer : lilc_RscText
        {
            idc = -1;
            style = 1;
            text = "Geldangebot";
            sizeEx = 0.03;
            font = "PuristaMedium";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.0515625 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleMyCash : lilc_RscText
        {
            idc = -1;
            style = 1;
            text = "Bargeld";
            sizeEx = 0.03;
            font = "PuristaMedium";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.511 * safezoneH + safezoneY;
            w = 0.0515625 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleMyOffer : lilc_RscText
        {
            idc = -1;
            text = "Mein Angebot";
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.588 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.95};
        };
    };

    class controls {
        class ListMyInventory : lilc_RscListbox
        {
            idc = 1500;
            font = "PuristaMedium";
            onLBDblClick = "_this call lilc_trade_fnc_onLBDblClickMyInventory;";
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.242 * safezoneH;
            sizeEx = 0.032;
            colorBackground[] = {0,0,0,0.9};
        };

        class ListOfferTradePartner : lilc_RscListbox
        {
            idc = 1501;
            font = "PuristaMedium";
            x = 0.510312 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            sizeEx = 0.032;
            h = 0.286 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class TextAvailableMoney : lilc_RscStructuredText
        {
            idc = 1004;
            text = "";
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.511 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextOfferedMoney : lilc_RscStructuredText
        {
            idc = 1005;
            text = "";
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class EditMyMoney : lilc_RscEdit
        {
            idc = 1400;
            text = "";
            x = 0.381406 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonRemoveMoney : lilc_RscButtonMenu
        {
            idc = 2400;
            text = "-"; //--- ToDo: Localize;
            onButtonClick = "call lilc_trade_fnc_removeMoneyOffer;";
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonAddMoney : lilc_RscButtonMenu
        {
            idc = 2401;
            text = "+"; //--- ToDo: Localize;
            onButtonClick = "call lilc_trade_fnc_addMoneyOffer;";
            x = 0.474219 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ListMyOffers : lilc_RscListbox
        {
            idc = 1502;
            font = "PuristaMedium";
            onLBDblClick = "_this call lilc_trade_fnc_onLBDblClickMyOffers;";
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.61 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.132 * safezoneH;
            sizeEx = 0.032;
            colorBackground[] = {0,0,0,0.8};
        };

        class TextOfferedMoneyTradePartner : lilc_RscStructuredText
        {
            idc = 1007;
            text = "";
            x = 0.510312 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonAcceptTrade : lilc_RscButtonMenu
        {
            idc = 2403;
            text = "Bestaetigen";
            onButtonClick = "call lilc_trade_fnc_acceptTrade;";
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.764 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonCancelTrade : lilc_RscButtonMenu
        {
            idc = 2404;
            text = "Abbrechen";
            onButtonClick = "call lilc_trade_fnc_cancelTrade;";
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.764 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};

