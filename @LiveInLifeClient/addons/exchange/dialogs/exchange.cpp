
class lilc_RscButtonMenu;
class lilc_RscEdit;
class lilc_RscListbox;
class lilc_RscButton;
class lilc_RscCombo;
class lilc_RscListNBox;
class lilc_RscText;
class lilc_RscTitle;
class lilc_RscControlsGroup;
class lilc_RscPicture;

class lilc_entry_exchange_MyOffersGroupEntry : lilc_RscControlsGroup
{
    idc = 2302;
    x = 0.00515599 * safezoneW;
    y = 8.19564e-009 * safezoneH;
    w = 0.2475 * safezoneW;
    h = 0.044 * safezoneH;
    
    class Controls
    {
        class TextClassname : lilc_RscText
        {
            idc = 1010;
            text = "Map"; //--- ToDo: Localize;
            x = 0.00515597 * safezoneW;
            y = 0.011 * safezoneH;
            w = 0.0567187 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextCategory : lilc_RscText
        {
            idc = 1011;
            text = "Kategorie"; //--- ToDo: Localize;
            x = 0.061875 * safezoneW;
            y = 0.011 * safezoneH;
            w = 0.0464062 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextAmount : lilc_RscText
        {
            idc = 1012;
            text = "23"; //--- ToDo: Localize;
            x = 0.108281 * safezoneW;
            y = 0.011 * safezoneH;
            w = 0.0309375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextPrice : lilc_RscText
        {
            idc = 1013;
            text = "23 $"; //--- ToDo: Localize;
            x = 0.139219 * safezoneW;
            y = 0.011 * safezoneH;
            w = 0.04125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextDate : lilc_RscText
        {
            idc = 1014;
            text = "10.20.2017"; //--- ToDo: Localize;
            x = 0.180469 * safezoneW;
            y = 0.011 * safezoneH;
            w = 0.0309375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonDelete : lilc_RscButtonMenu
        {
            idc = 1200;
            text = "Delete"; //#(argb,8,8,3)color(1,1,1,1)
            x = 0.225312 * safezoneW;
            y = 0.00914801 * safezoneH;
            w = 0.0170312 * safezoneW;
            h = 0.0266296 * safezoneH;
        };
    };
};

class lilcm_exchange {
    idd = 1630;
    name = "lilcm_exchange";
    enableSimulation = 1;
    movingEnabled = 0;

    class controlsbackground {
        class FrameBackground : lilc_RscText
        {
            idc = 1000;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.402187 * safezoneW;
            h = 0.528 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

        class TitleTitle : lilc_RscText
        {
            idc = 1001;
            text = "Börse.bz"; //--- ToDo: Localize;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.088 * safezoneH;
        };

        class ButtonClose : lilc_RscPicture
        {
            idc = 1200;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 0.687761 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.0133334 * safezoneW;
            h = 0.0228148 * safezoneH;
        };
    };

    class controls {
        /******************************************
        ****** Menu *******************************
        ****** 1600, 1601, 1602, 1603, 1604, 1605 *
        ******************************************/
        class ButtonMenu1 : lilc_RscButtonMenu
        {
            idc = 1600;
            text = "AngebotsÃ¼bersicht"; //--- ToDo: Localize;
            onButtonClick = "['dashboard'] call lilc_exchange_fnc_selectMenu;";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class ButtonMenu2 : lilc_RscButtonMenu
        {
            idc = 1601;
            text = "Angebot erstellen"; //--- ToDo: Localize;
            onButtonClick = "['addOffer'] call lilc_exchange_fnc_selectMenu;";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class ButtonMenu3 : lilc_RscButtonMenu
        {
            idc = 1602;
            text = "Meine Angebote"; //--- ToDo: Localize;
            onButtonClick = "['myOffers'] call lilc_exchange_fnc_selectMenu;";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class ButtonMenu4 : lilc_RscButtonMenu
        {
            idc = 1603;
            text = "Börsenkasse"; //--- ToDo: Localize;
            onButtonClick = "['account'] call lilc_exchange_fnc_selectMenu;";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class ButtonMenu5 : lilc_RscButtonMenu
        {
            idc = 1604;
            text = "Warenlager"; //--- ToDo: Localize;
            onButtonClick = "['wares'] call lilc_exchange_fnc_selectMenu;";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.102604 * safezoneW;
            h = 0.033 * safezoneH;
        };
        /*class ButtonMenu6 : lilc_RscButtonMenu
        {
            idc = 1605;
            text = "Warenlager"; //--- ToDo: Localize;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.033 * safezoneH;
        };*/
        /***************************************/

        class GroupDashboard : lilc_RscControlsGroup
        {
            idc = 25;
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.304219 * safezoneW;
            h = 0.55 * safezoneH;
            class Controls
            {
                class TitleCategory : lilc_RscText
                {
                    idc = 1013;
                    text = "Kategorie:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.022 * safezoneH;
                    w = 0.0876563 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class TitleItem : lilc_RscText
                {
                    idc = 1014;
                    text = "Item:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.055 * safezoneH;
                    w = 0.0876563 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class ComboCategory : lilc_RscCombo
                {
                    idc = 2100;
                    onLBSelChanged = "_this call lilc_exchange_fnc_onLBSelChanged_dashboard_Category;";
                    x = 0.097969 * safezoneW;
                    y = 0.022 * safezoneH;
                    w = 0.195937 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class ComboType : lilc_RscCombo
                {
                    idc = 2101;
                    onLBSelChanged = "_this call lilc_exchange_fnc_onLBSelChanged_dashboard_Item;";
                    x = 0.097969 * safezoneW;
                    y = 0.055 * safezoneH;
                    w = 0.195937 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class TitleBuys : lilc_RscText
                {
                    idc = 1015;
                    text = "Kaufangebote:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.099 * safezoneH;
                    w = 0.283594 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {0,0,0,1};
                };
                class TitleSells : lilc_RscText
                {
                    idc = 1016;
                    text = "Verkaufsangebote:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.319 * safezoneH;
                    w = 0.283594 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {0,0,0,1};
                };
                class ListBuys : lilc_RscListNbox
                {
                    idc = 1500;
                    x = 0.010313 * safezoneW;
                    y = 0.143 * safezoneH;
                    w = 0.283594 * safezoneW;
                    h = 0.132 * safezoneH;
                    rowHeight = 0;
                    idcLeft = -1;
                    idcRight = -1;
                    drawSideArrows = 0;
                };
                class ListSells : lilc_RscListNbox
                {
                    idc = 1501;
                    x = 0.010313 * safezoneW;
                    y = 0.363 * safezoneH;
                    w = 0.283594 * safezoneW;
                    h = 0.132 * safezoneH;
                    rowHeight = 0;
                    idcLeft = -1;
                    idcRight = -1;
                    drawSideArrows = 0;
                };
                class EditBuys : lilc_RscEdit
                {
                    idc = 1400;
                    text = "";
                    x = 0.159844 * safezoneW;
                    y = 0.286 * safezoneH;
                    w = 0.0567187 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class EditSells : lilc_RscEdit
                {
                    idc = 1401;
                    text = "";
                    x = 0.159844 * safezoneW;
                    y = 0.506 * safezoneH;
                    w = 0.0567187 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class TitleBuysAmountEdit : lilc_RscText
                {
                    idc = 1017;
                    text = "Anzahl:"; //--- ToDo: Localize;
                    x = 0.118593 * safezoneW;
                    y = 0.286 * safezoneH;
                    w = 0.04125 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class TitleSellsAmountEdit : lilc_RscText
                {
                    idc = 1018;
                    text = "Anzahl:"; //--- ToDo: Localize;
                    x = 0.118594 * safezoneW;
                    y = 0.506 * safezoneH;
                    w = 0.04125 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class ButtonBuys : lilc_RscButtonMenu
                {
                    idc = 2400;
                    text = "Kaufen"; //--- ToDo: Localize;
                    onButtonClick = "call lilc_exchange_fnc_dashboard_onButtonClickBuy;";
                    x = 0.221719 * safezoneW;
                    y = 0.286 * safezoneH;
                    w = 0.0721875 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class ButtonSells : lilc_RscButtonMenu
                {
                    idc = 2401;
                    text = "Verkaufen"; //--- ToDo: Localize;
                    onButtonClick = "call lilc_exchange_fnc_dashboard_onButtonClickSell;";
                    x = 0.221719 * safezoneW;
                    y = 0.506 * safezoneH;
                    w = 0.0721875 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class TitleBuysName : lilc_RscText
                {
                    idc = 1019;
                    text = "Name:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.121 * safezoneH;
                    w = 0.12375 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class TitleBuysAmount : lilc_RscText
                {
                    idc = 1020;
                    text = "Anzahl:"; //--- ToDo: Localize;
                    x = 0.139219 * safezoneW;
                    y = 0.121 * safezoneH;
                    w = 0.0515625 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class TitleBuysPrice : lilc_RscText
                {
                    idc = 1021;
                    text = "Stk/Preis:"; //--- ToDo: Localize;
                    x = 0.195938 * safezoneW;
                    y = 0.121 * safezoneH;
                    w = 0.0979687 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class TitleSellsName : lilc_RscText
                {
                    idc = 1022;
                    text = "Name:"; //--- ToDo: Localize;
                    x = 0.010313 * safezoneW;
                    y = 0.341 * safezoneH;
                    w = 0.12375 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class TitleSellsAmount : lilc_RscText
                {
                    idc = 1023;
                    text = "Anzahl:"; //--- ToDo: Localize;
                    x = 0.139219 * safezoneW;
                    y = 0.341 * safezoneH;
                    w = 0.0515625 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                class TitleSellsPrice : lilc_RscText
                {
                    idc = 1024;
                    text = "Stk/Preis:"; //--- ToDo: Localize;
                    x = 0.194844 * safezoneW;
                    y = 0.341667 * safezoneH;
                    w = 0.0979687 * safezoneW;
                    h = 0.022 * safezoneH;
                };
            };
        };

        class GroupAddOffer : lilc_RscControlsGroup
        {
            idc = 26;
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.304219 * safezoneW;
            h = 0.55 * safezoneH;

            class controls
            {
                class addOffer_TitleType : lilc_RscText
                {
                    idc = 1011;
                    text = "Ich möchte... "; //--- ToDo: Localize;
                    x = 0.015469 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.0825 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {0,0,0,0};
                };

                class addOffer_ComboType : lilc_RscCombo
                {
                    idc = 2100;
                    x = 0.097969 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.113437 * safezoneW;
                    h = 0.022 * safezoneH;
                    onLBSelChanged = "_this call lilc_exchange_fnc_onLBSelChanged_addOffer_Type;";
                };

                class addOffer_TitleAmount : lilc_RscText
                {
                    idc = 1012;
                    text = "Anzahl:"; //--- ToDo: Localize;
                    x = 0.015469 * safezoneW;
                    y = 0.121 * safezoneH;
                    w = 0.0825 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {0,0,0,0};
                };
                
                class addOffer_EditAmount : lilc_RscEdit
                {
                    idc = 1400;
                    text = "";
                    x = 0.097969 * safezoneW;
                    y = 0.121 * safezoneH;
                    w = 0.113437 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class addOffer_TitlePrice : lilc_RscText
                {
                    idc = 1013;
                    text = "Preis pro StÃ¼ck:"; //--- ToDo: Localize;
                    x = 0.015469 * safezoneW;
                    y = 0.154 * safezoneH;
                    w = 0.0825 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {0,0,0,0};
                };

                class addOffer_EditPrice : lilc_RscEdit
                {
                    idc = 1401;
                    text = "";
                    x = 0.097969 * safezoneW;
                    y = 0.154 * safezoneH;
                    w = 0.113437 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class addOffer_TitleInventory : lilc_RscText
                {
                    idc = 1014;
                    text = "Inventar:"; //--- ToDo: Localize;
                    x = 0.015469 * safezoneW;
                    y = 0.187 * safezoneH;
                    w = 0.0825 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {0,0,0,0};
                };

                class addOffer_TitleCategory : lilc_RscText
                {
                    idc = 1015;
                    text = "Kategorie:"; //--- ToDo: Localize;
                    x = 0.015469 * safezoneW;
                    y = 0.088 * safezoneH;
                    w = 0.0825 * safezoneW;
                    h = 0.022 * safezoneH;
                    colorBackground[] = {0,0,0,0};
                };

                class addOffer_ComboCategory : lilc_RscCombo
                {
                    idc = 2101;
                    x = 0.097969 * safezoneW;
                    y = 0.088 * safezoneH;
                    w = 0.113437 * safezoneW;
                    h = 0.022 * safezoneH;
                    onLBSelChanged = "_this call lilc_exchange_fnc_onLBSelChanged_addOffer_Category;";
                };

                class addOffer_ListInventory : lilc_RscListbox
                {
                    idc = 1500;
                    x = 0.097969 * safezoneW;
                    y = 0.198 * safezoneH;
                    w = 0.113437 * safezoneW;
                    h = 0.242 * safezoneH;
                };

                class addOffer_ButtonCreate : lilc_RscButtonMenu
                {
                    idc = 2400;
                    text = "Angebot erstellen"; //--- ToDo: Localize;
                    onButtonClick = "call lilc_exchange_fnc_addOffer_onButtonClick;";
                    x = 0.097969 * safezoneW;
                    y = 0.462 * safezoneH;
                    w = 0.113437 * safezoneW;
                    h = 0.033 * safezoneH;
                };
            };
        };

        class GroupAccount : lilc_RscControlsGroup
        {
            idc = 27;
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.304219 * safezoneW;
            h = 0.55 * safezoneH;

            class controls
            {
                class account_TitleAccountStatus : lilc_RscText
                {
                    idc = 1000;
                    text = "Börsenkontostand:"; //--- ToDo: Localize;
                    x = 0.0309377 * safezoneW;
                    y = 0.077 * safezoneH;
                    w = 0.0979687 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class account_TextAccountStatus : lilc_RscText
                {
                    idc = 1001;
                    text = "$0"; //--- ToDo: Localize;
                    x = 0.128906 * safezoneW;
                    y = 0.066 * safezoneH;
                    w = 0.154687 * safezoneW;
                    h = 0.044 * safezoneH;
                };

                class account_TitleLastTransactions : lilc_RscText
                {
                    idc = 1002;
                    text = "Letzte 20 Transaktionen:"; //--- ToDo: Localize;
                    x = 0.0309377 * safezoneW;
                    y = 0.154 * safezoneH;
                    w = 0.0979687 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class account_ButtonDrawMoney : lilc_RscButtonMenu
                {
                    idc = 2400;
                    text = "Geld abheben"; //--- ToDo: Localize;
                    onButtonClick = "call lilc_exchange_fnc_account_onButtonClickDraw;";
                    x = 0.190781 * safezoneW;
                    y = 0.121 * safezoneH;
                    w = 0.0928125 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class account_ListLastTransactions : lilc_RscListbox
                {
                    idc = 1500;
                    x = 0.036094 * safezoneW;
                    y = 0.187 * safezoneH;
                    w = 0.2475 * safezoneW;
                    h = 0.308 * safezoneH;
                };

                class account_ButtonDeleteTransactions : lilc_RscButtonMenu
                {
                    idc = 2401;
                    text = "Verlauf löschen"; //--- ToDo: Localize;
                    onButtonClick = "call lilc_exchange_fnc_account_onButtonClickDeleteHistory;";
                    x = 0.185625 * safezoneW;
                    y = 0.506 * safezoneH;
                    w = 0.0979687 * safezoneW;
                    h = 0.022 * safezoneH;
                };
            };
        };

        class GroupWares : lilc_RscControlsGroup
        {
            idc = 28;
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.304219 * safezoneW;
            h = 0.55 * safezoneH;

            class controls
            {
                class wares_TitleThings : lilc_RscText
                {
                    idc = 1010;
                    text = "Warenlager:"; //--- ToDo: Localize;
                    x = 0.025781 * safezoneW;
                    y = 0.055 * safezoneH;
                    w = 0.0928125 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class wares_ListThings : lilc_RscListbox
                {
                    idc = 1500;
                    x = 0.077344 * safezoneW;
                    y = 0.088 * safezoneH;
                    w = 0.154687 * safezoneW;
                    h = 0.396 * safezoneH;
                };

                class wares_DrawThings : lilc_RscButtonMenu
                {
                    idc = 2400;
                    text = "Ware ausgeben"; //--- ToDo: Localize;
                    onButtonClick = "call lilc_exchange_fnc_storage_onButtonClick;";
                    x = 0.108281 * safezoneW;
                    y = 0.506 * safezoneH;
                    w = 0.0928125 * safezoneW;
                    h = 0.022 * safezoneH;
                };
            };
        };

        class GroupMyOffers : lilc_RscControlsGroup
        {
            idc = 29;
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.304219 * safezoneW;
            h = 0.55 * safezoneH;

            class controls
            {
                class myOffers_TitleMyOffers : lilc_RscText
                {
                    idc = 1000;
                    text = "Meine Angebote:"; //--- ToDo: Localize;
                    x = 0.015469 * safezoneW;
                    y = 0.044 * safezoneH;
                    w = 0.0876563 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class myOffers_TitleClassname : lilc_RscText
                {
                    idc = 1004;
                    text = "Item"; //--- ToDo: Localize;
                    x = 0.036094 * safezoneW;
                    y = 0.077 * safezoneH;
                    w = 0.061875 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class myOffers_TitleCategory : lilc_RscText
                {
                    idc = 1005;
                    text = "Kategorie"; //--- ToDo: Localize;
                    x = 0.0979691 * safezoneW;
                    y = 0.077 * safezoneH;
                    w = 0.0464062 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class myOffers_TitleAmount : lilc_RscText
                {
                    idc = 1006;
                    text = "Anzahl"; //--- ToDo: Localize;
                    x = 0.144375 * safezoneW;
                    y = 0.077 * safezoneH;
                    w = 0.0309375 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class myOffers_TitlePrice : lilc_RscText
                {
                    idc = 1007;
                    text = "Stk/Preis"; //--- ToDo: Localize;
                    x = 0.175313 * safezoneW;
                    y = 0.077 * safezoneH;
                    w = 0.04125 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class myOffers_TitleDate : lilc_RscText
                {
                    idc = 1008;
                    text = "Datum"; //--- ToDo: Localize;
                    x = 0.216563 * safezoneW;
                    y = 0.077 * safezoneH;
                    w = 0.0309375 * safezoneW;
                    h = 0.022 * safezoneH;
                };

                class myOffers_TitleDelete : lilc_RscText
                {
                    idc = 1009;
                    text = "Löschen"; //--- ToDo: Localize;
                    x = 0.2475 * safezoneW;
                    y = 0.077 * safezoneH;
                    w = 0.0360937 * safezoneW;
                    h = 0.022 * safezoneH;
                };
                
                class myOffers_GroupList : lilc_RscControlsGroup
                {
                    idc = 2301;
                    x = 0.0309377 * safezoneW;
                    y = 0.099 * safezoneH;
                    w = 0.257813 * safezoneW;
                    h = 0.418 * safezoneH;

                    class Controls
                    {
                    };
                };
            };
        };
    };
};
