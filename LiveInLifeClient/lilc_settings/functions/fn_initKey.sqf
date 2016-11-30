
_profileKeys = profileNamespace getVariable ["lilc_keyBindings", []];

if ((count _profileKeys) <= 0) then {
    {
        if ((getNumber(_x >> "access")) == 1) then {
            if (isArray(_x >> "defaultKeyCode")) then {        
                _profileKeys pushBack [(configName _x), getArray(_x >> "defaultKeyCode")];
            };
        };
    } forEach ("(getNumber(_x >> 'access')) == 1" configClasses (missionConfigFile >> "CfgKeyhandler"));
} else {
    {
        if (isArray(_x >> "defaultKeyCode")) then {
            private _defaultKeyCode = getArray(_x >> "defaultKeyCode");
            private _actionName = configName _x;

            private _isMissing = -1;
            {
                if (_actionName == (_x select 0)) exitWith {
                    _isMissing = _forEachIndex;
                };
            } forEach _profileKeys; //[actionName, keyCode]

            if (_isMissing <= -1) then {
                _profileKeys pushBack [_actionName, _defaultKeyCode];
            };
        };
    } forEach ("(getNumber(_x >> 'access')) == 1" configClasses (missionConfigFile >> "CfgKeyhandler"));
};

lilc_setting_noAccessKeys = [];
{
    lilc_setting_noAccessKeys pushBack [(configName _x), getArray(_x >> "defaultKeyCode")];
} forEach ("getNumber(_x >> 'access') == 0" configClasses (missionConfigFile >> "CfgKeyhandler"));

profileNamespace setVariable ["lilc_keyBindings", _profileKeys];
call lilc_settings_fnc_saveKeyBindings;
