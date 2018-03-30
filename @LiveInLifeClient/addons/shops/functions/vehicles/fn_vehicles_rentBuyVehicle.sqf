
disableSerialization;
private _ui = (findDisplay 1700);
private _uiListVehicles = (_ui displayCtrl 1500);

private _shopName = (_ui getVariable ["lilc_shopName", ""]);
if (_shopName == "") exitWith {};

private _cI = (lbCurSel _uiListVehicles);
if (_cI <= -1) exitWith {};

private _data = (_uiListVehicles lbData _cI);
if (_data == "") exitWith {};

private _config = (missionConfigFile >> "CfgVehicleShops" >> _shopName >> "vehicles" >> _data);
if (isNull _config) exitWith {};

private _rentPrice = getNumber(_config >> "rentBuyPrice");

if !([_rentPrice] call lilc_cash_fnc_have) exitWith {
    [
        "Du hast nicht genügend Geld.",
        "ERROR"
    ] call lilc_ui_fnc_hint;
};

[
    [player, _shopName, _data],
    "lils_shops_fnc_rentVehicle"
] call lilc_common_fnc_sendToServer;
