
params [
    ["_unit", objNull, [objNull]]
];

if !(createDialog "lilc_progressBar") exitWith {};

disableSerialization;
private _ui = (findDisplay 1320);
private _uiProgressBar = (_ui displayCtrl 1321);
private _uiProgressBarText = (_ui displayCtrl 1322);

private _time = time;
lilc_action_interrupted = false;

[player, ""] call lilc_common_fnc_switchMove;

while {
    (_time + lilc_butt_inventory_openingTime) > time
} do {
    if (lilc_action_interrupted) exitWith {};
    if ((vehicle player) != player) exitWith {};

    private _t = ((time - _time) / lilc_butt_inventory_openingTime);
    _uiProgressBar progressSetPosition _t;
    _uiProgressBarText ctrlSetStructuredText parseText format["Hintern wird geöffnet... (%1%2)", (round (_t * 100)), "%"];
};

[player, ""] call lilc_common_fnc_switchMove;
closeDialog 1320;

if (!createDialog "lilcm_butt_inventory") exitWith {};

(findDisplay 2308) setVariable ["lilc_butt_inventory_unit", _unit];

if (!(_unit isEqualTo player)) then {
    ctrlSetText [1004, format["Items verstecken - %1", ([_unit] call lilc_login_fnc_formatName)]];
};

lbClear 1500;
{
    private _cfg = [_x] call lilc_common_fnc_getClassnameConfig;
    private _i = lbAdd [1500, getText(_cfg >> "displayName")];
    lbSetData [1500, _i, _x];
    lbSetPicture [1500, _i, getText(_cfg >> "picture")];
    true;
} count ((items player) + (weapons player) + (magazines player));

private _hideout = (_unit getVariable ["lilc_butt_inventory", []]);
private _hideout_max = (_unit getVariable ["lilc_butt_inventory_maximum", lilc_butt_inventory_maximum]);
private _hideout_cnt = (count _hideout);

ctrlSetText [1004, format["%1 / %2", _hideout_cnt, _hideout_max]];

lbClear 1501;
{
    private _cfg = [_x] call lilc_common_fnc_getClassnameConfig;
    private _i = lbAdd [1501, getText(_cfg >> "displayName")];
    lbSetData [1501, _i, _x];
    lbSetPicture [1501, _i, getText(_cfg >> "picture")];
    true;
} count _hideout;
