
class lilc_factionsInterface_groups {
    name = "lilc_factionsInterface_groups";
    idd = 1374;
    movingEnable = false;
    enableSimulation = true;
    
    class controlsBackground {
        class FrameBackgroundBackground : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.309221 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.381563 * safezoneW;
            h = 0.429 * safezoneH;
        };

        class FrameFooterBackground : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.381563 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class FrameTitleBackground : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.30922 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.381563 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle {
            idc = -1;
            text = "Gruppenübersicht";
            x = 0.312395 * safezoneW + safezoneX;
            y = 0.252444 * safezoneH + safezoneY;
            w = 0.374896 * safezoneW;
            h = 0.0229259 * safezoneH;
        };

        class TitleGroupName : lilc_RscTitle {
            idc = -1;
            text = "Gruppenname:";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class TitleGroupPlayers : lilc_RscTitle {
            idc = -1;
            text = "Spieler in Gruppe:";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.155156 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleGroups : lilc_RscTitle {
            idc = -1;
            text = "Gruppen:";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };

    class controls {
        class ListGroups : lilc_RscListbox {
            idc = 1375;
            text = "";
            onLBSelChanged = "[(_this select 1)] call lilc_factionsInterface_fnc_onGroupChange;";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.341 * safezoneH;
        };

        class ListGroupPlayers : lilc_RscListbox {
            idc = 1376;
            text = "";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.403556 * safezoneH + safezoneY;
            w = 0.155208 * safezoneW;
            h = 0.261333 * safezoneH;
        };

        class EditGroupName : lilc_RscEdit {
            idc = 1377;
            text = "";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.315667 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.055 * safezoneH;
        };

        class ButtonComplete : lilc_RscButtonMenu {
            idc = 1378;
            text = "Übernehmen";
            x = 0.618594 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonEditGroup : lilc_RscButtonMenu {
            idc = 1379;
            text = "Bearbeiten";
            onButtonClick = "call lilc_factionsInterface_fnc_onGroupEdit;";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonAddPlayer : lilc_RscButtonMenu {
            idc = 1380;
            text = "Hinzufügen";
            x = 0.603125 * safezoneW + safezoneX;
            y = 0.403778 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonRemovePlayer : lilc_RscButtonMenu {
            idc = 1381;
            text = "Entfernen";
            x = 0.603125 * safezoneW + safezoneX;
            y = 0.432148 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonSetLeader : lilc_RscButtonMenu {
            idc = 1382;
            text = "Ernennen";
            x = 0.603125 * safezoneW + safezoneX;
            y = 0.461444 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonAddGroup : lilc_RscButtonMenu {
            idc = -1;
            text = "Gruppe hinzufügen";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonBack : lilc_RscButtonMenu {
            idc = -1;
            text = "Zur Übersicht";
            onButtonClick = "closeDialog 1374; [] spawn lilc_factionsInterface_fnc_openDashboardMenu;";
            x = 0.577344 * safezoneW + safezoneX;
            y = 0.720926 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
