
class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscDisplayLoading;
class RscPicture;
class RscPictureKeepAspect;
class RscProgress;
class RscStandardDisplay;
class RscStructuredText;
class RscText;
class RscTitles;
class RscVignette;

class RscDisplayLoadMission : RscStandardDisplay {
	idd = 101;
	scriptName = "RscDisplayLoading";
	scriptPath = "Loading";
	onLoad = "[""onLoad"",_this,""RscDisplayLoading"",'Loading'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload = "[""onUnload"",_this,""RscDisplayLoading"",'Loading'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	
	class controlsBackground {
		class Black : RscText {
			colorBackground[] = {0, 0, 0, 1};
			x = "safezoneXAbs";
			y = "safezoneY";
			w = "safezoneWAbs";
			h = "safezoneH";
		};

        class LiveInLifeBackground : RscPicture {
            idc = -1;
            text = "\x\lilc\addons\common\lilc_loadingBackground.paa";
			x = "safezoneXAbs";
			y = "safezoneY";
			w = "safezoneWAbs";
			h = "safezoneH";
        };
		
		class Map : RscPicture {
			idc = 999;
			text = "#(argb,8,8,3)color(0,0,0,1)";
			colorText[] = {1, 1, 1, 0.42};
			x = 0;
			y = 0;
			w = 0;
			h = 0;
		};
		
		class CA_Vignette : RscVignette {
			colorText[] = {0, 0, 0, 1};
		};
		
		class Noise : RscPicture {
			text = "\A3\Ui_f\data\GUI\Cfg\LoadingScreens\LoadingNoise_ca.paa";
			colorText[] = {1, 1, 1, 1};
			x = 0;
			y = 0;
			w = 0;
			h = 0;
		};
		
		class Line : RscPicture {
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			text = "A3\data_f\tracer.paa";
		};

        class FrameBackgroundHeader : RscText {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0.8};
            x = -0.00224208 * safezoneW + safezoneX;
            y = -0.00599999 * safezoneH + safezoneY;
            w = 1.00239 * safezoneW;
            h = 0.0723704 * safezoneH;
        };

        class FrameBackgroundProgressBar : RscText {
            idc = -1;
            colorBackground[] = {0, 0, 0, 1};
            x = -0.000677124 * safezoneW + safezoneX;
            y = 0.0663704 * safezoneH + safezoneY;
            w = 1.00547 * safezoneW;
            h = 0.011 * safezoneH;
        };
	};
	
	class controls {
		class Title {};
		class Name {};
		class Briefing {};
		class Progress {};
		class Progress2 {};
		class Date {};
		
		class MapBackTop : RscText {
			x = 0;
			y = 0;
			w = 0;
			idc = 1000;
			h = 0;
			colorBackground[] = {0, 0, 0, 1};
		};
		
		class MapName : RscText {
            x = 0.00187495 * safezoneW + safezoneX;
            y = 0.00581479 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.033 * safezoneH;
			idc = 1001;
			sizeEx = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class MapAuthor : RscText {
            x = 0.00187497 * safezoneW + safezoneX;
            y = 0.0425185 * safezoneH + safezoneY;
            w = 0.165052 * safezoneW;
            h = 0.0182963 * safezoneH;
			font = "RobotoCondensedLight";
			idc = 1002;
			colorText[] = {1, 1, 1, 0.5};
			sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class MapBackBottom : RscText {
			x = 0;
			y = 0;
			w = 0;
			idc = 1003;
			h = 0;
			colorBackground[] = {0, 0, 0, 0.6};
		};
		
		class MapDescription : RscStructuredText {
			style = 2;
            x = 0;
            y = 0;
            w = 0;
            h = 0;
			class Attributes {
				size = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				align = "center";
			};
			idc = 1102;
			sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};

        class MissionGameType : RscText {
            font = "RobotoCondensedLight";
            idc = 1012;
            x = 0.376771 * safezoneW + safezoneX;
            y = 0.0214444 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.6};
			sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};

        class MissionName : RscText {
            idc = 1006;
            sizeEx = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            x = 0.560365 * safezoneW + safezoneX;
            y = 0.00500001 * safezoneH + safezoneY;
            w = 0.216563 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class MissionAuthor : RscText {
            font = "RobotoCondensedLight";
            idc = 1007;
            x = 0.560365 * safezoneW + safezoneX;
            y = 0.0415926 * safezoneH + safezoneY;
            w = 0.216563 * safezoneW;
            h = 0.0192222 * safezoneH;
            colorText[] = {1, 1, 1, 0.5};
            sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };

        class MissionDescription : RscStructuredText {
            class Attributes {
                size = 0.8;
            };
            idc = 1100;
            x = 0.778437 * safezoneW + safezoneX;
            y = 0.00500001 * safezoneH + safezoneY;
            w = 0.218125 * safezoneW;
            h = 0.0559259 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.6};
        };
		
