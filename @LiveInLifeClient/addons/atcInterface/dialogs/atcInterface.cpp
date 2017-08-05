
class lilc_RscControlsGroup;
class lilc_RscText;
class lilc_RscPicture;
class lilc_RscButtonMenu;

class lilc_RscMapControlGreen
{
	access = 0;
	type = 101;
	idc = 51;
	style = 48;
	colorBackground[] = {0, (8/255), 0, 1};
	colorOutside[] = {0, 0, 0, 1};
	colorText[] = {0, 0, 0, 1};
	font = "RobotoCondensed";
	sizeEx = 0.04;
	colorSea[] = {0, 0, 0, 1};
	colorForest[] = {0, 0, 0, 0};
	colorRocks[] = {0, 0, 0, 0};
	colorCountlines[] = {0, (150/255), (64/255), 1};
	colorMainCountlines[] = {(127/255), (245/255), (90/255), 1};
	colorCountlinesWater[] = {0, 0, 0, 0};
	colorMainCountlinesWater[] = {0, 0, 0, 0};
	colorForestBorder[] = {0, 0, 0, 0};
	colorRocksBorder[] = {0, 0, 0, 0};
	colorPowerLines[] = {0.1,0.1,0.1,1};
	colorRailWay[] = {0, 0, 0, 0};
	colorNames[] = {0.1,0.1,0.1,0.9};
	colorInactive[] = {1,1,1,0.5};
	colorLevels[] = {0.286,0.177,0.094,0.5};
	colorTracks[] = {0.94,0.86,0.85,0.15}; //{0.84,0.76,0.65,0.15};
	colorRoads[] = {0.94,0.86,0.85,0.15}; //{0.7,0.7,0.7,1};
	colorMainRoads[] = {0.94,0.86,0.85,0.15}; //{0.9,0.5,0.3,1};
	colorTracksFill[] = {0.94,0.86,0.85,0.15};
	colorRoadsFill[] = {0.94,0.86,0.85,0.15};
	colorMainRoadsFill[] = {0.94,0.86,0.85,0.15};
	colorGrid[] = {0.8, 0.8, 0.8, 0.1};
	colorGridMap[] = {0.8, 0.8, 0.8, 0.1};
	stickX[] = {0.2,{"Gamma",1,1.5}};
	stickY[] = {0.2,{"Gamma",1,1.5}};
	moveOnEdges = 0;
	x = "SafeZoneXAbs";
	y = "SafeZoneY + 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "SafeZoneWAbs";
	h = "SafeZoneH - 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	shadow = 0;
	ptsPerSquareSea = 5;
	ptsPerSquareTxt = 3;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor = 9;
	ptsPerSquareForEdge = 9;
	ptsPerSquareRoad = 6;
	ptsPerSquareObj = 9;
	showCountourInterval = 0;
	scaleMin = 0.001;
	scaleMax = 1;
	scaleDefault = 0.16;
	maxSatelliteAlpha = 0;
	alphaFadeStartScale = 1;
	alphaFadeEndScale = 1;
	fontLabel = "PuristaMedium";
	sizeExLabel = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontGrid = "TahomaB";
	sizeExGrid = 0.02;
	fontUnits = "TahomaB";
	sizeExUnits = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontNames = "PuristaMedium";
	sizeExNames = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
	fontInfo = "PuristaMedium";
	sizeExInfo = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontLevel = "TahomaB";
	sizeExLevel = 0.02;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	//text = "\a3\ui_f\data\map_background2_co.paa";
	class Legend
	{
		colorBackground[] = {1,1,1,1};
		color[] = {0, 0, 0, 0};
		x = "SafeZoneX + 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		y = "SafeZoneY + safezoneH - 4.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		h = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		font = "RobotoCondensed"; //font = "PuristaMedium";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	};

	class ActiveMarker
	{
		color[] = {0, 0, 0, 0}; //color[] = {0.3,0.1,0.9,1};
		size = 50;
	};

	class Command
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};

	class Task
	{
		colorCreated[] = {1,1,1,1};
		colorCanceled[] = {0.7,0.7,0.7,1};
		colorDone[] = {0.7,1,0.3,1};
		colorFailed[] = {1,0.3,0.2,1};
		color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
		icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};

	class CustomMark
	{
		color[] = {0,0,0,0};
		icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};

