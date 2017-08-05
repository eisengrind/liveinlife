
class lilc_phones_groupContactsMenu : lilc_RscControlsGroup
{
    idc = 2302;
    x = 0.445313 * safezoneW + safezoneX;
    y = 0.30837 * safezoneH + safezoneY;
    w = 0.111198 * safezoneW;
    h = 0.148852 * safezoneH;

    class controls
    {
        class GroupListContacts : lilc_RscListbox
        {
            idc = 1217;
            text = "#(argb,8,8,3)color(0,1,1,0.2)";
            x = ((0.452032 * safezoneW + safezoneX) - 0.445313 * safezoneW + safezoneX);
            y = ((0.321815 * safezoneH + safezoneY) - 0.30837 * safezoneH + safezoneY);
            w = 0.0984895 * safezoneW;
            h = 0.109074 * safezoneH;
        };
    };
};

class lilc_phones_groupNumberMenu : lilc_RscControlsGroup
{
    idc = 2303;
    x = 0.445313 * safezoneW + safezoneX;
    y = 0.30837 * safezoneH + safezoneY;
    w = 0.111198 * safezoneW;
    h = 0.148852 * safezoneH;
    
    class controls
    {
        class GroupTextNumber : lilc_RscText
        {
            idc = 1216;
            text = "#(argb,8,8,3)color(1,1,1,0.2)";
            x = ((0.452031 * safezoneW + safezoneX) - 0.445313 * safezoneW + safezoneX);
            y = ((0.322148 * safezoneH + safezoneY) - 0.30837 * safezoneH + safezoneY);
            w = 0.0984894 * safezoneW;
            h = 0.0321852 * safezoneH;
        };
    };
};

class lilc_phones_groupMainMenu : lilc_RscControlsGroup
{
    idc = 2301;
    x = 0.445313 * safezoneW + safezoneX;
    y = 0.30837 * safezoneH + safezoneY;
    w = 0.111198 * safezoneW;
    h = 0.148852 * safezoneH;

    class controls
    {
        class PictureBackground : lilc_RscPicture
        {
            idc = 2403;
            x = ((0.452604 * safezoneW + safezoneX) - (0.445313 * safezoneW + safezoneX));
            y = ((0.322222 * safezoneH + safezoneY) - (0.30837 * safezoneH + safezoneY));
            w = 0.0986458 * safezoneW;
            h = 0.108148 * safezoneH;
        };

        class TextRight : lilc_RscText
        {
            idc = 1214;
            text = "";
            x = ((0.505052 * safezoneW + safezoneX) - (0.445313 * safezoneW + safezoneX));
            y = ((0.434444 * safezoneH + safezoneY) - (0.30837 * safezoneH + safezoneY));
            w = 0.0459375 * safezoneW;
            h = 0.0161111 * safezoneH;
        };

        class TextLeft : lilc_RscText
        {
            idc = 1215;
            text = "";
            x = ((0.452084 * safezoneW + safezoneX) - (0.445313 * safezoneW + safezoneX));
            y = ((0.434259 * safezoneH + safezoneY) - (0.30837 * safezoneH + safezoneY));
            w = 0.0454167 * safezoneW;
            h = 0.0161111 * safezoneH;
        };
    };
};

class lilcm_cellphone
{
    idd = 1302;
    name = "lilcm_cellphone";
    movingEnable = true;
    enableSimulation = true;

    class controlsBackground
    {
        class PictureBackground : lilc_RscPicture
        {
            idc = 1200;
            text = "D:\Users\agphe\Documents\GitHub\private\LiveInLife\LiveInLifeClient\lilc_phones\ui\cellphone\cellphone.paa";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.126 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.759 * safezoneH;
        };
    };

    class controls
    {
        class Button1 : RscActiveText
        {
            idc = 1201;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
            text = "D:\Users\agphe\Documents\GitHub\private\LiveInLife\LiveInLifeClient\lilc_phones\ui\cellphone\button_left.paa";
            x = 0.440156 * safezoneW + safezoneX;
            y = 0.589037 * safezoneH + safezoneY;
            w = 0.0376042 * safezoneW;
            h = 0.0401852 * safezoneH;
        };

        class Button2 : RscActiveText
        {
            idc = 1203;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
            text = "D:\Users\agphe\Documents\GitHub\private\LiveInLife\LiveInLifeClient\lilc_phones\ui\cellphone\button_center.paa";
            x = 0.481406 * safezoneW + safezoneX;
            y = 0.594259 * safezoneH + safezoneY;
            w = 0.0376042 * safezoneW;
            h = 0.0401851 * safezoneH;
        };

        class Button3 : RscActiveText
        {
            idc = 1202;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
            text = "D:\Users\agphe\Documents\GitHub\private\LiveInLife\LiveInLifeClient\lilc_phones\ui\cellphone\button_right.paa";
            x = 0.522708 * safezoneW + safezoneX;
            y = 0.589852 * safezoneH + safezoneY;
            w = 0.0365625 * safezoneW;
            h = 0.0411111 * safezoneH;
        };

        class Button4 : RscActiveText
        {
            idc = 1204;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
            text = "D:\Users\agphe\Documents\GitHub\private\LiveInLife\LiveInLifeClient\lilc_phones\ui\cellphone\button_left.paa";
            x = 0.440105 * safezoneW + safezoneX;
            y = 0.642592 * safezoneH + safezoneY;
            w = 0.0376042 * safezoneW;
            h = 0.0411111 * safezoneH;
        };

