
try {
    if (isNull (findDisplay 1440)) throw false;
    if (isNull lilc_locker_currentContainer) throw false;
    private _lockerName = (lilc_locker_currentContainer getVariable ["lilc_lockerName", ""]);
    private _lockerConfig = ([_lockerName] call lilc_locker_fnc_getLockerConfig);
    if (isNull _lockerConfig) throw false;

    private _currentLockersSize = (lbSize 1441);
    private _lockerStages = getArray(_lockerConfig >> "lockerStages");
    private _price = -1;

    if ((count _lockerStages) <= 0) then {
        _price = getNumber(_lockerConfig >> "lockerPrice");
    } else {
        if (_currentLockersSize < (count _lockerStages)) then {
            _price = (_lockerStages select _currentLockersSize);
        };
    };
    if (_price <= -1) then {
        hint "Du hast die maximale Anzahl an Schließfächern erreict!";
        throw false;
    };

    private _result = nil;
    _result = ([(format["Willst du wirklich ein Schließfach für %1$ erwerben?", _price]), "Schließfach kaufen?", "Ja", "Nein"] call BIS_fnc_guiMessage);
    systemChat str _result;
    
    if (_result) then {
        if !([_price] call lilc_cash_fnc_have) throw false;
        lilc_player_cash = lilc_player_cash - _price;
        [[player, _lockerName], "lils_locker_fnc_create"] call lilc_common_fnc_sendToServer;
        hint "Schließfach erfolgreich gekauft!";
    } else {
        hint "Du hast nicht genügend Geld!";
    };

    closeDialog 1440;
} catch {
    _exception;
};
