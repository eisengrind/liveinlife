
params [
    ["_butcherName", "", [""]]
];

try
{
    if !([player] call lilc_common_fnc_isAlive) throw false;

    private _butcherConfig = ([_butcherName] call lilc_butcher_fnc_getButcherConfig);
    if (isNull _butcherConfig) throw false;
    if !(createDialog "lilcm_butcher") throw false;

    (findDisplay 1300) setVariable ["lilc_butcher_butcherName", _butcherName];
    ctrlSetText [1001, getText(_butcherConfig >> "displayName")];

    if (getText(_butcherConfig >> "position") == "") throw false;
    private _position = position player;
    if ((_position distance player) > 50) throw false;

    _availableVehicles = ("true" configClasses (_butcherConfig >> "vehicles"));
    private _nearbyVehicles = nearestObjects [_position, ["LandVehicle", "Air", "Boat", "Ship"], 50];

    lbClear 1501;
    {
        private _vehicle = _x;
        private _classname = (typeOf _vehicle);
        diag_log str _classname;
        diag_log str (_availableVehicles apply { configName _x; });
        if (({ (_classname == (configName _x)) } count _availableVehicles) == 1) then {
            private _vehicleConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);
            private _index = (lbAdd [1501, getText(_vehicleConfig >> "displayName")]);
            lbSetData [1501, _index, (_vehicle call BIS_fnc_netID)];
            lbSetPicture [1501, _index, getText(_vehicleConfig >> "picture")];
        };
    } forEach _nearbyVehicles;

    if ((lbSize 1501) <= 0) then
    {
        lbAdd [1501, "Keine Fahrzeuge in der Nähe."];
    };

    throw true;
}
catch
{
    _exception;
};