        class Button5 : RscActiveText
        {
            idc = 1207;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
            text = "D:\Users\agphe\Documents\GitHub\private\LiveInLife\LiveInLifeClient\lilc_phones\ui\cellphone\button_center.paa";
            x = 0.48125 * safezoneW + safezoneX;
            y = 0.648148 * safezoneH + safezoneY;
            w = 0.0376042 * safezoneW;
            h = 0.0401851 * safezoneH;
        };

        class Button6 : RscActiveText
        {
            idc = 1210;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
            text = "D:\Users\agphe\Documents\GitHub\private\LiveInLife\LiveInLifeClient\lilc_phones\ui\cellphone\button_right.paa";
            x = 0.522917 * safezoneW + safezoneX;
            y = 0.643518 * safezoneH + safezoneY;
            w = 0.0365625 * safezoneW;
            h = 0.0411111 * safezoneH;
        };

        class Button7 : RscActiveText
        {
            idc = 1205;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
            text = "D:\Users\agphe\Documents\GitHub\private\LiveInLife\LiveInLifeClient\lilc_phones\ui\cellphone\button_left.paa";
            x = 0.439584 * safezoneW + safezoneX;
            y = 0.69537 * safezoneH + safezoneY;
            w = 0.0376042 * safezoneW;
            h = 0.0411111 * safezoneH;
        };

        class Button8 : RscActiveText
        {
            idc = 1208;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
            text = "D:\Users\agphe\Documents\GitHub\private\LiveInLife\LiveInLifeClient\lilc_phones\ui\cellphone\button_center.paa";
            x = 0.48125 * safezoneW + safezoneX;
            y = 0.700926 * safezoneH + safezoneY;
            w = 0.0376042 * safezoneW;
            h = 0.0401851 * safezoneH;
        };

        class Button9 : RscActiveText
        {
            idc = 1211;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
            text = "D:\Users\agphe\Documents\GitHub\private\LiveInLife\LiveInLifeClient\lilc_phones\ui\cellphone\button_right.paa";
            x = 0.522917 * safezoneW + safezoneX;
            y = 0.696297 * safezoneH + safezoneY;
            w = 0.0365625 * safezoneW;
            h = 0.0411111 * safezoneH;
        };

        class ButtonStar : RscActiveText
        {
            idc = 1206;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
            text = "D:\Users\agphe\Documents\GitHub\private\LiveInLife\LiveInLifeClient\lilc_phones\ui\cellphone\button_left.paa";
            x = 0.439583 * safezoneW + safezoneX;
            y = 0.749074 * safezoneH + safezoneY;
            w = 0.0376042 * safezoneW;
            h = 0.0411111 * safezoneH;
        };

        class Button0 : RscActiveText
        {
            idc = 1209;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
            text = "D:\Users\agphe\Documents\GitHub\private\LiveInLife\LiveInLifeClient\lilc_phones\ui\cellphone\button_center.paa";
            x = 0.48073 * safezoneW + safezoneX;
            y = 0.75463 * safezoneH + safezoneY;
            w = 0.0376042 * safezoneW;
            h = 0.0401851 * safezoneH;
        };

        class ButtonCross : RscActiveText
        {
            idc = 1212;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
            text = "D:\Users\agphe\Documents\GitHub\private\LiveInLife\LiveInLifeClient\lilc_phones\ui\cellphone\button_right.paa";
            x = 0.522917 * safezoneW + safezoneX;
            y = 0.749074 * safezoneH + safezoneY;
            w = 0.0365625 * safezoneW;
            h = 0.0411111 * safezoneH;
        };

        class ButtonOK : RscActiveText
        {
            idc = 2400;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
            text = "";
            x = 0.476302 * safezoneW + safezoneX;
            y = 0.491778 * safezoneH + safezoneY;
            w = 0.0501041 * safezoneW;
            h = 0.0401851 * safezoneH;
        };

        class ButtonClear : RscActiveText
        {
            idc = 2401;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
            text = "";
            x = 0.439063 * safezoneW + safezoneX;
            y = 0.492592 * safezoneH + safezoneY;
            w = 0.0313541 * safezoneW;
            h = 0.0494444 * safezoneH;
        };

        class ButtonRight : lilc_RscButtonMenu
        {
            idc = 2402;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0)";
            text = "";
            x = 0.538021 * safezoneW + safezoneX;
            y = 0.494444 * safezoneH + safezoneY;
            w = 0.0245833 * safezoneW;
            h = 0.0438888 * safezoneH;
        };

        class ButtonLeft : lilc_RscButtonMenu
        {
            idc = 2403;
			style = 48;
			color[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            colorActive[] = {1, 1, 1, 1};
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0)";
            x = 0.519115 * safezoneW + safezoneX;
            y = 0.530222 * safezoneH + safezoneY;
            w = 0.0245833 * safezoneW;
            h = 0.0438888 * safezoneH;
        };

        class GroupLoadMenu : lilc_RscControlsGroup
        {
            idc = 2300;
            x = 0.445313 * safezoneW + safezoneX;
            y = 0.30837 * safezoneH + safezoneY;
            w = 0.111198 * safezoneW;
            h = 0.148852 * safezoneH;
            
            class controls
            {
                class PictureBackground : lilc_RscPicture
                {
                    idc = 2404;
                    x = ((0.451927 * safezoneW + safezoneX) - (0.445313 * safezoneW + safezoneX));
                    y = ((0.322259 * safezoneH + safezoneY) - (0.30837 * safezoneH + safezoneY));
                    w = 0.0985416 * safezoneW;
                    h = 0.12537 * safezoneH;
                };
            };
        };
    };
};
