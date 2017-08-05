
try {
    lilc_login_profiles = nil;
    [[player], "lils_login_fnc_getProfiles"] call lilc_common_fnc_sendToServer;

    private _deltaTime = (time + 20);
    waitUntil { !isNil "lilc_login_profiles" || (_deltaTime <= time) };

    if (_deltaTime <= time) throw false;
    
    throw true;
} catch {
    _exception;
};
