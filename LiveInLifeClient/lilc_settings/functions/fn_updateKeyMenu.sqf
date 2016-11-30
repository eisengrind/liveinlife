
try {
    if !(dialog) throw false;

    disableSerialization;
    _ui = (findDisplay 1330);
    if (isNull _ui) throw false;
    _uiListKeys = _ui displayCtrl 1331;
    lnbClear _uiListKeys;
    _profileKeys = profileNamespace getVariable ["lilc_keyBindings", []];
    {
        private _config = _x;
        if (isText(_config >> "displayName")) then {
            _actionName = configName _x;
            _displayName = getText(_config >> "displayName");
            
            _index = -1;
            {
                if (_actionName == (_x select 0)) exitWith {
                    _index = _forEachIndex;
                };
            } forEach _profileKeys;

            if (_index > -1) then {
                private _key = _profileKeys select _index;
                private _keyInfo = _key select 1;
                _uiListKeys lnbAddRow [_displayName, format["%1%2%3%4",
                    (if ((_keyInfo select 1) == 1) then { "SHIFT + "; } else { ""; }),
                    (if ((_keyInfo select 2) == 1) then { "CTRL + "; } else { ""; }),
                    (if ((_keyInfo select 3) == 1) then { "ALT + "; } else { ""; }),
                    (if ((_keyInfo select 0) > 0) then { (keyName (_keyInfo select 0)); } else { ""; })
                ]];
                _uiListKeys lnbSetData [[_index, 0], _actionName];
            };
        };
    } forEach ("(getNumber(_x >> 'access')) == 1" configClasses (missionConfigFile >> "CfgKeyhandler"));
    
    throw true;
} catch {
    _exception;
};
