
try {
    if !(missionNamespace getVariable ["lilc_login_firstLogin", true]) then
    {
        player hideObjectGlobal true;
        [
            "lilce_login_unload",
            0
        ] call CBA_fnc_localEvent;
        player setVariable ["lilc_login_inMenu", true, true];
    };

    waitUntil { !(call BIS_fnc_isLoading) };
    waitUntil { !dialog };
    ["requesting profiles", "lilc_login"] call lilc_log_fnc_diag_log;
    call lilc_login_fnc_getProfiles;
    waitUntil { (!isNil "lilc_login_profiles"); };

    ["profiles requested", "lilc_login"] call lilc_log_fnc_diag_log;

    showCinemaBorder false;
    camUseNVG false;

    _priority = 400;
    while {
        _ppEffectBlur = ppEffectCreate ["DynamicBlur", _priority];
        _ppEffectBlur < 0
    } do {
        _priority = _priority + 1;
    };

    _ppEffectBlur = ppEffectCreate ["DynamicBlur", 500];
    _ppEffectBlur ppEffectEnable true;
    _ppEffectBlur ppEffectAdjust [2];
    _ppEffectBlur ppEffectCommit 0;
    waitUntil { (ppEffectCommitted _ppEffectBlur) };

    private _camera = [(selectRandom ["loginCamera_1", "loginCamera_2", "loginCamera_3", "loginCamera_4"])] call lilc_common_fnc_createStaticCamera;
    [2] call lilc_ui_fnc_fadeOutBlack;
    ["wait until profile is selected...", "lilc_login"] call lilc_log_fnc_diag_log;

    playMusic "login_music";

    call lilc_login_fnc_openMenu;

    if ((count lilc_login_profiles) <= 0) then
    {
        if (["login_canCreateProfile", "BOOL", true] call lilc_common_fnc_getSetting) then
        {
            ["createProfile"] call lilc_login_fnc_selectMenu;
        }
        else
        {
            diag_log "You are not whitelisted on this server.";
            endMission "END6";
        };
    }
    else
    {
        ["mainMenu"] call lilc_login_fnc_selectMenu;

        if !(missionNamespace getVariable ["lilc_login_firstLogin", true]) then { //TODO: add relogin function
            (((findDisplay 1024) displayCtrl 2300) controlsGroupCtrl 2300) ctrlShow false;
            ctrlShow [1001, false];
        };
    };

    lilc_login_loginSuccessful = nil;
    waitUntil { !isNil "lilc_login_loginSuccessful" };
    [(format["profile selected; result: %1", lilc_login_loginSuccessful]), "lilc_login"] call lilc_log_fnc_diag_log;
    if !(lilc_login_loginSuccessful) throw false;
    lilc_login_loginSuccessful = nil;

    closeDialog 1024;
    [1] call lilc_ui_fnc_fadeInBlack;
    1 fadeMusic 0;
    sleep 1;
    playMusic "";

    _camera cameraEffect ["terminate", "back"];
    camDestroy _camera;
    _ppEffectBlur ppEffectEnable false;
    ppEffectDestroy _ppEffectBlur;

    lilc_login_firstLogin = false;
    player setVariable ["lilc_login_inMenu", false, true];
    throw true;
} catch {
    if !(_exception) then {
        diag_log str "Mission ended because of init!";
        endMission "END6";
    };
};
