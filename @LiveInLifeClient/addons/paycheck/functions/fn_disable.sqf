
["Du hast deinen Paycheck gekündigt."] call lilc_ui_fnc_hint;
[lilc_paycheck_handle] call CBA_fnc_removePerFrameHandler;
lilc_paycheck_handle = -1;
