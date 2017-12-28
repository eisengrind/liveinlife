
private _cI = (lbCurSel 1407);
if (_cI <= -1) exitWith
{
	["Du musst ein Item auswählen.", "ERROR"] call lilc_ui_fnc_hint;
};

private _item = (lbData [1407, _cI]);
if (_item == "") exitWith {};

_item = (call compile _item);
if ((count _item) != 2) exitWith {};

_cI = (lbCurSel 1408);
if (_cI <= -1) exitWith
{
	["Du musst eine Person ausgewählt haben."] call lilc_ui_fnc_hint;
};

private _unit = (lbData [1408, _cI]);
if (_unit == "") exitWith {};

_unit = (call compile _unit);
if (isNull _unit) exitWith {};

[
	_unit,
	(_item select 0),
	(_item select 1)
] call lilc_virtualInventory_fnc_give;
call lilc_inventory_fnc_vi_updateItems;
call lilc_inventory_fnc_vi_updateUnits;
