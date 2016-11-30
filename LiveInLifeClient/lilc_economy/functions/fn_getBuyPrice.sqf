
params [
    ["_shopName", "", [""]],
    ["_classname", "", [""]]
];
if (_shopName == "") exitWith { nil; };
if (_classname == "") exitWith { nil; };

_result = nil;
{
    private ["_dealers"];
    if (_classname == (_x select 0)) exitWith {
        _dealers = (_x select 1);
        {
            if ((_x select 0) == _shopName) exitWith {
                _result = (((_x select 2) select 1) select 0);
            };
        } forEach _dealers;
    };
} forEach lilc_economy_data;

_result;
