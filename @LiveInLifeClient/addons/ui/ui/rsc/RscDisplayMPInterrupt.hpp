
class RscDisplayMPInterrupt {
    onLoad = "['onLoad',_this,'RscDisplayMPInterrupt','GUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); _this call lilc_ui_fnc_onRscDisplayMPInterruptLoad;";
    onUnload = QUOTE([ARR_2('RscDisplayMPInterrupt',_this)] call FUNC(onRscDisplayMPInterruptUnload));
};
