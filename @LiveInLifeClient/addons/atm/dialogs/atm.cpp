
/*
Background = 1511
Title = 1512
Description = 1513
ButtonBackgrounds = 1514 - 1521
Buttons = 1522 - 1529
ButtonTexts = 1530 - 1537
EditValue = 1538
*/

class lilc_atm_menu {
    name = "lilc_atm_menu";
    idd = 1510;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class FrameBackgroundBackground : lilc_RscPicture {
            idc = 1511;
            text = "\x\lilc\addons\atm\ui\atm_background.paa";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.115 * safezoneH + safezoneY;
            w = 0.402187 * safezoneW;
            h = 0.726 * safezoneH;
        };
        
        class PictureButton1 : lilc_RscPicture {
            idc = 1514;
            text = "\x\lilc\addons\atm\ui\atm_button_left.paa";
            x = 0.356771 * safezoneW + safezoneX;
            y = 0.430556 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class PictureButton2 : PictureButton1 {
            idc = 1515;
            x = 0.35625 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class PictureButton3 : PictureButton1 {
            idc = 1516;
            x = 0.355729 * safezoneW + safezoneX;
            y = 0.567593 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class PictureButton4 : PictureButton1 {
            idc = 1517;
            x = 0.355573 * safezoneW + safezoneX;
            y = 0.63663 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class PictureButton5 : PictureButton1 {
            idc = 1518;
            text = "\x\lilc\addons\atm\ui\atm_button_right.paa";
            x = 0.537604 * safezoneW + safezoneX;
            y = 0.430296 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class PictureButton6 : PictureButton5 {
            idc = 1519;
            x = 0.53802 * safezoneW + safezoneX;
            y = 0.499075 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class PictureButton7 : PictureButton5 {
            idc = 1520;
            x = 0.538542 * safezoneW + safezoneX;
            y = 0.567593 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class PictureButton8 : PictureButton5 {
            idc = 1521;
            x = 0.539063 * safezoneW + safezoneX;
            y = 0.637037 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class TextButton1 : lilc_RscStructuredText {
            idc = 1530;
            text = "";
            x = 0.358854 * safezoneW + safezoneX;
            y = 0.435186 * safezoneH + safezoneY;
            w = 0.0984895 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextButton2 : lilc_RscStructuredText {
            idc = 1531;
            text = "";
            x = 0.358854 * safezoneW + safezoneX;
            y = 0.501852 * safezoneH + safezoneY;
            w = 0.0984895 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextButton3 : lilc_RscStructuredText {
            idc = 1532;
            text = "";
            x = 0.358854 * safezoneW + safezoneX;
            y = 0.571556 * safezoneH + safezoneY;
            w = 0.0984895 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextButton4 : lilc_RscStructuredText {
            idc = 1533;
            text = "";
            x = 0.358854 * safezoneW + safezoneX;
            y = 0.640333 * safezoneH + safezoneY;
            w = 0.0984895 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextButton5 : lilc_RscStructuredText {
            idc = 1534;
            text = "";
            x = 0.545312 * safezoneW + safezoneX;
            y = 0.434926 * safezoneH + safezoneY;
            w = 0.0984895 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextButton6 : lilc_RscStructuredText {
            idc = 1535;
            text = "";
            x = 0.545312 * safezoneW + safezoneX;
            y = 0.502777 * safezoneH + safezoneY;
            w = 0.0984895 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextButton7 : lilc_RscStructuredText {
            idc = 1536;
            text = "";
            x = 0.545312 * safezoneW + safezoneX;
            y = 0.57237 * safezoneH + safezoneY;
            w = 0.0984895 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TextButton8 : lilc_RscStructuredText {
            idc = 1537;
            text = "";
            x = 0.545312 * safezoneW + safezoneX;
            y = 0.642074 * safezoneH + safezoneY;
            w = 0.0984895 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class PictureEditValue : lilc_RscPicture {
            idc = 1539;
            text = "\x\lilc\addons\atm\ui\atm_edit_background.paa";
            x = 0.435 * safezoneW + safezoneX;
            y = 0.406444 * safezoneH + safezoneY;
            w = 0.130521 * safezoneW;
            h = 0.0532592 * safezoneH;
        };
    };

    class controls {
        class TitleTitle : lilc_RscStructuredText {
            idc = 1512;
            text = "";
            x = 0.418738 * safezoneW + safezoneX;
            y = 0.29628 * safezoneH + safezoneY;
            w = 0.2225 * safezoneW;
            h = 0.0503705 * safezoneH;
        };

        class TitleSubTitle : lilc_RscStructuredText {
            idc = 1541;
            text = "";
            x = 0.424409 * safezoneW + safezoneX;
            y = 0.32336 * safezoneH + safezoneY;
            w = 0.216772 * safezoneW;
            h = 0.0207407 * safezoneH;
        };

        class TextDescription : lilc_RscStructuredText {
            idc = 1513;
            text = "";
            x = 0.360781 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.273281 * safezoneW;
            h = 0.066 * safezoneH;
        };

        class ButtonButton1 : lilc_RscButtonMenu {
            idc = 1522;
            text = "";
            animTextureNormal = "#(argb,8,8,3)color(0,0,0,0)";
            animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0.3)";
            animTextureOver = "\x\lilc\addons\atm\ui\atm_button_left_hover.paa";
            animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
            animTexturePressed = "\x\lilc\addons\atm\ui\atm_button_left_pressed.paa";
            animTextureDefault = "#(argb,8,8,3)color(0,0,0,0)";
            x = 0.356771 * safezoneW + safezoneX;
            y = 0.430556 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class ButtonButton2 : ButtonButton1 {
            idc = 1523;
            x = 0.35625 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class ButtonButton3 : ButtonButton1 {
            idc = 1524;
            x = 0.355729 * safezoneW + safezoneX;
            y = 0.567593 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class ButtonButton4 : ButtonButton1 {
            idc = 1525;
            x = 0.355573 * safezoneW + safezoneX;
            y = 0.63663 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class ButtonButton5 : ButtonButton1 {
            idc = 1526;
            animTextureOver = "\x\lilc\addons\atm\ui\atm_button_right_hover.paa";
            animTexturePressed = "\x\lilc\addons\atm\ui\atm_button_right_pressed.paa";
            x = 0.537604 * safezoneW + safezoneX;
            y = 0.430296 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class ButtonButton6 : ButtonButton5 {
            idc = 1527;
            x = 0.53802 * safezoneW + safezoneX;
            y = 0.499075 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class ButtonButton7 : ButtonButton5 {
            idc = 1528;
            x = 0.538542 * safezoneW + safezoneX;
            y = 0.567593 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class ButtonButton8 : ButtonButton5 {
            idc = 1529;
            x = 0.539063 * safezoneW + safezoneX;
            y = 0.637037 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.0303333 * safezoneH;
        };

        class FrameFrame : lilc_RscPicture {
            idc = -1;
            text = "\x\lilc\addons\atm\ui\atm_frame.paa";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.115 * safezoneH + safezoneY;
            w = 0.402187 * safezoneW;
            h = 0.726 * safezoneH;
        };

        class EditValue : lilc_RscEdit {
            idc = 1538;
            text = "";
            font = "PuristaMedium";
            shadow = 0;
            colorBackground[] = {0, 0, 0, 0};
            colorText[] = {(23/255), (106/255), (55/255), 1};
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.044 * safezoneH;
        };

        class ListBankAccounts : lilc_RscListbox {
            idc = 1540;
            text = "";
            rowHeight = 0.08;
			sizeEx = 0.034;
            x = 0.366001 * safezoneW + safezoneX;
            y = 0.412019 * safezoneH + safezoneY;
            w = 0.267998 * safezoneW;
            h = 0.197958 * safezoneH;
        };
    };
};

/*class frame: RscPicture
{
    idc = 1200;
    text = "D:\Windows 10 Benutzer\agphe\Documents\GitHub\LiveInLife\images\bankDialog2.paa";
    x = 0.298906 * safezoneW + safezoneX;
    y = 0.115 * safezoneH + safezoneY;
    w = 0.402187 * safezoneW;
    h = 0.726 * safezoneH;
};*/
