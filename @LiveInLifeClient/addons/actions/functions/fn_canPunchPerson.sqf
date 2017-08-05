
params [
    ["_target", objNull , [objNull]]
];

if (dialog) exitWith { false; };
if (isNull _target) exitWith { true; };
if (_target distance player > 2) exitWith { true; };

(
    !lilc_action_active &&
    !visibleMap &&
    (_target getVariable ["lilc_actions_isPunchable", true]) &&
    ([_target] call lilc_common_fnc_isAlive) &&
    !(_target getVariable ["ACE_isUnconscious", false]) &&
    !(_target getVariable ["ACE_captives_isSurrendering", false]) &&
    !(_target getVariable ["lilc_actions_isBeaten", false]) &&
    !(_target getVariable ["ACE_captives_isHandcuffed", false])
);
