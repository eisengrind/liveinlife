
class GVAR(loading_screen) {
    idd = IDD_loading_screen;
    movingEnable = 0;
    enableSimulation = 1;
    fadein = 1;
    duration = 999999999999999999999999999;
    fadeout = 1;

    class controlsBackground {
        class LoadingIcon: RscPicture {
            idc = 1200;
            onLoad = QUOTE([ARR_2(QQGVAR(loading_screen),_this)] call FUNC(onLoadingScreenLoad));
            onUnload = QUOTE([ARR_2(QQGVAR(loading_screen),_this)] call FUNC(onLoadingScreenUnload));
            text = PATHTOF(data\ui\loading-edge.paa);
            x = "0.5 - pixelW*64";
            y = "0.5 - pixelH*64";
            w = "pixelW*128";
            h = "pixelH*128";
        };
    };

    class controls {
        class LoadingTitle: GVAR(title_center) {
            idc = 1000;
            text = "loading..."; //--- ToDo: Localize;
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.033 * safezoneH;
            sizeEx = 0.07;
        };
    };
};
