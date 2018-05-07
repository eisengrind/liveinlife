
params [
    ["_ferryFrom", "", [""]]
];

private _cfgFrom = (missionConfigFile >> "CfgFerrys" >> _ferryFrom);
if (isNull _cfgFrom) exitWith {};

private _ferryTo = getText(_cfgFrom >> "ride");
private _cfgTo = (missionConfigFile >> "CfgFerrys" >> _ferryTo);
if (isNull _cfgTo) exitWith {};

if !([getNumber(_cfgFrom >> "ticketPrice")] call lilc_cash_fnc_remove) exitWith {
    ["Du besitzt nicht genügend Bargeld.", "ERROR"] call lilc_ui_fnc_hint;
};

["Du hast ein Ticket gekauft."] call lilc_ui_fnc_hint;

[
    600,
    "lilc_ferryCounter",
    0.01,
    false
] call lilc_ui_fnc_fadeInTitles;

disableSerialization;
private _ui = (uiNamespace getVariable ["lilc_ferryCounter", displayNull]);
private _uiTextTimeCounter = (_ui displayCtrl 1100);
private _startPos = (position player);

private _dT = (time + getNumber(_cfgFrom >> "rideWait"));

while {
    ([player] call lilc_common_fnc_isAlive) &&
    (_startPos distance player < 30) &&
    (_dT >= time)
} do {
    _uiTextTimeCounter ctrlSetStructuredText parseText format[
        "<t font='PuristaMedium'><t size='1.1' align='center'>Waiting for ferry to %1:</t><br /><t align='center' size='3.2'>%2</t></t>",
        getText(_cfgTo >> "displayName"),
        ([(_dT - time), "HH:MM:SS"] call BIS_fnc_secondsToString)
    ];

    sleep 0.1;
};

if ((_startPos distance player) > 30) exitWith {
    [600] call lilc_ui_fnc_fadeOutTitles;
    ["Du hast den Wartebereich verlassen.", "ERROR"] call lilc_ui_fnc_hint;
};

if !([player] call lilc_common_fnc_isAlive) exitWith {
    [600] call lilc_ui_fnc_fadeOutTitles;
};

[2] call lilc_ui_fnc_fadeInBlack;
sleep 1;
[600] call lilc_ui_fnc_fadeOutTitles;
sleep 3.05;

private _pV = (vehicle player);

if (count (_pV getVariable ["SA_Tow_Ropes", []]) > 0) exitWith {
    ["Das Schleppseil deines Fahrzeuges ist an einem anderen Fahrzeug angebracht.", "ERROR"] call lilc_ui_fnc_hint;
};

private _pos =  ([(if (_pV isKindOf "Man") then { getText(_cfgTo >> "position"); } else { getText(_cfgTo >> "positionVehicle"); })] call lilc_common_fnc_getDynamicPosition);

sleep random 2;

if ([_pos select 0, 15, ["Car", "Ship", "Boat", "Tank", "Truck", "Plane", "Air", "Helicopter", "Bicycle"]] call lilc_common_fnc_objectsNearby) exitWith {
    ["Die Ankunftsposition wird derzeit blockiert.", "ERROR"] call lilc_ui_fnc_hint;
};

[_pV, _pos] call lilc_common_fnc_setPosition;

[3] call lilc_ui_fnc_fadeOutBlack;
[(format["Du bist in %1 angekommen.", getText(_cfgTo >> "displayName")])] call lilc_ui_fnc_hint;
