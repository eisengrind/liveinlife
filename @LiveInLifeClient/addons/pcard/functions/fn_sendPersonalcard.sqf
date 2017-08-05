
params [
    ["_unit", objNull, [objNull]],
    ["_itemData", [], [[]]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if ((count _itemData) != 3) throw false;
    if ((count (_itemData select 2)) != 10) throw false;

    [[_unit, (_itemData select 2)], "lilc_pcard_fnc_showPersonalcard", _unit] call lilc_common_fnc_send;

    closeDialog 1571;
    throw true;
} catch {
    _exception;
};
