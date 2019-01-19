#include "..\script_component.hpp"

params ["_unit", "_bank", "_bonusUnit"];

private _profileID = _unit getVariable [QEGVAR(profiles,profileID), 0];
private _bonusProfileID = _bonusUnit getVariable [QEGVAR(profiles,profileID), 0];

private _req = [
    _profileID,
    10000,
    1000,
    _bank,
    _bonusProfileID
] call EFUNC(api_banks,createAccountWithBonus);

if REQ_IS_OK(_req) then {
    private _body = REQ_GET_BODY(_req);

    [QGVAR(selectCreateAccountCompletedPage), [[_body, "id"] call a3uf_json_fnc_get], _unit] call CBA_fnc_targetEvent;
} else {
    [QGVAR(selectCreateAccountFailedPage), nil, _unit] call CBA_fnc_targetEvent;
};

DIALOG_ATM_ACTIVE_BUTTONS([]);
