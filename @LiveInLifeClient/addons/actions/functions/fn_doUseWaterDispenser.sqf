/* ----------------------------------------------------------------------------
Function: lilc_actions_fnc_doUseWaterDispenser
Scope: public

Description:
    Actually it just sets the thirst amount of the called player.

Parameters:
    _thirstAmount - The value to be added to the calling player <FLOAT>

Returns:
    true or false whether the nutrition for thirst was changed. <BOOL>

Examples:
    (begin example)
    (end)

Author:
    <username>
---------------------------------------------------------------------------- */

private _thirstAmount = param [0, 0, [0]];

try
{
    if !(call lilc_actions_fnc_canUseWaterDispenser) throw false;
    if (_thirstAmount == 0) throw true;

    [_thirstAmount] call lilc_food_fnc_changeThirst;
    ["Du hast einen Becher Wasser getrunken."] call lilc_ui_fnc_hint;

    throw true;
}
catch
{
    _exception;
};
