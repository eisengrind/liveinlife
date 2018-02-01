
private _cI = lbCurSel 1501;
if (_cI <= -1) exitWith {
    ["Du musst einen Gegenstand auswählen.", "ERROR"] call lilc_ui_fnc_hint;
};

private _classname = lbData [1501, _cI];
private _classnameCfg = [_classname] call lilc_common_fnc_getClassnameConfig;

private _unit = (findDisplay 2308) getVariable ["lilc_butt_inventory_unit", objNull];
if (isNull _unit) exitWith {};

[_unit, "lilci_plasticBag_F", -1, false, true] call lilc_inventory_fnc_add;
[_unit, _classname, -1, false, true] call lilc_inventory_fnc_add;

private _hideout = (_unit getVariable ["lilc_butt_inventory", []]);
_hideout deleteAt (_hideout find _classname);
_unit setVariable ["lilc_butt_inventory", _hideout, true];

lbClear 1501;
{
    private _cfg = [_x] call lilc_common_fnc_getClassnameConfig;
    private _i = lbAdd [1501, getText(_cfg >> "displayName")];
    lbSetData [1501, _i, _x];
    lbSetPicture [1501, _i, getText(_cfg >> "picture")];
    true;
} count _hideout;

lbClear 1500;
{
    private _cfg = [_x] call lilc_common_fnc_getClassnameConfig;
    private _i = lbAdd [1500, getText(_cfg >> "displayName")];
    lbSetData [1500, _i, _x];
    lbSetPicture [1500, _i, getText(_cfg >> "picture")];
    true;
} count ((items player) + (weapons player) + (magazines player));

ctrlSetText [1004, format["%1 / %2", (count _hideout), (_unit getVariable ["lilc_butt_inventory_maximum", lilc_butt_inventory_maximum])]];

["Gegenstand wurde aus dem Hintern genommen."] call lilc_ui_fnc_hint;
