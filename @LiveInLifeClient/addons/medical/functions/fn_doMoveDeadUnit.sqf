
private _corpse = param [0, objNull, [objNull]];

try
{
    if !([_corpse] call lilc_medical_fnc_canMoveDeadUnit) throw false;

    [player, "AcinPercMstpSnonWnonDnon"] call lilc_common_fnc_switchMove;
    [_corpse, "AinjPfalMstpSnonWnonDf_carried_dead"] call lilc_common_fnc_switchMove;

    _corpse setVariable ["lilc_medical_currentTransporteur", player, true];
    _corpse attachTo [player, [0.4, -0.1, -1.25], "LeftShoulder"];

    [[_corpse, 195], "lilc_common_fnc_setDir", _corpse] call lilc_common_fnc_send;
    lilc_medical_currentMovedDeadUnit = _corpse;
    
    if !(isNil "lilc_medical_onGetInVehicleWhileMoveDeadUnitIndex") then
    {
        player removeEventHandler ["GetInMan", lilc_medical_onGetInVehicleWhileMoveDeadUnitIndex];
    };

    if !(isNil "lilc_medical_onPlayerKilledWhileMoveDeadUnitIndex") then
    {
        player removeEventHandler ["Killed", lilc_medical_onPlayerKilledWhileMoveDeadUnitIndex];
    };

    lilc_medical_onPlayerKilledWhileMoveDeadUnitIndex = (player addEventHandler ["Killed", { [lilc_medical_currentMovedDeadUnit] call lilc_medical_fnc_doDetachDeadUnit; }]);
    lilc_medical_onGetInVehicleWhileMoveDeadUnitIndex = (player addEventHandler ["GetInMan", { [lilc_medical_currentMovedDeadUnit] call lilc_medical_fnc_doDetachDeadUnit; }]);

    throw true;
}
catch
{
    _exception;
};
