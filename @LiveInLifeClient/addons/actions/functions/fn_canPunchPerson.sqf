/* ----------------------------------------------------------------------------
Function: lilc_actions_fnc_canPunchPerson
Scope: private

Description:
    Checks whether _target can be punched by player or not.

Parameters:
    _target - The unit to be punched <OBJECT>

Returns:
    true or false whether _target can be punched. <OBJECT>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

params [
    ["_target", objNull , [objNull]]
];

(
    !lilc_action_active &&
    !visibleMap &&
    !dialog &&
    (
        (
            (isNull _target || (_target distance player > 2)) &&
            !(player getVariable ["ace_captives_isSurrendering", false]) &&
            !(player getVariable ["ace_captives_isHandcuffed", false]) &&
            !(player getVariable ["ace_isUnconscious", false])
        ) ||
        (
            (_target getVariable ["lilc_actions_isPunchable", true]) &&
            ([_target] call lilc_common_fnc_isAlive) &&
            !(_target getVariable ["ace_isUnconscious", false]) &&
            !(_target getVariable ["ace_captives_isSurrendering", false]) &&
            /*!(_target getVariable ["lilc_actions_isBeaten", false]) &&*/
            !(_target getVariable ["ace_captives_isHandcuffed", false]) &&
            !(player getVariable ["ace_captives_isSurrendering", false]) &&
            !(player getVariable ["ace_captives_isHandcuffed", false]) &&
            !(player getVariable ["ace_isUnconscious", false]) &&
            !(lineIntersects [(eyePos player), (eyePos _target), player, _target]) &&
            !((player getVariable ["ace_dragging_carriedObject", objNull]) isEqualTo _target) &&
            !(surfaceIsWater position player)
        )
    )
);
