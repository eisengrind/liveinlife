
try
{
    private _vehicles = nearestObjects [(position player), ["Car", "Air", "Ship"], 10];
    systemChat str _vehicles;
    if ((count _vehicles) <= 0) throw false;
    
    private _vehicle = (_vehicles select 0);
    if !([_vehicle] call lilc_keys_fnc_have) throw false;
    systemChat str 1;

    if !([_vehicle] call lilc_medical_fnc_canMoveInVehicleDeadUnit) throw false;

    detach lilc_medical_currentMovedDeadUnit;
    lilc_medical_currentMovedDeadUnit action ["getInCargo", _vehicle];

    player removeEventHandler ["Killed", lilc_medical_onPlayerKilledWhileMoveDeadUnitIndex];
    player removeEventHandler ["GetInMan", lilc_medical_onGetInVehicleWhileMoveDeadUnitIndex];

    lilc_medical_currentMovedDeadUnit setVariable ["lilc_medical_currentTransporteur", objNull, true];
    lilc_medical_currentMovedDeadUnit = objNull;

    [player, "AmovPercMstpSlowWpstDnon"] call lilc_common_fnc_switchMove;

    throw true;
}
catch
{
    _exception;
};
