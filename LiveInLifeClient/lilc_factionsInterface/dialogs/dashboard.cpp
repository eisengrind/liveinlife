
class lilc_factionsInterface_dashboard {
    name = "lilc_factionsInterface_dashboard";
    idd = 1370;
    movingEnable = false;
    enableSimulation = true;
    
    class controlsBackground {
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

        class FrameBackgroundBackground : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.309221 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.381563 * safezoneW;
            h = 0.429 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle {
            idc = -1;
            text = "Fraktions-Übersicht";
            x = 0.312395 * safezoneW + safezoneX;
            y = 0.252444 * safezoneH + safezoneY;
            w = 0.374896 * safezoneW;
            h = 0.0229259 * safezoneH;
        };

        class TitlePlayerList : lilc_RscTitle {
            idc = -1;
            text = "Mitgliederliste";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleRankList : lilc_RscTitle {
            idc = -1;
            text = "Rangliste";
            x = 0.443282 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleGroupList : lilc_RscTitle {
            idc = -1;
            text = "Gruppenliste";
            x = 0.561875 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
    class controls {
        class ListPlayers : lilc_RscListbox {
            idc = 1371;
            text = "";
            sizeEx = 0.034;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.341 * safezoneH;
        };
        
        class ListRanks : lilc_RscListbox {
            idc = 1372;
            text = "";
            sizeEx = 0.034;
            x = 0.44328 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.341 * safezoneH;
        };

        class ListGroups : lilc_RscListbox {
            idc = 1373;
            text = "";
            sizeEx = 0.034;
            x = 0.561875 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.341 * safezoneH;
        };

        class ButtonClose : lilc_RscButtonMenu {
            idc = -1;
            text = "Schließen";
            onButtonClick = "closeDialog 0;";
            x = 0.577344 * safezoneW + safezoneX;
            y = 0.720926 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonPlayers : lilc_RscButtonMenu {
            idc = -1;
            text = "Spielerübersicht";
            onButtonClick = "closeDialog 1370; [] spawn lilc_factionsInterface_fnc_openPlayerMenu;";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonRanks : lilc_RscButtonMenu {
            idc = -1;
            text = "Rangübersicht";
            onButtonClick = "closeDialog 1370; [] spawn lilc_factionsInterface_fnc_openRankMenu;";
            x = 0.443282 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonGroups : lilc_RscButtonMenu {
            idc = -1;
            text = "Gruppenübersicht";
            onButtonClick = "closeDialog 1370; [] spawn lilc_factionsInterface_fnc_openGroupMenu;";
            x = 0.561875 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
