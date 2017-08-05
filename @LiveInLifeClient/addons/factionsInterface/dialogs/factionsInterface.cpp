


class lilc_factionsInterfaceMenu {
    name = "lilc_factionsInterfaceMenu";
    idd = 1374;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        /* BACKGROUND CONTROLS */
        class FrameBackgroundHeader : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class FrameBackgroundBackground : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.473 * safezoneH;
        };

        class FrameBackgroundFooter : lilc_RscText {
            idc = -1;
            text = "";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.044 * safezoneH;
        };
    };

    class controls {
        class TitleTitle : lilc_RscTitle {
            idc = 1375;
            text = "";
            x = 0.296302 * safezoneW + safezoneX;
            y = 0.230445 * safezoneH + safezoneY;
            w = 0.407344 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonClose : lilc_RscButtonMenu {
            idc = 1376;
            text = "";
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.742 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.022 * safezoneH;
        };
        

        /*
        DASHBOARD CONTROLS
        */

        class Dashboard_ListPlayers : lilc_RscListbox {
            idc = 1377;
            text = "";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.374 * safezoneH;
        };

        class Dashboard_ListRanks : lilc_RscListbox {
            idc = 1378;
            text = "";
            x = 0.432968 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.374 * safezoneH;
        };

        class Dashboard_ListGroups : lilc_RscListbox {
            idc = 1379;
            text = "";
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.374 * safezoneH;
        };

        class Dashboard_ButtonPlayers1 : lilc_RscButtonMenu {
            idc = 1380;
            text = "";
            x = 0.298438 * safezoneW + safezoneX;
            y = 0.65 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class Dashboard_ButtonPlayers2 : lilc_RscButtonMenu {
            idc = 1381;
            text = "";
            x = 0.298438 * safezoneW + safezoneX;
            y = 0.674075 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class Dashboard_ButtonPlayers3 : lilc_RscButtonMenu {
            idc = 1382;
            text = "";
            x = 0.298385 * safezoneW + safezoneX;
            y = 0.698 * safezoneH + safezoneY;
            w = 0.129427 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class Dashboard_ButtonRanks1 : lilc_RscButtonMenu {
            idc = 1383;
            text = "";
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.650407 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class Dashboard_ButtonRanks2 : lilc_RscButtonMenu {
            idc = 1384;
            text = "";
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.674259 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class Dashboard_ButtonRanks3 : lilc_RscButtonMenu {
            idc = 1385;
            text = "";
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.698 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class Dashboard_ButtonGroups1 : lilc_RscButtonMenu {
            idc = 1386;
            text = "";
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.650407 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class Dashboard_ButtonGroups2 : lilc_RscButtonMenu {
            idc = 1387;
            text = "";
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.674259 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class Dashboard_ButtonGroups3 : lilc_RscButtonMenu {
            idc = 1388;
            text = "";
            x = 0.572188 * safezoneW + safezoneX;
            y = 0.698 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.022 * safezoneH;
        };


        /*
        PLAYER EDIT CONTROLS
        */

        class _PlayerEdit_ButtonUpVehicles : lilc_RscButton {
            idc = 1399;
            text = "+";
            borderSize = 0;
			colorShadow[] = {0,0,0,0};
            colorBackground[] = {0, 0, 0, 1};
        };

        class _PlayerEdit_ButtonDownVehicles : _PlayerEdit_ButtonUpVehicles {
            idc = 1400;
            text = "-";
        };

        class _PlayerEdit_ButtonUpEquipment : _PlayerEdit_ButtonUpVehicles {
            idc = 1401;
        };

        class _PlayerEdit_ButtonDownEquipment : _PlayerEdit_ButtonDownVehicles {
            idc = 1402;
        };

        class _PlayerEdit_ButtonUpPermissions : _PlayerEdit_ButtonUpVehicles {
            idc = 1403;
        };

        class _PlayerEdit_ButtonDownPermissions : _PlayerEdit_ButtonDownVehicles {
            idc = 1404;
        };

        class PlayerEdit_ListVehicles : lilc_RscListNBox {
            idc = 1389;
            text = "";
            drawSideArrows = 1;
            idcRight = 1399;
            idcLeft = 1400;
            rowHeight = 0.04;
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.195937 * safezoneW;
            h = 0.198 * safezoneH;
        };

        class PlayerEdit_ListEquipment : PlayerEdit_ListVehicles {
            idc = 1390;
            text = "";
            idcRight = 1401;
            idcLeft = 1402;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.522 * safezoneH + safezoneY;
            w = 0.195937 * safezoneW;
            h = 0.198 * safezoneH;
        };

        class PlayerEdit_ListPermissions : PlayerEdit_ListVehicles {
            idc = 1391;
            text = "";
            idcRight = 1403;
            idcLeft = 1404;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.522 * safezoneH + safezoneY;
            w = 0.201094 * safezoneW;
            h = 0.198 * safezoneH;
        };

        class PlayerEdit_TitleVehicles : lilc_RscTitle {
            idc = 1392;
            text = "Fahrzeuge:";
            x = 0.505157 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.195937 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class PlayerEdit_TitleEquipment : lilc_RscTitle {
            idc = 1393;
            text = "Ausruestung:";
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.195937 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class PlayerEdit_TitlePermissions : lilc_RscTitle {
            idc = 1394;
            text = "Rechte:";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.201094 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class PlayerEdit_TitlePlayername : lilc_RscTitle {
            idc = 1395;
            text = "Spielername:";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class PlayerEdit_TextPlayername : lilc_RscTitle {
            idc = 1396;
            text = "";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class PlayerEdit_TitleRank : lilc_RscTitle {
            idc = 1397;
            text = "Rang:";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class PlayerEdit_ComboRank : lilc_RscCombo {
            idc = 1398;
            text = "";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.044 * safezoneH;
        };


        /*
        RANK EDIT CONTROLS
        */


    };
};
