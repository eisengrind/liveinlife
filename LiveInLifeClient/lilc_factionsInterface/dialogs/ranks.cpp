

class lilc_factionsInterface_ranks {
    name = "lilc_factionsInterface_ranks";
    idd = 1400;
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
            text = "Rangübersicht";
            font = "PuristaMedium";
            x = 0.312395 * safezoneW + safezoneX;
            y = 0.252444 * safezoneH + safezoneY;
            w = 0.374896 * safezoneW;
            h = 0.0229259 * safezoneH;
        };

        class TitleRanktag : lilc_RscTitle {
            idc = -1;
            text = "Rangtag:";
            font = "PuristaMedium";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleRankname : lilc_RscTitle {
            idc = -1;
            text = "Rangname:";
            font = "PuristaMedium";
            x = 0.516511 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitlePriority : lilc_RscTitle {
            idc = -1;
            text = "Priorität:";
            font = "PuristaMedium";
            x = 0.605156 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleInsignia : lilc_RscTitle {
            idc = -1;
            text = "Zeichen";
            font = "PuristaMedium";
            x = 0.647448 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.0386458 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleRanks : lilc_RscTitle {
            idc = -1;
            text = "Ränge:";
            font = "PuristaMedium";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleRankPermissions : lilc_RscTitle {
            idc = -1;
            text = "Rechte:";
            font = "PuristaMedium";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.347852 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleRankVehicles : lilc_RscTitle {
            idc = -1;
            text = "Fahrzeuge:";
            font = "PuristaMedium";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.554074 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleRankEquipment : lilc_RscTitle {
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
        class ListRanks : lilc_RscListbox {
            idc = 1401;
            text = "";
            onLBSelChanged = "[(_this select 1)] call lilc_factionsInterface_fnc_onRankChange;";
            sizeEx = 0.03;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.374 * safezoneH;
        };

        class EditRanktag : lilc_RscEdit {
            idc = 1402;
            text = "";
            x = 0.443229 * safezoneW + safezoneX;
            y = 0.315667 * safezoneH + safezoneY;
            w = 0.0722916 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class EditRankname : lilc_RscEdit {
            idc = 1403;
            text = "";
            x = 0.516927 * safezoneW + safezoneX;
            y = 0.315778 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class ComboPriority : lilc_RscCombo {
            idc = 1404;
            text = "";
            x = 0.604999 * safezoneW + safezoneX;
            y = 0.315667 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class ComboInsignia : lilc_RscCombo {
            idc = 1405;
            text = "";
            x = 0.647396 * safezoneW + safezoneX;
            y = 0.315778 * safezoneH + safezoneY;
            w = 0.0386979 * safezoneW;
            h = 0.033 * safezoneH;
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
        };

        class _ButtonListNBoxEquipmentLeft : lilc_RscButton {
            idc = 1409;
            type = 1;
            text = "-";
            borderSize = 0;
			colorShadow[] = {0,0,0,0};
            colorBackground[] = {0, 0, 0, 1};
            onButtonClick = "call lilc_factionsInterface_fnc_onRankEquipmentDown;";
        };

        class _ButtonListNBoxEquipmentRight : _ButtonListNBoxEquipmentLeft {
            idc = 14010;
            text = "+";
            onButtonClick = "call lilc_factionsInterface_fnc_onRankEquipmentUp;";
        };

        class _ButtonListNBoxVehiclesLeft : _ButtonListNBoxEquipmentLeft {
            idc = 1411;
            text = "-";
            onButtonClick = "call lilc_factionsInterface_fnc_onRankVehicleDown;";
        };

        class _ButtonListNBoxVehiclesRight : _ButtonListNBoxEquipmentLeft {
            idc = 1412;
            text = "+";
            onButtonClick = "call lilc_factionsInterface_fnc_onRankVehicleUp;";
        };

        class _ButtonListNBoxPermissionsLeft : _ButtonListNBoxEquipmentLeft {
            idc = 1413;
            text = "-";
            onButtonClick = "call lilc_factionsInterface_fnc_onRankPermissionRemove;";
        };

        class _ButtonListNBoxPermissionsRight : _ButtonListNBoxEquipmentLeft {
            idc = 1414;
            text = "+";
            onButtonClick = "call lilc_factionsInterface_fnc_onRankPermissionAdd;";
        };

        class ListRankEquipment : lilc_RscListNBox {
            idc = 1406;
            text = "";
            drawSideArrows = 1;
            idcLeft = 1409;
            idcRight = 14010;
            rowHeight = 0.04;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.475222 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.077 * safezoneH;
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
        };

        class ListRankVehicles : lilc_RscListNBox {
            idc = 1407;
            text = "";
            drawSideArrows = 1;
            idcLeft = 1411;
            idcRight = 1412;
            rowHeight = 0.04;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.577815 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.077 * safezoneH;
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
        };

        class ListRankPermissions : lilc_RscListNBox {
            idc = 1408;
            text = "";
            drawSideArrows = 1;
            idcLeft = 1413;
            idcRight = 1414;
            rowHeight = 0.04;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.371704 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.077 * safezoneH;
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
        };

        class ButtonComplete : lilc_RscButtonMenu {
            idc = 1415;
            text = "Übernehmen";
            onButtonClick = "call lilc_factionsInterface_fnc_onRankComplete;";
            x = 0.618594 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonEdit : lilc_RscButtonMenu {
            idc = 1416;
            text = "Bearbeiten";
            onButtonClick = "call lilc_factionsInterface_fnc_onRankEdit;";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonBack : lilc_RscButtonMenu {
            idc = -1;
            text = "Zur Übersicht";
            onButtonClick = "closeDialog 1400; [] spawn lilc_factionsInterface_fnc_openDashboardMenu;";
            x = 0.577344 * safezoneW + safezoneX;
            y = 0.720926 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};

class lilc_factionsInterface_rankAdd {
    name = "lilc_factionsInterface_rankAdd";
    idd = 1416;
    movingEnable = false;
    enableSimulation = true;
    
    class controlsBackground {
        class FrameBackgroundBackground : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.381563 * safezoneW;
            h = 0.429 * safezoneH;
            colorBackground[] = {0,0,0,1};
        };

        class FrameFooterBackground: lilc_RscText
        {
            idc = -1;
            text = "";
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.381563 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {1,1,1,1};
        };

        class FrameTitleBackground : lilc_RscText
        {
            idc = -1;
            text = "";
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.381563 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {1,1,1,1};
        };

        class TitleTitle : lilc_RscTitle
        {
            idc = -1;
            font = "PuristaMedium";
            text = "Spielerübersicht"; //--- ToDo: Localize;
            x = 0.312416 * safezoneW + safezoneX;
            y = 0.2525 * safezoneH + safezoneY;
            w = 0.374895 * safezoneW;
            h = 0.022926 * safezoneH;
            colorText[] = {0.95,0.95,0.95,1};
        };

        class TitleRankname : lilc_RscTitle {
            idc = -1;
            text = "Rangname:";
            x = 0.439114 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class TitleRanktag : lilc_RscTitle {
            idc = -1;
            text = "Rangtag:";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitlePermissions : lilc_RscTitle {
            idc = -1;
            text = "Rechte:";
            x = 0.520624 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleEquipment : lilc_RscTitle {
            idc = -1;
            text = "Ausrüstung:";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.205261 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleVehicles : lilc_RscTitle {
            idc = -1;
            text = "Fahrzeuge:";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.510889 * safezoneH + safezoneY;
            w = 0.205261 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitlePriority : lilc_RscTitle {
            idc = -1;
            text = "Priorität:";
            x = 0.625729 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.0598959 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };

    class controls {
        class EditRanktag : lilc_RscEdit {
            idc = 1417;
            text = "";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.314852 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class EditRankname : lilc_RscEdit {
            idc = 1418;
            text = "";
            x = 0.439114 * safezoneW + safezoneX;
            y = 0.314741 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class EditPriority : lilc_RscEdit {
            idc = 1419;
            text = "";
            x = 0.625312 * safezoneW + safezoneX;
            y = 0.314852 * safezoneH + safezoneY;
            w = 0.0603645 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class ListRankPermissions : lilc_RscListNBox {
            idc = 1420;
            text = "";
            x = 0.520624 * safezoneW + safezoneX;
            y = 0.380741 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.284259 * safezoneH;
        };

        class ListRankEquipment : lilc_RscListNBox {
            idc = 1421;
            text = "";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.380741 * safezoneH + safezoneY;
            w = 0.205261 * safezoneW;
            h = 0.129444 * safezoneH;
        };

        class ListRankVehicles : lilc_RscListNBox {
            idc = 1422;
            text = "";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.535556 * safezoneH + safezoneY;
            w = 0.205261 * safezoneW;
            h = 0.129444 * safezoneH;
        };

        class ButtonAdd : lilc_RscButtonMenu {
            idc = -1;
            text = "";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonBack : lilc_RscButtonMenu {
            idc = -1;
            text = "Zurück";
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.8};
            onButtonClick = "closeDialog 1416; [] spawn lilc_factionsInterface_fnc_openRankMenu;";
            x = 0.577344 * safezoneW + safezoneX;
            y = 0.72088 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
