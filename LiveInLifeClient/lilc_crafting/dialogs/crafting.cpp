
class lilc_craftingMenu {
    name = "lilc_craftingMenu";
    idd = 1310;
    movingEnable = false;
    enableSimulation = true;
    
    class controlsBackground {
        class FrameBackground : lilc_RscPicture {
            idc = -1;
			text = "\lilc_crafting\ui\crafting_background_default.paa";
            colorBackground[] = {0, 0, 0, 0};
            x = 0.0125;
			y = -0.16;
			w = 0.975;
			h = 1.32;
        };
    };
    
    class controls {
        class ListBlueprintsList : lilc_RscListbox {
            idc = 1311;
            text = "";
			rowHeight = 0.095;
			sizeEx = 0.04;
			font = "PuristaMedium";
			onLBSelChanged = "call lilc_crafting_fnc_updateMenu;";
			colorBackground[] = {0, 0, 0, 0};
            x = 0.046717;
			y = 0.19697;
			w = 0.318434;
			h = 0.72963;
        };

        class ListNeededList : lilc_RscListNBox {
            idc = 1312;
            text = "";
			rowHeight = 0.065;
			sizeEx = 0.034;
			drawSideArrows = 0;
			font = "PuristaLight";
			idcLeft = -1;
			idcRight = -1;
            x = 0.382576;
			y = 0.417508;
			w = 0.579798;
			h = 0.416498;
			colorSelect[] = {1,1,1,1};
			colorSelect2[] = {1,1,1,1};
			colorSelectBackground[] = {0,0,0,0};
			colorSelectBackground2[] = {0,0,0,0};
        }
		
		class TextCurrentBlueprint : lilc_RscText {
			idc = 1313;
			font = "PuristaLight";
			text = "Kein Bauplan ausgewählt!";
			shadow = 0;
			sizeEx = 0.065;
			x = 0.5405;
			y = 0.126;
			w = 0.42323;
			h = 0.0898992;
		};

        class TextBlueprintDescription : lilc_RscText {
            idc = 1314;
			style = 16;
            text = "-";
			font = "PuristaLight";
			sizeEx = 0.032;
			shadow = 0;
            x = 0.40275;
			y = 0.2456;
			w = 0.560857;
			h = 0.113468;
        };

        class ButtonCraft : lilc_RscButtonMenu {
            idc = 1315;
            text = "";
            x = 0.680555;
			y = 0.855219;
			w = 0.283081;
			h = 0.0713805;
			onButtonClick = "[] spawn lilc_crafting_fnc_craft;";
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0.5)";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.2)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0.4)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0)";
        };
		
		class EditAmount : lilc_RscEdit {
			idc = 1316;
			text = "";
			font = "PuristaLight";
			x = 0.472475;
			y = 0.863165;
			w = 0.20101;
			h = 0.0562291;
			onKeyUp = "_this call lilc_crafting_fnc_onCharEdit;";
			shadow = 0;
			colorBackground[] = {(8/255),(61/255),(116/255),0.8};
			colorText[] = {1,1,1,1};
			colorSelection[] = {1,1,1,0.25};
		};

        class TextTitleType : lilc_RscTitle {
            idc = 1317;
			style = 0x01;
            text = "Spieler";
			font = "PuristaSemibold";
			shadow = 0;
			sizeEx = 0.04;
            x = 0.5505;
			y = 0.0492;
			w = 0.42702;
			h = 0.0562288;
        };
    };
};
