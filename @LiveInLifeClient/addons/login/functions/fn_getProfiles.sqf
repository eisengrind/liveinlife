
try {
    lilc_login_profiles = nil;
    [[player], "lils_login_fnc_getProfiles"] call lilc_common_fnc_sendToServer;
    throw true;
} catch {
    _exception;
};
