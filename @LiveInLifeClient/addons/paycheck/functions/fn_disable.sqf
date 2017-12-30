
if !(call lilc_paycheck_fnc_canDisable) exitWith {};

["Du hast deinen Paycheck gekündigt."] call lilc_ui_fnc_hint;
[lilc_paycheck_handle] call CBA_fnc_removePerFrameHandler;
lilc_paycheck_handle = -1;
lilc_paycheck_active = 0;
