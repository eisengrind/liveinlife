
params [
    ["_target", objNull, [objNull]]
];

if !([_target] call lilc_actions_fnc_canPunchPerson) exitWith {};

lilc_action_active = true;
private _stm = (getStamina player);
if ((_stm - 5) < 0) exitWith {};
player setStamina (_stm - 5);

player playActionNow "ace_gestures_engage";
sleep 0.8;

_target = cursorTarget;
if (isNull _target || !(alive _target) || !(isPlayer _target) || (_target distance player) > 2) exitWith { lilc_action_active = false; };

if ((random 1) < 0.38) then
{
    [_target, true, (random [3, 15, 40])] call ace_medical_fnc_setUnconscious;
    [[player], "lilc_actions_fnc_punched", _target] call lilc_common_fnc_send;
};

lilc_action_active = false;
