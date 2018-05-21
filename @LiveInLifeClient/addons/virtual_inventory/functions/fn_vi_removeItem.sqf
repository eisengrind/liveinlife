
private _cI = (lbCurSel 1407);
if (_cI <= -1) exitWith
{
    ["Du musst einen Gegenstand auswählen.", "ERROR"] call lilc_ui_fnc_hint;
};

private _item = (lbData [1407, _cI]);
if (_item isEqualTo "") exitWith {};

private _item = (call compile _item);
if ((count _item) != 2) exitWith {};

private _itemName = (lbText[1407, _cI]);

if ([player, (_item select 0), (_item select 1)] call lilc_virtual_inventory_fnc_remove) then
{
    [(format["Du hast %1 weggeworfen.", _itemName])] call lilc_ui_fnc_hint;
    call lilc_virtual_inventory_fnc_vi_updateItems;
}
else
{
    ["Dein Gegenstand konnte nicht weggeworfen werden."] call lilc_ui_fnc_hint;
};
