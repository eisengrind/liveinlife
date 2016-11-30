
try {
    if (isNull lilc_locker_currentContainer) throw false;
    private _lockerName = (lilc_locker_currentContainer getVariable ["lilc_lockerName", ""]);
    private _lockerConfig = ([_lockerName] call lilc_locker_fnc_getLockerConfig);
    if (isNull _lockerConfig) throw false;

    _result = (["Willst du wirklich ein Schließfach für 100$ erwerben?", "", "Ja", "Nein"] call BIS_fnc_guiMessage);

    if (_result) then {
        [[player, _lockerName], "lils_locker_fnc_create"] call lilc_common_fnc_sendToServer;
        closeDialog 1440;
    };
} catch {
    _exception;
};
