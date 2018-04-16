
[
    "Live In Life",
    "lilck_openFactionDashboard",
    "Open faction dashboard",{
        call lilc_factions_interface_fnc_openOverview;
    },
    {},
    [62, [false, false, false]]
] call CBA_fnc_addKeybind;

["lilce_login_postAccountInit" ,{
    [[player], "lils_factions_interface_fnc_setPlayerRank"] call lilc_common_fnc_sendToServer;
}] call CBA_fnc_addEventHandler;
