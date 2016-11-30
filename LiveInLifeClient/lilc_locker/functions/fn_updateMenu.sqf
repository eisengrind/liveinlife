
try {
    if (isNull (findDisplay 1440)) throw false;
    [[player, _lockerName], "lils_locker_fnc_getLockers"] call lilc_common_fnc_sendToServer;
} catch {
    _exception;
};
