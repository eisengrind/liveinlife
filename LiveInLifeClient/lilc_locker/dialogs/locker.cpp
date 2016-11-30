
class lilc_lockerMenu {
    name = "lilc_lockerMenu";
    idd = 1440;
	movingEnable = false;
	enableSimulation = true;
    onUnload = "(_this select 0) displayRemoveEventHandler [""KeyDown"", lilc_locker_onKeyDownIndex];";

    class controlsBackground {
        class FrameBackgroundTitle : lilc_RscText_whiteBackground {
            idc = -1;
            text = "";
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class FrameBackgroundBackground : lilc_RscText_darkBlueBackground {
            idc = -1;
            text = "";
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.121 * safezoneH;
        };

        class FrameBackgroundFooter : lilc_RscText_whiteBackground {
            idc = -1;
            text = "";
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class TitleCombo : lilc_RscTitle {
            idc = -1;
            text = "Schließfächer";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };

    class controls {
        class ComboLockers : lilc_RscCombo {
            idc = 1441;
            text = "";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class ButtonOpen : lilc_RscButtonMenu {
            idc = 1442;
            text = "Öffnen";
            onButtonClick = "call lilc_locker_fnc_load;";
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonNewLocker : lilc_RscButtonMenu {
            idc = 1443;
            text = "Neues Schließfach";
            onButtonClick = "[] spawn lilc_locker_fnc_create;";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.0753125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle {
            idc = 1444;
            text = "";
            x = 0.420572 * safezoneW + safezoneX;
            y = 0.385593 * safezoneH + safezoneY;
            w = 0.159375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonClose : lilc_RscButtonMenu {
            idc = -1;
            text = "Schließen";
            onButtonClick = "call lilc_locker_fnc_closeMenu;";
            x = 0.502552 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.0747917 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};

class lilc_lockerCreateMenu {
    name = "lilc_lockerCreateMenu";
    idd = 1445;
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground {
        class FrameBackgroundTitle : lilc_RscText_whiteBackground {
            idc = -1;
            text = "";
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class FrameBackgroundBackground : lilc_RscText_darkBlueBackground {
            idc = -1;
            text = "";
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.121 * safezoneH;
        };

        class FrameBackgroundFooter : lilc_RscText_whiteBackground {
            idc = -1;
            text = "";
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.044 * safezoneH;
        };
    };

    class controls {
        class TextDescription : lilc_RscStructuredText {
            idc = 1446;
            text = "";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.099 * safezoneH;
        };

        class TitleTitle : lilc_RscTitle {
            idc = 1447;
            text = "";
            x = 0.420572 * safezoneW + safezoneX;
            y = 0.385593 * safezoneH + safezoneY;
            w = 0.159375 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonBack : lilc_RscButtonMenu {
            idc = 1448;
            text = "Schließen";
            x = 0.502552 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.0747917 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ButtonCreate : lilc_RscButtonMenu {
            idc = 1449;
            text = "Erstellen";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.0753125 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
/*
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Willy Wolli, v1.063, #Siziki)
////////////////////////////////////////////////////////

        class titlebg: RscPicture
        {
            idc = 1200;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class bg: RscPicture
        {
            idc = 1201;
            text = "#(argb,8,8,3)color(0,0,0,1)";
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.121 * safezoneH;
        };
        class footerbg: RscPicture
        {
            idc = 1202;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class backbutt: RscPicture
        {
            idc = 1205;
            text = "#(argb,8,8,3)color(0,0,0,1)";
            x = 0.502552 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.0747917 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class description: RscPicture
        {
            idc = 1206;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.099 * safezoneH;
        };
        class createLocker: RscPicture
        {
            idc = 1207;
            text = "#(argb,8,8,3)color(0,0,0,1)";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.0753125 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class title: RscPicture
        {
            idc = 1208;
            text = "#(argb,8,8,3)color(0,0,0,1)";
            x = 0.420572 * safezoneW + safezoneX;
            y = 0.385593 * safezoneH + safezoneY;
            w = 0.159375 * safezoneW;
            h = 0.022 * safezoneH;
        };
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


















/////////Ended
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Willy Wolli, v1.063, #Lafopo)
////////////////////////////////////////////////////////

    class titlebg: RscPicture
    {
        idc = 1200;
        text = "#(argb,8,8,3)color(1,1,1,1)";
        x = 0.4175 * safezoneW + safezoneX;
        y = 0.379 * safezoneH + safezoneY;
        w = 0.165 * safezoneW;
        h = 0.033 * safezoneH;
    };
    class bg: RscPicture
    {
        idc = 1201;
        text = "#(argb,8,8,3)color(0,0,0,1)";
        x = 0.4175 * safezoneW + safezoneX;
        y = 0.412 * safezoneH + safezoneY;
        w = 0.165 * safezoneW;
        h = 0.121 * safezoneH;
    };
    class footerbg: RscPicture
    {
        idc = 1202;
        text = "#(argb,8,8,3)color(1,1,1,1)";
        x = 0.4175 * safezoneW + safezoneX;
        y = 0.533 * safezoneH + safezoneY;
        w = 0.165 * safezoneW;
        h = 0.044 * safezoneH;
    };
    class lockerlist: RscPicture
    {
        idc = 1203;
        text = "#(argb,8,8,3)color(1,1,1,1)";
        x = 0.422656 * safezoneW + safezoneX;
        y = 0.445 * safezoneH + safezoneY;
        w = 0.154687 * safezoneW;
        h = 0.044 * safezoneH;
    };
    class buttonload: RscPicture
    {
        idc = 1204;
        text = "#(argb,8,8,3)color(1,1,1,1)";
        x = 0.45875 * safezoneW + safezoneX;
        y = 0.5 * safezoneH + safezoneY;
        w = 0.0825 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class closebutton: RscPicture
    {
        idc = 1205;
        text = "#(argb,8,8,3)color(0,0,0,1)";
        x = 0.502552 * safezoneW + safezoneX;
        y = 0.544 * safezoneH + safezoneY;
        w = 0.0747917 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class title: RscPicture
    {
        idc = 1206;
        text = "#(argb,8,8,3)color(1,1,1,1)";
        x = 0.422656 * safezoneW + safezoneX;
        y = 0.423 * safezoneH + safezoneY;
        w = 0.154687 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class newLockerbutton: RscPicture
    {
        idc = 1207;
        text = "#(argb,8,8,3)color(0,0,0,1)";
        x = 0.422656 * safezoneW + safezoneX;
        y = 0.544 * safezoneH + safezoneY;
        w = 0.0753125 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class RscPicture_1208: RscPicture
    {
        idc = 1208;
        text = "#(argb,8,8,3)color(0,0,0,1)";
        x = 0.420572 * safezoneW + safezoneX;
        y = 0.385593 * safezoneH + safezoneY;
        w = 0.159375 * safezoneW;
        h = 0.022 * safezoneH;
    };
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
*/
