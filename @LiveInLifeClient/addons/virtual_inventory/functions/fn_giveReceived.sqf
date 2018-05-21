
params [
    ["_unit", objNull, [objNull]],
    ["_item", [], [[]]]
];

if (isNull _unit) exitWith {};
if ((count _item) != 3) exitWith {};

[player, (_item select 0), (_item select 1), (_item select 2)] call lilc_virtual_inventory_fnc_add;

[
    (format[
        "Du hast %1 von %2 erhalten.",
        (_item select 1),
        (if ([_unit] call lilc_login_fnc_unitIsKnown) then { ([_unit, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName); } else { "Unbekannte Person"; })
    ])
] call lilc_ui_fnc_hint;
