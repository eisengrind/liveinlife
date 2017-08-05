
private _corpse = param [0, objNull, [objNull]];

try
{
    if (isNull _corpse) throw false;
    if !(isPlayer _corpse) throw false;
    
    detach _corpse;
    [_corpse, "lilcas_AinjPpneMstpSnonWrflDnon"] call lilc_common_fnc_switchMove;
    [player, "AmovPercMstpSnonWnonDnon"] call lilc_common_fnc_switchMove;
    
    _corpse setVariable ["lilc_medical_currentTransporteur", objNull, true];
    player removeEventHandler ["Killed", lilc_medical_onPlayerKilledWhileMoveDeadUnitIndex];
    player removeEventHandler ["GetInMan", lilc_medical_onGetInVehicleWhileMoveDeadUnitIndex];
    lilc_medical_currentMovedDeadUnit = objNull;
}
catch
{
    _exception;
};
