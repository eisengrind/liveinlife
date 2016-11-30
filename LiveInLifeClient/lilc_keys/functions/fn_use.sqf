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

try {
    private _vehicle = param [0, ObjNull, [ObjNull]];

    if (isNull _vehicle || !(alive _vehicle)) throw false;
    if !([_vehicle] call lilc_keys_fnc_have) throw false;

    if ((locked _vehicle) == 2) then {
        _vehicle lock false;
        hint (["STR_lilc_keys_opened"] call lilc_common_fnc_localize);

        /*if (["lilc_keys", "soundVehicleOpened"] call lilc_common_fnc_getSetting) then {*/
            ["lilc_sounds_vehicleLock"] call lilc_sounds_fnc_playSound3D;
        /*};*/
    } else {
        _vehicle lock true;
        hint (["STR_lilc_keys_closed"] call lilc_common_fnc_localize);
        
        /*if (["lilc_keys", "soundVehicleClosed"] call lilc_common_fnc_getSetting) then {*/
            ["lilc_sounds_vehicleLock"] call lilc_sounds_fnc_playSound3D;
        /*};*/
    };

    throw true;
} catch {

};
