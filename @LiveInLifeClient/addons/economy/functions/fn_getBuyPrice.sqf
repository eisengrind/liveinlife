
params [
    ["_shopName", "", [""]],
    ["_classname", "", [""]]
];
if (_shopName == "") exitWith { nil; };
if (_classname == "") exitWith { nil; };

private _pN = format["lils_economy_tmp_%1", _shopName];

private _result = nil;
{
    if (_classname == (_x select 0)) exitWith {
        _result = (_x select 2);
    };
} forEach (missionNamespace getVariable [_pN, []]);

_result;
