
params [
    ["_target", objNull, [objNull]]
];

if (isNull _target) exitWith { false; };
if !(alive _target) exitWith { false; };
if !(isPlayer _target) exitWith { false; };
if (_target isEqualTo player) exitWith { false; };

(
    (_target getVariable ["ACE_isUnconscious", false]) ||
    (_target getVariable ["ACE_captives_isSurrendering", false]) ||
    (_target getVariable ["lilc_actions_isBeaten", false]) ||
    (_target getVariable ["ACE_captives_isHandcuffed", false]) ||
    (_target getVariable ["lilc_isDead", false])
);
