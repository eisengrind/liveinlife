
if (!call lilc_paycheck_fnc_canEnable) exitWith
{
    ["Du besitzt bereits einen Paycheck", "ERROR"] call lilc_ui_fnc_hint;
};

call lilc_paycheck_fnc_enable;

lilc_paycheck_active = 1;

["Du hast einen Paycheck beantragt."] call lilc_ui_fnc_hint;
