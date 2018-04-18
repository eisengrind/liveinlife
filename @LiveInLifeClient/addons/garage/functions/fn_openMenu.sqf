
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

    if ((player getVariable ["lilc_factionID", -1]) > -1) then {
        private _rank = [player getVariable ["lilc_factionRankID", 0]] call lilc_factions_interface_fnc_getRank;
        [((_rank select 7) apply {
            [-1, _x, "", "", 1, ""];
        })] call lilc_garage_fnc_setVehicles;
    } else {
        [[player, _garageType], "lils_garage_fnc_getVehicles"] call lilc_common_fnc_sendToServer;
    };

    lbClear 2401;
    {
        if (!isNull _x && isPlayer _x && ([_x] call lilc_common_fnc_isAlive)) then
        {
            private _index = (lbAdd [
                2401,
                (if ([_x] call lilc_login_fnc_unitIsKnown) then { ([_x, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName); } else { "Unbekannte Person"; })
            ]);
            lbSetValue [2401, _index, (_x getVariable ["lilc_accountID", 0])];
        };
    } forEach ((player nearEntities ["Man", 6]) - [player]);
    lbSort [2401, "ASC"];
}
catch
{
    _exception;
};
