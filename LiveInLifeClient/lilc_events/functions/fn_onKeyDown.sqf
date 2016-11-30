
private ["_uiControl", "_keyCode", "_isShift", "_isCtrl", "_isAlt"];
params [
    ["_uiControl", displayNull, [displayNull]],
    ["_keyCode", -1, [0]],
    ["_isShift", false, [false]],
    ["_isCtrl", false, [false]],
    ["_isAlt", false, [false]]
];
if (isNull _uiControl) exitWith { false; };
if (_keyCode == -1) exitWith { false; };

private _interuptionKeys = [] + (actionKeys "MoveForward") + (actionKeys "MoveBack") + (actionKeys "turnRight") + (actionKeys "turnLeft");
if (_keyCode in _interuptionKeys && lilc_action_active) then {
    lilc_action_interrupted = true;
} else {
    lilc_action_interrupted = false;
};

if (_keyCode in [54, 42]) then {
    _isShift = false;
};

if (_keyCode in [157, 29]) then {
    _isCtrl = false;
};

if (_keyCode == 56) then {
    _isAlt = false;
};

_return = false;
try {
    _profileKeys = profileNamespace getVariable ["lilc_keyBindings", []];
    _profileKeys = _profileKeys + lilc_setting_noAccessKeys;
    
    if (({ ((_x select 1) select 0) == _keyCode } count _profileKeys) <= 0) throw false;

    _isKey = "";
    {
        private _keyInfo = (_x select 1);
        if ((count _keyInfo) == 4) then {
            if ((_keyInfo select 0) == _keyCode && (_keyInfo select 1) == (parseNumber _isShift) && (_keyInfo select 2) == (parseNumber _isCtrl) && (_keyInfo select 3) == (parseNumber _isAlt)) then {
                _isKey = (_x select 0);
            };
        };
        if (_isKey != "") exitWith {};
    } forEach _profileKeys;
    if (_isKey == "") throw false;
    if !(isText(missionConfigFile >> "CfgKeyhandler" >> _isKey >> "action")) throw false;
    private _action = getText(missionConfigFile >> "CfgKeyhandler" >> _isKey >> "action");
    _return = call compile format["%1", _action];
} catch {
    _exception;
};
_return;
