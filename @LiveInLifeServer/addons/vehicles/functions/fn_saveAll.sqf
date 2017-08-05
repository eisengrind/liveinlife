
{
    if (!isNull _x && alive _x && isTouchingGround _x) then {
        private _vehicleID = (_x getVariable ["lilc_vehicleID", 0]);
        private _accountID = (_x getVariable ["lilc_accountID", 0]);
        private _steam64ID = (_x getVariable ["lilc_steam64ID", ""]);
        
        if (_vehicleID > 0 && _accountID > 0 && _steam64ID != "") then {
            [_x] call lils_vehicles_fnc_save;
        };
    };
} forEach vehicles;

private _enableVehicleSavingMessage = (["vehicles_enableSaveMessage", "BOOL", false] call lilc_common_fnc_getSetting);
if (_enableVehicleSavingMessage) then
{
    [["[Server] Alle Fahrzeuge gespeichert.", "systemChat"], "lilc_common_fnc_message"] call lilc_common_fnc_sendToPlayers;
};

["Alle Fahrzeuge gespeichert", "lils_vehicles"] call lilc_common_fnc_diag_log;