	class Tree
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size = 12;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};

	class SmallTree
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size = 12;
		importance = "0.6 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};

	class Bush
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size = "14/2";
		importance = "0.2 * 14 * 0.05 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};

	class Church
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};

	class Chapel
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};

	class Cross
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};

	class Rock
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		size = 12;
		importance = "0.5 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};

	class Bunker
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 14;
		importance = "1.5 * 14 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};

	class Fortress
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};

	class Fountain
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		size = 11;
		importance = "1 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};

	class ViewTower
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};

	class Lighthouse
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};

	class Quay
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};

	class Fuelstation
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};

	class Hospital
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};

	class BusStop
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};

	class Transmitter
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};

	class Stack
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};

	class Ruin
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		size = 16;
		importance = "1.2 * 16 * 0.05";
		coefMin = 1;
		coefMax = 4;
	};

	class Tourism
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.7;
		coefMax = 4;
	};

	class Watertower
	{
		color[] = {0, 0, 0, 0};
		icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};

	class Waypoint
	{
		color[] = {0, 0, 0, 0};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
	};

	class WaypointCompleted
	{
		color[] = {0, 0, 0, 0};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
	};

	class power
	{
		icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {0, 0, 0, 0};
	};

	class powersolar
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {0, 0, 0, 0};
	};

	class powerwave
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {0, 0, 0, 0};
	};

	class powerwind
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {0, 0, 0, 0};
	};
	
	class shipwreck
	{
		icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {0, 0, 0, 0};
	};
};


class lilcm_atcInterface_InfoEntry : lilc_RscControlsGroup
{
	idc = 2300;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.225 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.055 * safezoneH;
    onMouseButtonDown = "_this call lilc_atcInterface_fnc_onMouseButtonDownInfoEntry;";

	class Controls
	{
        class PictureLines : lilc_RscPicture
		{
			idc = -1;
			text = "\x\lilc\addons\atcInterface\textures\lines.paa";
			x = 0.00567711 * safezoneW;
			y = 0.00822222 * safezoneH;
			w = 0.0646875 * safezoneW;
			h = 0.0374074 * safezoneH;
		};
		class TextCallsign : lilc_RscText
		{
			idc = 1007;
			text = "D-23HEAT"; //--- ToDo: Localize;
			x = 0.00515625 * safezoneW;
			y = 0.011 * safezoneH;
			w = 0.0670312 * safezoneW;
			h = 0.011 * safezoneH;
            sizeEx = 0.03;
		};
		class TextHeading : lilc_RscText
		{
			idc = 1008;
			text = "20Â° / N"; //--- ToDo: Localize;
			x = 0.00515625 * safezoneW;
			y = 0.022 * safezoneH;
			w = 0.0670312 * safezoneW;
			h = 0.011 * safezoneH;
            sizeEx = 0.03;
		};
		class TextHeightASL : lilc_RscText
		{
			idc = 1009;
			text = "400 ft"; //--- ToDo: Localize;
			x = 0.00515625 * safezoneW;
			y = 0.033 * safezoneH;
			w = 0.0670312 * safezoneW;
			h = 0.011 * safezoneH;
            sizeEx = 0.03;
		};
		
	};
};

/*
// (findDisplay 1420) ctrlCreate ["GroupDescription", 20000 + _vehicleID];
class lilcm_atcInterface_InfoEntry : lilc_RscControlsGroup
{
    idc = 2300;
    x = 0.29375 * safezoneW + safezoneX;
    y = 0.225 * safezoneH + safezoneY;
    w = 0.0876563 * safezoneW;
    h = 0.044 * safezoneH;
    class Controls
    {
        class TextCode : lilc_RscText
        {
            idc = 1007;
            text = "D-ASDFM0V13";
            x = 0 * safezoneW;
            y = 1.63913e-008 * safezoneH;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = 0.03;
        };
        class TextDeegre : lilc_RscText
        {
            idc = 1008;
            text = "20Â° / NW";
            x = 0 * safezoneW;
            y = 0.011 * safezoneH;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = 0.03;
        };
        class TextAltitude : lilc_RscText
        {
            idc = 1009;
            text = "102m";
            x = 0 * safezoneW;
            y = 0.022 * safezoneH;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = 0.03;
        };
    };
};*/

class lilcm_atcInterface {
    name = "lilcm_atcInterface";
    idd = 1420;
    onUnload = "call lilc_atcInterface_fnc_onUnload;";
	onMouseButtonDown = "_this call lilc_atcInterface_fnc_onMouseButtonDownDisplay;";
    movingEnable = false;
    enableSimulation = true;
    
    class controlsBackground {		
        class MapMap : lilc_RscMapControlGreen
        {
            idc = 1000;
            x = -0.108438 * safezoneW + safezoneX;
            y = -0.138 * safezoneH + safezoneY;
            w = 1.52109 * safezoneW;
            h = 1.584 * safezoneH;
        };
    };
    
    class controls {
		class GroupInformations : lilc_RscControlsGroup
		{
			idc = 2300;
			x = 0.726875 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.176 * safezoneH;
			onMouseButtonDown = "lilc_atcInterface_fnc_onMouseButtonDownGroupInformations;";
			
