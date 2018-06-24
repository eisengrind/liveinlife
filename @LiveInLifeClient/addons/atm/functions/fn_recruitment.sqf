
ctrlEnable [1525, false];
ctrlEnable [1529, false];
ctrlEnable [1540, false];

private _uid = lbValue [1540, (lbCurSel 1540)];
if (_uid <= 0) exitWith {
    ["playerRecruitPlayer_failed"] call lilc_atm_fnc_selectMenu;
};

[[player, _uid, lilc_atm_currentBankName], "lils_atm_fnc_recruitment"] call lilc_common_fnc_sendToServer;
