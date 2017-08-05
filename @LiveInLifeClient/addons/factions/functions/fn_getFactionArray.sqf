
params [
    ["_id", -1, [0]]
];

if (_id <= -1) exitWith { []; };

private _result = [];
{
    systemChat str [_id, (_x select 0)];
    if (_id == (_x select 0)) exitWith
    {
        _result = _x;
    };
} forEach lilc_factions_factions;

_result;
