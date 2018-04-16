
[_this] params [
    ["_items", [], [[]]]
];

private _factionConfig = [player getVariable ["lilc_factionID", -1]] call lilc_factions_fnc_getFactionConfig;
if (isNull _factionConfig) exitWith {};

lnbClear 1502;
{
    private _itemConfig = [_x select 0] call lilc_common_fnc_getClassnameConfig;
    private _itemActivated = (_x select 0) in _items;
    private _i = lnbAddRow [1502, [
        "",
        getText(_itemConfig >> "displayName"),
        (if (_itemActivated) then {
            "Ja";
        } else {
            "Nein";
        })
    ]];
    lnbSetData [1502, [_i, 1], _x select 0];
    lnbSetValue [1502, [_i, 2], parseNumber _itemActivated];
    lnbSetPicture [1502, [_i, 0], getText(_itemConfig >> "picture")];
} forEach getArray(_factionConfig >> "defaultEquipment");
