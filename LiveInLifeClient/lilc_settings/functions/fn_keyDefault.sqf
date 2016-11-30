
try {
    if !(dialog) throw false;
    _ui = (findDisplay 1330);
    if (isNull _ui) throw false;

    _uiListKeys = _ui displayCtrl 1331;
    _currentIndex = lnbCurSelRow _uiListKeys;
    if (_currentIndex <= -1) throw false;
    _currentData = _uiListKeys lnbData [_currentIndex, 0];
    if (isNil "_currentData") throw false; 

    _profileKeys = profileNamespace getVariable ["lilc_keyBindings", []];
    if ((count _profileKeys) <= 0) throw false;

    _profileIndex = -1;
    {
        if (_currentData == (_x select 0)) then { _profileIndex = _forEachIndex; };
    } forEach _profileKeys;
    if (_profileIndex <= -1) throw false;

    if !(isArray(missionConfigFile >> "CfgKeyhandler" >> _currentData >> "defaultKeyCode")) throw false;
    _profileKeys set [_profileIndex, [_currentData, getArray(missionConfigFile >> "CfgKeyhandler" >> _currentData >> "defaultKeyCode")]];
    profileNamespace setVariable ["lilc_keyBindings", _profileKeys];

    call lilc_settings_fnc_updateKeyMenu;
} catch {
    _exception;
};
