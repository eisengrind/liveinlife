
if !(call lilc_paycheck_fnc_canDisable) exitWith {};

["Du hast deinen Paycheck gekündigt."] call lilc_ui_fnc_hint;

call lilc_paycheck_fnc_disable;
