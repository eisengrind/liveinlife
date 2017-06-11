
params [
    ["_harborName", "", [""]],
    ["_destinationHarbor", "", [""]]
];

try {
    private _ferryConfig = ([_harborName] call lilc_ferrys_fnc_getFerryConfig);
    if (isNull _ferryConfig) throw false;
    private _destinationConfig = ([_destinationHarbor] call lilc_ferrys_fnc_getFerryConfig);
    if (isNull _destinationConfig) throw false;
    if !(call lilc_ferrys_fnc_haveTicket) then {
        hint "Du hast kein Fährticket.";
        throw false;
    };

    1 fadeSound 0;
    1 fadeMusic 0;
    [1] call lilc_ui_fnc_fadeInBlack;
    disableSerialization;
    private _ui = (uiNamespace getVariable ["lilc_ferrys_ferryMenu", displayNull]);
    if (isNull _ui) then {
        [502, "lilc_ferrys_ferryMenu", 1, false] call lilc_ui_fnc_fadeInTitles;
        _ui = (uiNamespace getVariable ["lilc_ferrys_ferryMenu", displayNull]);
        if (isNull _ui) throw false;
    };

    if ((vehicle player) != player && (driver vehicle player) isEqualTo player) then {
        {
            if !(_x isEqualTo player) then {
                [[_harborName, _destinationHarbor], "lilc_ferrys_fnc_enterFerry", _x] call lilc_common_fnc_send;
            };
        } forEach (crew vehicle player);
    };
    sleep 1;
    call lilc_ui_fnc_disableUserInput;
    if ((vehicle player) != player && (driver vehicle player) isEqualTo player) then {
        if (isEngineOn (vehicle player)) then { (vehicle player) engineOn false; };
    };

    private _startHarborPosition = getArray(_ferryConfig >> "position");
    private _destinationHarborPosition = getArray(_destinationConfig >> "position");
    private _destinationHarborVehiclePosition = getArray(_destinationConfig >> "positionVehicle");
    systemChat str _destinationHarborVehiclePosition;

    player hideObjectGlobal true;

    if ((vehicle player) != player && (driver vehicle player) == player) then {
        (vehicle player) hideObjectGlobal true;
    };

    private _uiProgress = (_ui displayCtrl 1511);
    private _uiText = (_ui displayCtrl 1512);

    private _secondsNeeded = (round ((((_startHarborPosition select 0) distance2D (_destinationHarborPosition select 0)) + (0.66 * ((_startHarborPosition select 0) distance2D (_destinationHarborPosition select 0)))) / (40 / 3.6)));

    _uiProgress progressSetPosition 0;
    _uiText ctrlSetStructuredText parseText "";

    for [{_i = 0}, {_i < _secondsNeeded}, {_i = _i + 1}] do {
        _uiProgress progressSetPosition (_i / _secondsNeeded);
        _uiText ctrlSetStructuredText parseText format["<t font='PuristaLight' size='1.3' align='center' shadow='2'>Die Fähre ist in %1 Minute/n am Zielort...</t>", (round ((_secondsNeeded - _i) / 60))];
        sleep 1;
    };

    if ((vehicle player) != player && (driver vehicle player) == player) then {
        (vehicle player) hideObjectGlobal false;
    };

    if ((vehicle player) != player && (driver vehicle player) == player) then {
        private _generatedPosition = ([(_destinationHarborVehiclePosition select 0), 0, 50, 1, 0, 0, 0, [], [(_destinationHarborVehiclePosition select 0), (_destinationHarborVehiclePosition select 0)]] call BIS_fnc_findSafePos);
        _generatedPosition set [2, 0];
        _generatedPosition = (AGLToASL _generatedPosition);
        [(vehicle player), [
            _generatedPosition,
            (_destinationHarborVehiclePosition select 1)
            ]
        ] call lilc_common_fnc_setPosition;
    } else {
        if ((vehicle player) == player) then {
            [player, _destinationHarborPosition] call lilc_common_fnc_setPosition;
        };
    };

    player hideObjectGlobal false;
    call lilc_ui_fnc_enableUserInput;

    [4] call lilc_ui_fnc_fadeOutBlack;
    [502, 4] call lilc_ui_fnc_fadeOutTitles;
    throw true;
} catch {
    if !(_exception) then {
        [2] call lilc_ui_fnc_fadeOutBlack;
        [502, 2] call lilc_ui_fnc_fadeOutTitles;
    };

    1 fadeSound 1;
    1 fadeMusic 1;
};
