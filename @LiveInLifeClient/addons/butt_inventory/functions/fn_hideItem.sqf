
//maxMass = 50 //the maximum item mass to scale the graph (x-axis)
//maxMassPain = 0-1 //everything >= 1 will result in unconsciousness; this is another function parameter to scale the function (y-axis)
//itemMass1 = 5
//itemMass2 = 100
//pain = (maxMassPain/maxMass^2)*mass^2
//TODO: Disable run if something is in this inventory.

private _cI = lbCurSel 1500;
if (_cI <= -1) exitWith {
    ["Du musst einen Gegenstand auswählen.", "ERROR"] call lilc_ui_fnc_hint;
};

private _classname = lbData [1500, _cI];
private _classnameCfg = [_classname] call lilc_common_fnc_getClassnameConfig;

private _unit = (findDisplay 2308) setVariable ["lilc_butt_inventory_unit", objNull];
if (isNull _unit) exitWith {};

private _hideout = (_unit getVariable ["lilc_butt_inventory", []]);
private _hideout_max = (_unit getVariable ["lilc_butt_inventory_maximum", lilc_butt_inventory_maximum]);

if ((count _hideout) > _hideout_max) exitWith {
    ["Du hast nicht genügend Platz in deinem Hintern.", "ERROR"] call lilc_ui_fnc_hint;
};
if (!([_unit, "lilci_plasticBag_F"] call lilc_inventory_fnc_remove)) exitWith {
    ["Du benötigst eine Plastiktüte.", "ERROR"] call lilc_ui_fnc_hint;
};

if (_classname != "lilci_plasticBag_F") then {
    [_unit, _classname] call lilc_inventory_fnc_remove;
};

_hideout pushBack _classname;
_unit setVariable ["lilc_butt_inventory", _hideout, true];

lbDelete [1500, _cI];

private _i = lbAdd [1501, getText(_classnameCfg >> "displayName")];
lbSetData [1501, _i, _classname];
lbSetPicture [1501, _i, getText(_classnameCfg >> "picture")];

["Gegenstand wurde im Hintern versteckt."] call lilc_ui_fnc_hint;
