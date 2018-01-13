
private _cI = (lbCurSel 1502);
if (_cI <= -1) exitWith {};

private _amount = (lbValue [1502, _cI]);
if (_amount <= 0) exitWith {};

private _classname = (lbData [1502, _cI]);
private _cfgItem = ([_classname] call lilc_common_fnc_getClassnameConfig);

_cI = (lbCurSel 2101);
if (_cI <= -1) exitWith {
    ["Du hast kein Inventar ausgewählt.", "ERROR"] call lilc_ui_fnc_hint;
};
private _container = ((lbData [2101, _cI]) call BIS_fnc_objectFromNetId);

if (isNull ([_container, _classname] call lilc_inventory_fnc_canAdd)) exitWith {
    ["Du besitzt nicht genügend Platz in deinem Inventar", "ERROR"] call lilc_ui_fnc_hint;
};

ctrlEnable [1605, false];
[[player, "remove_ware", [lilc_exchange_currentExchange, _classname, _container]], "lils_exchange_fnc_addToQueue"] call lilc_common_fnc_sendToServer;
