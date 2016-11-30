
private ["_dealerData"];
params [
    ["_itemClassname", "", [""]],
    ["_shopClassname", "", [""]]
];
if (_itemClassname == "") exitWith { []; };
if (_shopClassname == "") exitWith { []; };

_dealerData = [];
{
    private ["_item", "_index"];
    _item = (_x select 0);
    if (_itemClassname == _item) exitWith {
        _index = _forEachIndex;
        {
            if ((_x select 0) == _shopClassname) exitWith {
                _dealerData = [_x, [_index, _forEachIndex]];
            };
        } forEach (lils_economy_data select _forEachIndex);
    };
} forEach lils_economy_data;

_dealerData;
