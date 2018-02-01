
private _cI = lbCurSel 1501;
if (_cI <= -1) exitWith {
    ["Du musst einen Gegenstand auswählen.", "ERROR"] call lilc_ui_fnc_hint;
};

private _classname = lbData [1501, _cI];
private _classnameCfg = [_classname] call lilc_common_fnc_getClassnameConfig;

private _unit = (findDisplay 2308) setVariable ["lilc_butt_inventory_unit", objNull];
if (isNull _unit) exitWith {};

[_unit, "lilci_plasticBag_F", -1, false, true] call lilc_inventory_fnc_add;
[_unit, _classname, -1, false, true] call lilc_inventory_fnc_add;

private _hideout = (_unit getVariable ["lilc_butt_inventory", []]);
_hideout deleteAt (_hideout find _classname);
_unit setVariable ["lilc_butt_inventory", _hideout, true];

lbDelete [1501, _cI];

private _i = lbAdd [1500, getText(_classnameCfg >> "displayName")];
lbSetData [1500, _i, _classname];
lbSetPicture [1500, _i, getText(_classnameCfg >> "picture")];

["Gegenstand wurde aus dem Hintern genommen."] call lilc_ui_fnc_hint;