		class Mission : RscControlsGroupNoScrollbars {
			idc = 2300;
			x = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "37.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "18 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			
			class controls {
				/*class MissionGameType : RscText {
					font = "RobotoCondensedLight";
					idc = 1012;
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "2.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "16 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0.6};
					sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				
				class MissionBackgroundTop : RscText {
					idc = 1005;
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "16 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 1};
				};
				
				class MissionName : RscText {
					idc = 1006;
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "16 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				
				class MissionAuthor : RscText {
					font = "RobotoCondensedLight";
					idc = 1007;
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "4.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "16 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorText[] = {1, 1, 1, 0.5};
					sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				
				class MissionPictureBack : RscText {
					idc = 1010;
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "6.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "16 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0.6};
				};
				
				class MissionPicture : RscPictureKeepAspect {
					idc = 105;
					x = "0.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "6.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "15.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "7.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				
				class MissionDescription : RscStructuredText {
					class Attributes {
						size = 0.8;
					};
					idc = 1100;
                    x = 0.778437 * safezoneW + safezoneX;
                    y = 0.00500001 * safezoneH + safezoneY;
                    w = 0.218125 * safezoneW;
                    h = 0.0559259 * safezoneH;
                    colorBackground[] = {0, 0, 0, 0.6};
				};
				
				class MissionDescriptionEngine : RscText {
					idc = 101;
					x = "16.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "-1.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};*/
				
				class DLCPictureBack : RscText {
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1};
					idc = 3209;
					x = "19 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "6.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "16 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				
				class DLCPicture : RscPicture {
					idc = 3393;
					x = "19.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "6.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "15.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "7.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				
				class DLCDescription : RscStructuredText {
					class Attributes {
						size = 0.8;
					};
					idc = 3296;
					x = "19 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "14.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "16 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0.6};
				};
				
				class DLCName : RscText {
					colorText[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1};
					shadow = 0;
					idc = 3207;
					x = "19 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "6.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "16 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				
				class DLCAuthor : RscText {
					font = "RobotoCondensedLight";
					colorText[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1};
					shadow = 0;
					idc = 3208;
					x = "19 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "7.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "16 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				
				class DLCStripe : RscPicture {
					colorText[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1};
					idc = 3395;
					text = "\A3\Ui_f\data\GUI\Cfg\LoadingScreens\LoadingStripe_ca.paa";
					x = "30.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "6.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "4 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				
				class DLCIcon : RscPicture {
					idc = 3396;
					x = "32.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "6.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
		
		class ProgressMap : RscProgress {
			colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
			texture = "#(argb,8,8,3)color(1,1,1,1)";
            x = -0.000677124 * safezoneW + safezoneX;
            y = 0.0663704 * safezoneH + safezoneY;
            w = 1.00547 * safezoneW;
            h = 0.011 * safezoneH;
            idc = 104;
		};
		
		class ProgressMission : ProgressMap {
			idc = 1013;
            x = -0.000677124 * safezoneW + safezoneX;
            y = 0.0663704 * safezoneH + safezoneY;
            w = 1.00547 * safezoneW;
            h = 0.011 * safezoneH;
        };
		
		class Disclaimer : RscControlsGroupNoScrollbars {
			x = "safezoneX + safezoneW - 19.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			y = "safezoneY + 3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			show = 0;
			idc = 2301;
			w = "18.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			
			class controls {
				class DisclaimerName : RscStructuredText {
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
					idc = 1009;
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "18.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				
				class DisclaimerDescription : RscStructuredText {
					class Attributes {
						size = 0.8;
					};
					shadow = 0;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 0.3};
					colorText[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
					idc = 1101;
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "18.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
		
		class LoadingStart : RscControlsGroup {
			idc = 2310;
			x = "0 * safezoneW + safezoneX";
			y = "0 * safezoneH + safezoneY";
			w = "1 * safezoneW";
			h = "1 * safezoneH";
			
			class controls {
				class Black : RscText {
					idc = 1000;
					x = "0 * safezoneW";
					y = "0 * safezoneH";
					w = "1 * safezoneW";
					h = "1 * safezoneH";
					colorBackground[] = {0, 0, 0, 1};
				};
				
				class Noise : RscPicture {
					idc = 1201;
					text = "\A3\Ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa";
					x = "0 * safezoneW";
					y = "0 * safezoneH";
					w = "1 * safezoneW";
					h = "1 * safezoneH";
				};
				
				class Logo : RscPictureKeepAspect {
					idc = 1200;
					text = "\A3\Ui_f\data\Logos\arma3_splash_ca.paa";
					x = "0.25 * safezoneW";
					y = "0.3125 * safezoneH";
					w = "0.5 * safezoneW";
					h = "0.25 * safezoneH";
					onLoad = "if (isClass (configfile >> 'CfgPatches' >> 'A3_Map_Tanoabuka')) then {(_this select 0) ctrlsettext '\a3\Ui_f\Data\Logos\arma3apex_white_ca.paa';};";
				};
			};
		};
	};
};
