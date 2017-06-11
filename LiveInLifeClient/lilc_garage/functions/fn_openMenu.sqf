
private _garageType = param [0, "", [""]];

try
{
    disableSerialization;
    private _ui = (findDisplay 1265);
    if !(isNull _ui) throw false;

    private _garageConfig = ([_garageType] call lilc_garage_fnc_getGarageConfig);
    if (isNull _garageConfig) throw false;

    lilc_garage_currentGarage = _garageType;

    /* insert camera initialization here later... */

    if !(createDialog "lilcm_garage") throw false;
    _ui = (findDisplay 1265);
    private _uiListVehicles = (_ui displayCtrl 1500);
    
    ctrlSetText [1001, getText(_garageConfig >> "displayName")];
    lbClear _uiListVehicles;
    _uiListVehicles lbAdd "Fahrzeuge werden geladen...";
    [[player, _garageType], "lils_garage_fnc_getVehicles"] call lilc_common_fnc_sendToServer;
}
catch
{
    _exception;
};
