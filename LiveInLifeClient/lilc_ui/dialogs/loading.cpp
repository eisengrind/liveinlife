
class lilc_ui_loading {
    name = "lilc_ui_loading";
	idd = 1501;
    fadein = 0;
	duration = 999999999999999999999999999;
	fadeout = 0;
	movingEnable = false;
	enableSimulation = true;
    onLoad = "uiNamespace setVariable ['lilc_ui_loading', (_this select 0)]; [] spawn lilc_ui_fnc_loadingLoop;";
    onUnload = "lilc_ui_isLoading = false;";
    
    class Objects {
        class LiveInLifeIcon {
            idc = 1502;
            type = 82;
            model = "\lilc_common\lilc_liveinlifeicon.p3d";
            scale = 1;
            direction[] = {0, 0, 0};
            up[] = {0, 0, 0};

            x = 0.5;
            y = 0.5;
            z = 0;
            
            xBack = 0.5;
            yBack = 0.5;
            zBack = 0.8;

            inBack = 1;
            enableZoom = 1;
            zoomDuration = 0.001;
        };
    };

    /*class controls {
        class PictureLogo : lilc_RscPicture {
            idc = 1502;
            text = "\lilc_ui\icons\loading.paa";
            x = 0.9125 * safezoneW + safezoneX;
            y = 0.852 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.143 * safezoneH;
        };
    };*/
};

