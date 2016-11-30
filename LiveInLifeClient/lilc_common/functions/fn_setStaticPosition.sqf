
private ["_name", "_spawnConfig"];
_name = param [0, "", [""]];
if (_name == "") exitWith { false; };

_spawnConfig = configNull;
_spawnConfig = [_name] call lilc_common_fnc_getStaticPosition;
if ((count _spawnConfig) <= 0) exitWith { false; };

player setPosASL (_spawnConfig select 0);
player setDir (_spawnConfig select 1);
true;
