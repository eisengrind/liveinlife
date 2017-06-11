
params [
    ["_harborName", "", [""]],
    ["_destinationHarbor", "", [""]]
];

try {
    private _ferryConfig = ([_harborName] call lilc_ferrys_fnc_getFerryConfig);
    if (isNull _ferryConfig) throw false;
    if (isNull ([_destinationHarbor] call lilc_ferrys_fnc_getFerryConfig)) throw false;
    if !(call lilc_ferrys_fnc_haveTicket) then {
        hint "Du hast kein Fährticket.";
        throw false;
    };
    if (lilc_ferrys_waitingForFerry) throw false;

    lilc_ferrys_waitingForFerry = true;
    private _ferryDepartures = getArray(_ferryConfig >> "departures");
    private _position = (position player);

    private _date = date;
    private _gameTime = [(_date select 3), (_date select 4)];
    private _departures = [];
    { for [{private _i = 0}, {_i < 2}, {_i = _i + 1}] do { _departures pushBack [((_gameTime select 0) + _i), _x]; }; } forEach _ferryDepartures;

    private _nearestGameTime = [];
    private _smallestDifference = ([_gameTime, (_departures select 0)] call lilc_common_fnc_gameTimeDiff);
    {
        private _currentDifference = ([_gameTime, _x] call lilc_common_fnc_gameTimeDiff);
        if (_currentDifference <= _smallestDifference) then {
            _smallestDifference = _currentDifference;
            _nearestGameTime = _x;
        };
    } forEach _departures;

    [502, "lilc_ferrys_ferryMenu", 0.01, false] call lilc_ui_fnc_fadeInTitles;

    private _ui = (uiNamespace getVariable ["lilc_ferrys_ferryMenu", displayNull]);
    if (isNull _ui) throw false;

    private _uiProgressbar = (_ui displayCtrl 1511);
    private _uiText = (_ui displayCtrl 1512);

    _uiProgressbar progressSetPosition 0;
    _uiText ctrlSetStructuredText parseText format["<t font='PuristaLight' size='1.3' align='center' shadow='2'>Nächste Fähre in %1 Minuten...</t>", (round ([_gameTime, _nearestGameTime] call lilc_common_fnc_gameTimeDiff))];

    while { true } do {
        if !(lilc_ferrys_waitingForFerry) throw false;
        if ((_position distance player) >= 40) then {
            hint "Du bist außerhalb der Reichweite";
            throw false;
        };
        private _currentDate = date;
        _currentDate = [(_currentDate select 3), (_currentDate select 4)];
        if ((_currentDate select 0) >= (_nearestGameTime select 0) && (_currentDate select 1) >= (_nearestGameTime select 1)) exitWith {
            [_harborName, _destinationHarbor] call lilc_ferrys_fnc_enterFerry;
        };
        _uiText ctrlSetStructuredText parseText format["<t font='PuristaLight' size='1.3' align='center' shadow='2'>Nächste Fähre in %1 Minute/n...</t>", (round (60 * ([_currentDate, _nearestGameTime] call lilc_common_fnc_gameTimeDiff)))];
        sleep 1;
    };
} catch {
    if !(_exception) then {
        [502, 0.01] call lilc_ui_fnc_fadeOutTitles;
        lilc_ferrys_waitingForFerry = false;
    };
};
