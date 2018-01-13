
params [
    ["_shopName", "", [""]],
    ["_classname", "", [""]],
    ["_color", "", [""]]
];
if (_shopName == "") exitWith { nil; };
if (_classname == "") exitWith { nil; };

private _pN = format["lils_economy_tmp_%1", _shopName];
private _hash = (missionNamespace getVariable [_pN, []]);
if ((count _hash) <= 0) exitWith { nil; };

private _v = ([_hash, [_classname, _color]] call CBA_fnc_hashGet);
if ((count _v) != 2) exitWith { nil; };

(_v select 1);
