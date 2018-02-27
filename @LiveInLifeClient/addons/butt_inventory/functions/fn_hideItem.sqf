
//maxMass = 50 //the maximum item mass to scale the graph (x-axis)
//maxMassPain = 0-1 //everything >= 1 will result in unconsciousness; this is another function parameter to scale the function (y-axis)
//itemMass1 = 5
//itemMass2 = 100
//pain = (maxMassPain/maxMass^2)*mass^2
//TODO: Disable run if something is in this inventory.

ctrlEnable [1600, false];
private _cI = lbCurSel 1500;
if (_cI <= -1) exitWith {
    ["Du musst einen Gegenstand auswählen.", "ERROR"] call lilc_ui_fnc_hint;
    ctrlEnable [1600, true];
};

private _classname = lbData [1500, _cI];
private _classnameCfg = [_classname] call lilc_common_fnc_getClassnameConfig;

private _unit = (findDisplay 2308) getVariable ["lilc_butt_inventory_unit", objNull];
if (isNull _unit) exitWith { ctrlEnable [1600, true]; };

private _hideout = (_unit getVariable ["lilc_butt_inventory", []]);
private _hideout_max = (_unit getVariable ["lilc_butt_inventory_maximum", lilc_butt_inventory_maximum]);

if ((count _hideout) >= _hideout_max) exitWith {
    ["Du hast nicht genügend Platz in deinem Hintern.", "ERROR"] call lilc_ui_fnc_hint;
    ctrlEnable [1600, true];
};
if (!([_unit, "lilci_plasticBag_F"] call lilc_inventory_fnc_remove)) exitWith {
    ["Du benötigst eine Plastiktüte.", "ERROR"] call lilc_ui_fnc_hint;
    ctrlEnable [1600, true];
};

if (_classname != "lilci_plasticBag_F") then {
    [_unit, _classname] call lilc_inventory_fnc_remove;
};

_hideout pushBack _classname;
_unit setVariable ["lilc_butt_inventory", _hideout, true];

lbClear 1500;
{
    private _cfg = [_x] call lilc_common_fnc_getClassnameConfig;
    private _i = lbAdd [1500, getText(_cfg >> "displayName")];
    lbSetData [1500, _i, _x];
    lbSetPicture [1500, _i, getText(_cfg >> "picture")];
    true;
} count ((items player) + (weapons player) + (magazines player));

lbClear 1501;
{
    private _cfg = [_x] call lilc_common_fnc_getClassnameConfig;
    private _i = lbAdd [1501, getText(_cfg >> "displayName")];
    lbSetData [1501, _i, _x];
    lbSetPicture [1501, _i, getText(_cfg >> "picture")];
    true;
} count _hideout;

ctrlSetText [1004, format["%1 / %2", (count _hideout), (_unit getVariable ["lilc_butt_inventory_maximum", lilc_butt_inventory_maximum])]];

["Gegenstand wurde im Hintern versteckt."] call lilc_ui_fnc_hint;
ctrlEnable [1600, true];
