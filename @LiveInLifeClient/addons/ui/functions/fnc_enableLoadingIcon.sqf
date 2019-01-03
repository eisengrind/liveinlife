
params [
    ["_speed", 1, [1]],
    ["_background", false, [false]],
    ["_xCoord", -200, [0]],
    ["_yCoord", -200, [0]],
    ["_scale", 0, [0]]
];

try {
    if (_speed <= 0) throw false;
    if (isNil "lilc_ui_loading_handle") then { lilc_ui_loading_handle = scriptNull; };
    if !(isNull lilc_ui_loading_handle) then {
        call lilc_ui_fnc_disableLoadingIcon;
        waitUntil { isNull (uiNamespace getVariable ["lilc_ui_loading", displayNull]) };
    };

    [502, "lilc_ui_loading", 0.01, false] call lilc_ui_fnc_fadeInTitles;
    waitUntil { !isNull (uiNamespace getVariable ["lilc_ui_loading", displayNull]) };

    lilc_ui_loading_handle = ([_speed, _background, _xCoord, _yCoord, _scale] spawn lilc_ui_fnc_loadingLoop);
} catch {
    _exception;
};
