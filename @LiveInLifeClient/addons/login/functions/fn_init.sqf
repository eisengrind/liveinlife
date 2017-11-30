
try {
    if (missionNamespace getVariable ["lilc_login_firstLogin", true]) then
    {
        [
            "lilce_login_unload",
            0
        ] call CBA_fnc_localEvent;
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
    };

    lilc_login_loginSuccessful = nil;
    waitUntil { !isNil "lilc_login_loginSuccessful" };
    [(format["profile selected; result: %1", lilc_login_loginSuccessful]), "lilc_login"] call lilc_log_fnc_diag_log;
    if !(lilc_login_loginSuccessful) throw false;
    lilc_login_loginSuccessful = nil;

    closeDialog 1024;
    [1] call lilc_ui_fnc_fadeInBlack;
    sleep 1;

    _camera cameraEffect ["terminate", "back"];
    camDestroy _camera;
    _ppEffectBlur ppEffectEnable false;
    ppEffectDestroy _ppEffectBlur;

    lilc_login_firstLogin = false;
    throw true;
} catch {
    if !(_exception) then {
        diag_log str "Mission ended because of init!";
        endMission "END6";
    };
};
