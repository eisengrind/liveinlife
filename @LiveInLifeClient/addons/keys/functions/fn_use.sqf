/*
    Date:
        16.10.2016
    Author:
        Vincent Heins
    Description:
        Main Action of using a key on a vehicle.
    Params:
        0 - Vehicle where to use the key - <OBJECT>
    Returns:
        true / false - Returns true if vehicle was opened; otherwise false - <BOOLEAN>
    License:
        @LiveInLifeClient\license.txt
*/

private _vehicle = param [0, ObjNull, [ObjNull]];

try
{
    if (isNull _vehicle) throw false;
    if !(alive _vehicle) throw false;

    private _playerFactionID = (player getVariable ["lilc_factionID", -1]);
    private _vehicleFactionID = (_vehicle getVariable ["lilc_factionID", -1]);
    private _isGlobalKey = false;
    if (_vehicleFactionID > -1 && _playerFactionID == _vehicleFactionID) then
    {
        private _factionConfig = ([_vehicleFactionID] call lilc_factions_fnc_getFactionConfig);
        _isGlobalKey = (
            if (getNumber(_factionConfig >> "globalVehicleLock") == 1) then
            {
                true;
            }
            else
            {
                false;
            }
        );
    };
    if (!([_vehicle] call lilc_keys_fnc_have) && !_isGlobalKey) throw false;

    if ((locked _vehicle) in [2, 3]) then
    {
        [_vehicle, 0] call lilc_vehicles_fnc_lock;
        [(["Fahrzeug aufgeschlossen."] call lilc_common_fnc_localize)] call lilc_ui_fnc_hint;

        [
            "lilce_keys_use_opened",
            [
                _vehicle,
                player,
                _isGlobalKey
            ]
        ] call CBA_fnc_localEvent;
    }
    else
    {
        if ((locked _vehicle) in [0, 1]) then
        {
            [_vehicle, 2] call lilc_vehicles_fnc_lock;
            [(["Fahrzeug abgeschlossen."] call lilc_common_fnc_localize), "ERROR"] call lilc_ui_fnc_hint;

            [
                "lilce_keys_use_closed",
                [
                    _vehicle,
                    player,
                    _isGlobalKey
                ]
            ] call CBA_fnc_localEvent;
        };
    };
    
    throw true;
}
catch
{
    _exception;
};

/*if (["lilc_keys", "soundVehicleOpened"] call lilc_common_fnc_getSetting) then {
    ["lilc_sounds_vehicleLock"] call lilc_sounds_fnc_playSound3D;
};*/

/*if (["lilc_keys", "soundVehicleClosed"] call lilc_common_fnc_getSetting) then {
    ["lilc_sounds_vehicleLock"] call lilc_sounds_fnc_playSound3D;
};*/
