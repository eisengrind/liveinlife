
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_chair", ObjNull, [ObjNull]]
];

try {
    private ["_chairIsBusy", "_chairClassname"];
    _chairLocationName = "";
    if (isNull _unit) exitWith { throw [false, _chairLocationName]; };
    if (isNull _chair) exitWith { throw [false, _chairLocationName]; };

    _chairClassname = typeOf _chair;
    if !(isClass (missionConfigFile >> "CfgSeats" >> _chairClassname)) exitWith { throw [false, _chairLocationName]; };
    _chairConfig = (missionConfigFile >> "CfgSeats" >> _chairClassname);
    if ((count _chairConfig) <= 0) exitWith { throw [false, _chairLocationName]; };
    
    {
        if (isNull (_chair getVariable [(configName _x), ObjNull]) || !alive (_chair getVariable [(configName _x), ObjNull])) exitWith { _chairLocationName = (configName _x); };
    } forEach ("true" configClasses _chairConfig);
    if (_chairLocationName == "") exitWith { throw [false, _chairLocationName]; };
    
    if (!isNil "sitting_actionIndex") then { player removeAction lilc_action_actionIndex; lilc_action_actionIndex = nil; };
    lilc_player_lastPosition = [(getPosASL player), (direction player)];
    
    _chairPosition = (getPosASL _chair);
    _chairLocalPosition = getArray (_chairConfig >> _chairLocationName >> "localPosition");
    _chairLocalDirection = getNumber (_chairConfig >> _chairLocationName >> "direction");
    if ((count _chairModifiers) <= 0) exitWith { throw [false, _chairLocationName]; };
    if (isNil "_chairLocalDirection") exitWith { throw [false, _chairLocationName]; };

    {
        _chairPosition set [_forEachIndex, ((_chairPosition select _forEachIndex) + _x)];
    } forEach _chairModifiers;

    _unit setPosASL _chairPosition;
    _unit setDir ((direction _chair) + _chairLocalDirection);

    _animations = getArray (_chairConfig >> _chairLocationName >> "animations");

    lilc_action_actionIndex = (_unit addAction ["<t color='#0099FF'>Aufstehen</t>", { [player, (_this select 3)] call lilc_sitting_fnc_getUp; }, _chair]);
    [_unit, (_animations call BIS_fnc_selectRandom), true] call lilc_common_fnc_switchMove;

    throw [true, _chairLocationName];
} catch {
    private ["_status", "_locationName"];
    _status = _exception select 0;
    _locationName = _exception select 1;

    if (_status) then {
        _chair setVariable [_locationName, _unit, true];
        lilc_action_isSitting = _locationName;
    } else {
        lilc_action_isSitting = "";
        if (_locationName != "") then {
            _chair setVariable [_locationName, ObjNull, true];
        };
    };
};
