
[
    "lilce_common_preFinished",
    {
        private _factionID = (player getVariable ["lilc_factionID", -1]);
        private _wT = (player getVariable ["lilc_prison_waitingTime", 0]);
        if (_factionID <= -1) then
        {
            if (_wT > -3) then
            {
                [
                    (player getVariable ["lilc_prison_currentPunishment", ""]),
                    _wT,
                    (player getVariable ["lilc_prison_escapeTime", 0])
                ] call lilc_prison_fnc_punished;
            };
        };
    }
] call CBA_fnc_addEventHandler;

[
    "set_lil_prison_waitingTime",
    {
        player setVariable ["lilc_prison_waitingTime", _this, true];
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_prison_escapeTime",
    {
        player setVariable ["lilc_prison_escapeTime", _this, true];
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_prison_cPment",
    {
        player setVariable ["lilc_prison_currentPunishment", _this, true];
    }
] call lilc_login_fnc_addPackage;

lilc_login_update_defPackages append [
    "update_lil_prison_waitingTime",
    "update_lil_prison_escapeTime",
    "update_lil_prison_currentPMent"
];

[
    "update_lil_prison_waitingTime",
    {
        (player getVariable ["lilc_prison_waitingTime", 0]);
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_prison_escapeTime",
    {
        (player getVariable ["lilc_prison_escapeTime", 0]);
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_prison_currentPMent",
    {
        (player getVariable ["lilc_prison_currentPunishment", ""]);
    }
] call lilc_login_fnc_addPackage;


