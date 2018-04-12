
//Rank = [<id>, <name>, <tag>, <paycheck>, <insignia>];

params [
    ["_rankID", 0, [0]],
    ["_name", "", [""]],
    ["_tag", "", [""]],
    ["_paycheck", -1, [0]],
    ["_insignia", "", [""]]
];

if (_rankID <= 0) exitWith {};

private _rank = ([_rankID] call lilc_factions_interface_fnc_getRank);
if (_rank isEqualTo [_rankID, _name, _tag, _paycheck, _insignia]) exitWith {};

if (_name != (_rank select 1)) then {
    _rank set [1, _name];
};

if (_tag != (_rank select 2)) then {
    _rank set [2, _tag];
};

if (_paycheck != (_rank select 3)) then {
    _rank set [3, _paycheck];
};

if (_insignia != (_rank select 4)) then {
    _rank set [4, _insignia];
};

private _rankVariable = format["lilc_factions_interface_ranks_%1", _rankID];
missionNamespace setVariable [_rankVariable, _rank];
publicVariable _rankVariable;
