
class lilcm_factionsInterface {
    name = "lilc_factionsInterface";
    idd = 1370;
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground {
		class FrameBackgroundBackground : lilc_RscText {
			idc = 1407;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.462 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.8};
		};

		class TitleTitle : lilc_RscText {
			idc = 1408;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 1};
		};
    };

    class controls {
		/*
		#### DASHBOARD CONTROL #### | 1371 - 1378
		*/

		class dashboard_ListPlayers : lilc_RscListbox {
			idc = 1371;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.392296 * safezoneH;
		};

		class dashboard_ListRanks : lilc_RscListbox {
			idc = 1372;
			x = 0.536093 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.341 * safezoneH;
		};

		class dashboard_ButtonEditPlayer : lilc_RscButtonMenu {
			idc = 1373;
			text = "Bearbeiten";
			onButtonClick = "[(lbValue [1371, (lbCurSel 1371)])] call lilc_factionsInterface_fnc_editPlayer;";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class dashboard_ButtonAddRank : lilc_RscButtonMenu {
			idc = 1374;
			onButtonClick = "['rankadd'] call lilc_factionsInterface_fnc_selectMenu;";
			text = "Hinzufuegen";
			x = 0.536145 * safezoneW + safezoneX;
			y = 0.668815 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class dashboard_ButtonEditRank : lilc_RscButtonMenu {
			idc = 1375;
			onButtonClick = "[(lbValue [1372, (lbCurSel 1372)])] call lilc_factionsInterface_fnc_editRank;";
			text = "Bearbeiten";
			x = 0.536145 * safezoneW + safezoneX;
			y = 0.694407 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class dashboard_ButtonRemoveRank : lilc_RscButtonMenu {
			idc = 1376;
			text = "Entfernen";
			onButtonClick = "[(lbValue [1372, (lbCurSel 1372)])] call lilc_factionsInterface_fnc_removeRank;";
			x = 0.536145 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class dashboard_TitlePlayers : lilc_RscTitle {
			idc = 1377;
			text = "Spieler in Fraktion:";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 1};
		};

		class dashboard_TitleRanks : lilc_RscTitle {
			idc = 1378;
			x = 0.536093 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 1};
		};

		/*
		#### PLAYER CONTROL #### | 1379-1390
		*/

		class player_TitlePlayername : lilc_RscTitle {
			idc = 1379;
			text = "Spielername:";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class player_TextPlayername : lilc_RscText {
			idc = 1380;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.7};
		};

		class player_TitleRank : lilc_RscTitle {
			idc = 1381;
			text = "Rang:";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class player_ComboRank : lilc_RscCombo {
			idc = 1382;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.7};
		};
		
		class player_TitlePermissions : lilc_RscText {
			idc = 1383;
			text = "Rechte:";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class player_ListPermissions : lilc_RscListNBox {
			idc = 1384;
			onLBDblClick = "_this call lilc_factionsInterface_fnc_onListDblClick;";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.253 * safezoneH;
            drawSideArrows = 1;
            idcLeft = -1;
            idcRight = -1;
            rowHeight = 0.04;
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
		};

		class player_TitleWeapons : lilc_RscTitle {
			idc = 1385;
			text = "Waffen:";
			x = 0.484532 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class player_ListWeapons : lilc_RscListNBox {
			idc = 1386;
			onLBDblClick = "_this call lilc_factionsInterface_fnc_onListDblClick;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.176 * safezoneH;
            drawSideArrows = 1;
            idcLeft = -1;
            idcRight = -1;
            rowHeight = 0.04;
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
		};

		class player_ListVehicles : lilc_RscListNBox {
			idc = 1387;
			onLBDblClick = "_this call lilc_factionsInterface_fnc_onListDblClick;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.176 * safezoneH;
            drawSideArrows = 1;
            idcLeft = -1;
            idcRight = -1;
            rowHeight = 0.04;
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
		};

		class player_TitleVehicles : lilc_RscTitle {
			idc = 1388;
			text = "Fahrzeuge:";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class player_ButtonSave : lilc_RscButtonMenu {
			idc = 1389;
			text = "Save";
			onButtonClick = "[] spawn lilc_factionsInterface_fnc_savePlayerInfo;";
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class player_ButtonBack : lilc_RscButtonMenu {
			idc = 1390;
			text = "Back";
			onButtonClick = "['dashboard'] call lilc_factionsInterface_fnc_selectMenu;";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		/*
		#### RANK CONTROL #### | 1391-1406
		*/

		class rank_TitleRanktag : lilc_RscTitle {
			idc = 1391;
			text = "Rangkuerzel:";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class rank_EditRanktag : lilc_RscEdit {
			idc = 1392;
			text = "";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.7};
		};

		class rank_TitleRankName : lilc_RscTitle {
			idc = 1393;
			text = "Rangname:";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class rank_EditRankname : lilc_RscEdit {
			idc = 1394;
			text = "";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.7};
		};

		class rank_TitlePermissions : lilc_RscTitle {
			idc = 1395;
			text = "Rechte:";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class rank_ListPermissions : lilc_RscListNBox {
			idc = 1396;
			onLBDblClick = "_this call lilc_factionsInterface_fnc_onListDblClick;";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.187 * safezoneH;
            drawSideArrows = 1;
            idcLeft = -1;
            idcRight = -1;
            rowHeight = 0.04;
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
		};

		class rank_TitleWeapons : lilc_RscTitle {
			idc = 1397;
			text = "Waffen:";
			x = 0.484532 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class rank_ListWeapons: lilc_RscListNBox {
			idc = 1398;
			onLBDblClick = "_this call lilc_factionsInterface_fnc_onListDblClick;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.176 * safezoneH;
            drawSideArrows = 1;
            idcLeft = -1;
            idcRight = -1;
            rowHeight = 0.04;
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
		};

		class rank_ListVehicles : lilc_RscListNBox {
			idc = 1399;
			onLBDblClick = "_this call lilc_factionsInterface_fnc_onListDblClick;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.176 * safezoneH;
            drawSideArrows = 1;
            idcLeft = -1;
            idcRight = -1;
            rowHeight = 0.04;
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
		};

		class rank_TitleVehicles : lilc_RscTitle {
			idc = 1400;
			text = "Fahrzeuge:";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class rank_ButtonSave : lilc_RscButtonMenu {
			idc = 1401;
			text = "Save";
			onButtonClick = "[] spawn lilc_factionsInterface_fnc_saveRankInfo;";
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class rank_ButtonBack : lilc_RscButtonMenu {
			idc = 1402;
			text = "Back";
			onButtonClick = "['dashboard'] call lilc_factionsInterface_fnc_selectMenu;";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class rank_TitlePaycheck : lilc_RscTitle {
			idc = 1403;
			text = "Paycheck:";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class rank_ComboPaycheck : lilc_RscCombo {
			idc = 1404;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.7};
		};

		class rank_TitleRankIcon : lilc_RscTitle {
			idc = 1405;
			text = "Rangicon:";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class rank_ComboRankIcon : lilc_RscCombo {
			idc = 1406;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.7};
		};

		/*
		#### RANKADD CONTROL #### | 1421-1430
		*/

		class rankadd_TitleRank : lilc_RscTitle {
			idc = 1421;
			text = "Rangname:";
			colorBackground[] = {0, 0, 0, 0.9};
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class rankadd_EditRank : lilc_RscEdit {
			idc = 1422;
			text = "";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class rankadd_TitleTag : lilc_RscTitle {
			idc = 1423;
			text = "Rangtag:";
			colorBackground[] = {0, 0, 0, 0.9};
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class rankadd_EditTag : lilc_RscEdit {
			idc = 1424;
			text = "";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class rankadd_TitleIcon : lilc_RscTitle {
			idc = 1425;
			text = "Rangicon:";
			colorBackground[] = {0, 0, 0, 0.9};
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class rankadd_ComboIcon : lilc_RscCombo {
			idc = 1426;
			text = "";
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class rankadd_TitlePaycheck : lilc_RscTitle {
			idc = 1427;
			text = "Rangbezahlung:";
            colorPicture[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,1};
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class rankadd_ComboPaycheck : lilc_RscCombo {
			idc = 1428;
			text = "";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class rankadd_ButtonAdd : lilc_RscButtonMenu {
			idc = 1429;
			text = "Add";
			onButtonClick = "[] spawn lilc_factionsInterface_fnc_addRank;";
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};

		class rankadd_ButtonBack : lilc_RscButtonMenu {
			idc = 1430;
			text = "Back";
			onButtonClick = "['dashboard'] call lilc_factionsInterface_fnc_selectMenu;";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.9};
		};
    };
};

/*
class rt: RscPicture
{
	idc = 1202;
	text = "#(argb,8,8,3)color(0,0,0,1)";
};
class re: RscPicture
{
	idc = 1203;
	text = "#(argb,8,8,3)color(0,0,0,0.75)";
};
class rtt: RscPicture
{
	idc = 1204;
	text = "#(argb,8,8,3)color(0,0,0,1)";
};
class rte: RscPicture
{
	idc = 1205;
	text = "#(argb,8,8,3)color(0,0,0,0.75)";
};
class rit: RscPicture
{
	idc = 1208;
	text = "#(argb,8,8,3)color(0,0,0,1)";
};
class ric: RscPicture
{
	idc = 1209;
	text = "#(argb,8,8,3)color(0,0,0,0.75)";
};
class rpt: RscPicture
{
	idc = 1210;
	text = "#(argb,8,8,3)color(0,0,0,1)";
};
class rpc: RscPicture
{
	idc = 1211;
	text = "#(argb,8,8,3)color(0,0,0,0.75)";
};
+ Buttons (back, add)
*/

/*class lilc_factionsInterface_dashboard {
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
};*/
