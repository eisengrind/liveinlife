#include "..\script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_bankAccountID", 0, [0]],
    ["_value", 0, [0]]
];

private _profileID = _unit getVariable [QEGVAR(profiles,profileID), 0];
if (_profileID <= 0) exitWith { []; };

private _req = [_bankAccountID, _profileID, _value] call EFUNC(api_banks,depositBalance);

if REQ_IS_OK(_req) then {
    _unit setVariable [QEGVAR(cash,balance), (_unit getVariable [QEGVAR(cash,balance), 0]) - _value, true];
    [QGVAR(selectDepositCompletedPage), [_value], _unit] call CBA_fnc_targetEvent;
} else {
    [QGVAR(selectDepositFailedPage), nil, _unit] call CBA_fnc_targetEvent;
};
