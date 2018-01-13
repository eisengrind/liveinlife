
params [
    ["_unit", objNull, [objNull]],
    ["_item", [], [[]]]
];

if (isNull _unit) exitWith {};
if ((count _item) != 3) exitWith {};

[_unit, (_item select 0), (_item select 1), (_item select 2)] call lilc_virtualInventory_fnc_add;

[
    (format[
        "Du hast %1 von %2 erhalten.",
        (_item select 1),
        (if ([_x] call lilc_login_fnc_unitIsKnown) then { ([_x, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName); } else { "Unbekannte Person"; })
    ])
] call lilc_ui_fnc_hint;
