
params [
    ["_unit", objNull, [objNull]],
    ["_itemName", "", [""]],
    ["_data", nil]
];

if (isNull _unit) exitWith {};
if (isNull ([_itemName] call lilc_virtualInventory_fnc_getVirtualItemConfig)) exitWith {};

private _item = ([player, _itemName, _data] call lilc_virtualInventory_fnc_getItem);
if ((count _item) != 3) exitWith {};

[player, _itemName, _data] call lilc_virtualInventory_fnc_remove;

[
    [
        player,
        _item
    ],
    "lilc_virtualInventory_fnc_giveReceived",
    _unit
] call lilc_common_fnc_send;

[
    (format[
        "Du hast %1 %2 gegeben.",
        (if ([_x] call lilc_login_fnc_unitIsKnown) then { ([_x, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName); } else { "Unbekannte Person"; }),
        (_item select 1)
    ])
] call lilc_ui_fnc_hint;