			class controls
			{
				class TitleCallsign : lilc_RscText
				{
					idc = 1000;
					text = "Flugzeugkennung:"; //--- ToDo: Localize;
					x = 0.00515597 * safezoneW;
					y = 0.011 * safezoneH;
					w = 0.0876563 * safezoneW;
					h = 0.022 * safezoneH;
					sizeEx = 0.031;
				};
				class TitleType : lilc_RscText
				{
					idc = 1001;
					text = "Flugzeugtyp:"; //--- ToDo: Localize;
					x = 0.00515597 * safezoneW;
					y = 0.033 * safezoneH;
					w = 0.0876563 * safezoneW;
					h = 0.022 * safezoneH;
					sizeEx = 0.031;
				};
				class TitleHeading : lilc_RscText
				{
					idc = 1002;
					text = "Richtung:"; //--- ToDo: Localize;
					x = 0.00515597 * safezoneW;
					y = 0.055 * safezoneH;
					w = 0.0876563 * safezoneW;
					h = 0.022 * safezoneH;
					sizeEx = 0.031;
				};
				class TitleTransponder : lilc_RscText
				{
					idc = 1003;
					text = "Transpondercode:"; //--- ToDo: Localize;
					x = 0.00515597 * safezoneW;
					y = 0.0770001 * safezoneH;
					w = 0.0876563 * safezoneW;
					h = 0.022 * safezoneH;
					sizeEx = 0.031;
				};
				class TitleHeightASL : lilc_RscText
				{
					idc = 1005;
					text = "HÃ¶he (ASL/ft):"; //--- ToDo: Localize;
					x = 0.00515597 * safezoneW;
					y = 0.099 * safezoneH;
					w = 0.0876563 * safezoneW;
					h = 0.022 * safezoneH;
					sizeEx = 0.031;
				};
				class TitleHeightATL : lilc_RscText
				{
					idc = 1004;
					text = "HÃ¶he (ATL/m):"; //--- ToDo: Localize;
					x = 0.00515597 * safezoneW;
					y = 0.121 * safezoneH;
					w = 0.0876563 * safezoneW;
					h = 0.022 * safezoneH;
					sizeEx = 0.031;
				};
				class TextCallsign : lilc_RscText
				{
					idc = 1006;
					text = "T-D234HD"; //--- ToDo: Localize;
					x = 0.092812 * safezoneW;
					y = 0.011 * safezoneH;
					w = 0.154687 * safezoneW;
					h = 0.022 * safezoneH;
					sizeEx = 0.031;
				};
				class TextType : lilc_RscText
				{
					idc = 1007;
					text = "Antonov 2"; //--- ToDo: Localize;
					x = 0.092812 * safezoneW;
					y = 0.033 * safezoneH;
					w = 0.154687 * safezoneW;
					h = 0.022 * safezoneH;
					sizeEx = 0.031;
				};
				class TextHeading : lilc_RscText
				{
					idc = 1008;
					text = "0Â° / N"; //--- ToDo: Localize;
					x = 0.092812 * safezoneW;
					y = 0.055 * safezoneH;
					w = 0.154687 * safezoneW;
					h = 0.022 * safezoneH;
					sizeEx = 0.031;
				};
				class TextTransponder : lilc_RscText
				{
					idc = 1009;
					text = "7500 (Kidnapping)"; //--- ToDo: Localize;
					x = 0.092812 * safezoneW;
					y = 0.0770001 * safezoneH;
					w = 0.154687 * safezoneW;
					h = 0.022 * safezoneH;
					sizeEx = 0.031;
				};
				class TextHeightASL : lilc_RscText
				{
					idc = 1010;
					text = "100 ft"; //--- ToDo: Localize;
					x = 0.092812 * safezoneW;
					y = 0.099 * safezoneH;
					w = 0.154687 * safezoneW;
					h = 0.022 * safezoneH;
					sizeEx = 0.031;
				};
				class TextHeightATL : lilc_RscText
				{
					idc = 1011;
					text = "98 m"; //--- ToDo: Localize;
					x = 0.092812 * safezoneW;
					y = 0.121 * safezoneH;
					w = 0.154687 * safezoneW;
					h = 0.022 * safezoneH;
					sizeEx = 0.031;
				};
				class TextFrequency : lilc_RscText
				{
					idc = 1012;
					text = "33 Hz"; //--- ToDo: Localize;
					x = 0.0928125 * safezoneW;
					y = 0.143 * safezoneH;
					w = 0.154687 * safezoneW;
					h = 0.022 * safezoneH;
					sizeEx = 0.031;
				};
				class TitleFrequency : lilc_RscText
				{
					idc = 1013;
					text = "Funkfrequenz:"; //--- ToDo: Localize;
					x = 0.00515622 * safezoneW;
					y = 0.143 * safezoneH;
					w = 0.0876563 * safezoneW;
					h = 0.022 * safezoneH;
					sizeEx = 0.031;
				};
			};
		};
		
        class ButtonClose : lilc_RscButtonMenu
        {
            idc = 2400;
            text = "Escape"; //--- ToDo: Localize;
            onButtonClick = "closeDialog 1420;";
            x = 0.969687 * safezoneW + safezoneX;
            y = 0.017037 * safezoneH + safezoneY;
            w = 0.020625 * safezoneW;
            h = 0.033 * safezoneH;
        };
    };
};
