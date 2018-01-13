
lilc_locker_lockers = [[], []] call CBA_fnc_hashCreate;
lilc_locker_invClosedIndex = -1;
lilc_locker_invOpenedIndex = -1;

/*[
    "set_lil_locker_lockers",
    {
        {
            [lilc_locker_lockers, (_x select 0), (_x select 1)] call CBA_fnc_hashSet;
        } forEach _this;

        [_x, false] call ace_cargo_fnc_makeLoadable;
        [_vG, false] call ace_cargo_fnc_makeLoadable;
    }
] call lilc_login_fnc_addPackage;*/

[
    "lilce_login_postAccountInit",
    {
        [[player], "lils_locker_fnc_getLockers"] call lilc_common_fnc_sendToServer;
    }
] call CBA_fnc_addEventHandler;

[
    "update_lilc_locker_lockers",
    {
        lilc_locker_lockers;
    }
] call lilc_login_fnc_addPackage;

[
    "lilce_login_unload",
    {
        lilc_locker_lockers = [];
        lilc_locker_lockers = [[], []] call CBA_fnc_hashCreate;
    }
] call CBA_fnc_addEventHandler;
