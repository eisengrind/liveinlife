
class lilc_factionsInterface_players {
    name = "lilc_factionsInterface_players";
    idd = 1385;
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

        class TitlePlayerName : lilc_RscTitle {
            idc = -1;
            text = "Spielername:";
            font = "PuristaMedium";
            x = 0.531927 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.153698 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle {
            idc = -1;
            text = "Spielerübersicht";
            font = "PuristaMedium";
            x = 0.312395 * safezoneW + safezoneX;
            y = 0.252444 * safezoneH + safezoneY;
            w = 0.374896 * safezoneW;
            h = 0.0229259 * safezoneH;
        };

        class TitlePlayers : lilc_RscTitle {
            idc = -1;
            text = "Spielerliste:";
            font = "PuristaMedium";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleRank : lilc_RscTitle {
            idc = -1;
            text = "Rang:";
            font = "PuristaMedium";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitlePlayerPermissions : lilc_RscTitle {
            idc = -1;
            text = "Rechte:";
            font = "PuristaMedium";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.347852 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitlePlayerVehicles : lilc_RscTitle {
            idc = -1;
            text = "Fahrzeuge:";
            font = "PuristaMedium";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.554074 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitlePlayerEquipment : lilc_RscTitle {
            idc = -1;
            text = "Ausrüstung:";
            font = "PuristaMedium";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.45137 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };

    class controls {
        class ListPlayers : lilc_RscListbox {
            idc = 1386;
            text = "";
            onLBSelChanged = "[(_this select 1)] call lilc_factionsInterface_fnc_onPlayerChange;";
            sizeEx = 0.03;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.374 * safezoneH;
        };

        class TextPlayerName : lilc_RscText {
            idc = 1387;
            text = "";
            x = 0.531927 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.153698 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class _ButtonListNBoxEquipmentLeft : lilc_RscButton {
            idc = 1393;
            type = 1;
            text = "-";
            borderSize = 0;
			colorShadow[] = {0,0,0,0};
            colorBackground[] = {0, 0, 0, 1};
            onButtonClick = "call lilc_factionsInterface_fnc_onPlayerEquipmentDown;";
        };

        class _ButtonListNBoxEquipmentRight : _ButtonListNBoxEquipmentLeft {
            idc = 1394;
            text = "+";
            onButtonClick = "call lilc_factionsInterface_fnc_onPlayerEquipmentUp;";
        };

        class _ButtonListNBoxVehiclesLeft : _ButtonListNBoxEquipmentLeft {
            idc = 1395;
            text = "-";
            onButtonClick = "call lilc_factionsInterface_fnc_onPlayerVehicleDown;";
        };

        class _ButtonListNBoxVehiclesRight : _ButtonListNBoxEquipmentLeft {
            idc = 1396;
            text = "+";
            onButtonClick = "call lilc_factionsInterface_fnc_onPlayerVehicleUp;";
        };

        class ListPlayerEquipment : lilc_RscListNBox {
            idc = 1388;
            text = "";
            drawSideArrows = 1;
            idcLeft = 1393;
            idcRight = 1394;
            rowHeight = 0.04;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.475222 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.077 * safezoneH;
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
        };

        class ListPlayerVehicles : lilc_RscListNBox {
            idc = 1389;
            text = "";
            drawSideArrows = 1;
            idcLeft = 1395;
            idcRight = 1396;
            rowHeight = 0.04;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.577815 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.077 * safezoneH;
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
        };

        class ComboRank : lilc_RscCombo {
            idc = 1390;
            text = "";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class ButtonComplete : lilc_RscButtonMenu {
            idc = 1391;
            text = "Übernehmen";
            onButtonClick = "call lilc_factionsInterface_fnc_onPlayerComplete;";
            x = 0.618594 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonEdit : lilc_RscButtonMenu {
            idc = 1392;
            text = "Bearbeiten";
            onButtonClick = "call lilc_factionsInterface_fnc_onPlayerEdit;";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class _ButtonListNBoxPermissionsLeft : _ButtonListNBoxEquipmentLeft {
            idc = 1398;
            text = "-";
            onButtonClick = "call lilc_factionsInterface_fnc_onPlayerPermissionRemove;";
        };

        class _ButtonListNBoxPermissionsRight : _ButtonListNBoxEquipmentLeft {
            idc = 1399;
            text = "+";
            onButtonClick = "call lilc_factionsInterface_fnc_onPlayerPermissionAdd;";
        };

        class ListPlayerPermissions : lilc_RscListNBox {
            idc = 1397;
            text = "";
            drawSideArrows = 1;
            idcLeft = 1398;
            idcRight = 1399;
            rowHeight = 0.04;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.371704 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.077 * safezoneH;
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
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
