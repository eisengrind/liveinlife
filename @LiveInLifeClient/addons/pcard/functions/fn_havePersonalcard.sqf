
params [
    ["_unit", player, [objNull]]
];

try
{
    if (isNull _unit) throw false;
    if ([_unit, "lilcvi_personalcard_F"] call lilc_virtualInventory_fnc_itemInInventory) throw true;

    throw false;
}
catch
{
    _exception;
};
