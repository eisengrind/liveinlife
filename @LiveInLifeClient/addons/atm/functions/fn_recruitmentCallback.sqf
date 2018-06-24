
params [
    ["_status", false, [false]],
    ["_uid", 0, [0]]
];

if (_uid <= 0 && _status) exitWith {};
if (!dialog) exitWith {};

[["playerRecruitPlayer_failed", "playerRecruitPlayer_complete"] select _status] call lilc_atm_fnc_selectMenu;

ctrlEnable [1525, true];
ctrlEnable [1529, true];
ctrlEnable [1540, true];

if (_status) then {
    lilc_atm_recruiter = _uid;
    [["update_lil_atm_recruiter"]] call lilc_login_fnc_updatePlayerDataPartial;
};
