
disableSerialization;
params [
    ["_ui", displayNull, [displayNull]],
    ["_keyCode", -1, [-1]],
    ["_shift", false, [false]],
    ["_ctrl", false, [false]],
    ["_alt", false, [false]]
];

try {
    if !(dialog) throw false;
    if (isNull _ui) throw false;
    if (_keyCode <= -1) throw false;
    
    {
        if (isArray(_x >> "defaultKeyCode")) then {
            private _keyInfo = getArray(_x >> "defaultKeyCode");
            if ((_keyInfo select 0) == _keyCode) throw false;
        };
    } forEach ("getNumber(_x >> 'access') == 0" configClasses (missionConfigFile >> "CfgKeyhandler"));

    if (_keyCode in [54, 42] && _shift) then { _shift = false; };
    if (_keyCode in [157, 29] && _ctrl) then { _ctrl = false; };
    if (_keyCode == 56 && _alt) then { _alt = false; };
    
    if (_keyCode == 1) throw true;
    _uiListKeys = _ui displayCtrl 1331;

    _currentData = _uiListKeys lnbData [(lnbCurSelRow _uiListKeys), 0];
    if (isNil "_currentData") throw false;
    
    _profileKeys = profileNamespace getVariable ["lilc_keyBindings", []];
    if ((count _profileKeys) <= 0) throw false;
    _profileIndex = -1;
    {
        if (_currentData == (_x select 0)) exitWith { _profileIndex = _forEachIndex; };
    } forEach _profileKeys;
    if (_profileIndex <= -1) throw true;

    _profileKeys set [_profileIndex, [_currentData, [_keyCode, parseNumber _shift, parseNumber _ctrl, parseNumber _alt]]];
    profileNamespace setVariable ["lilc_keyBindings", _profileKeys];
    throw true;
} catch {
    if (_exception) then {
        call lilc_settings_fnc_updateKeyMenu;
    };
    
    (_this select 0) displayRemoveEventHandler ["KeyUp", lilc_setting_keyUpIndex];
    _exception;
};
