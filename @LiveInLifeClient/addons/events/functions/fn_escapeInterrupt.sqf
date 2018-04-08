
disableSerialization;
params [
    ["_ui", displayNull, [displayNull]]
];

if (isNil "lilc_finished") exitWith {};
if !(lilc_finished) exitWith {};
if !(isMultiplayer) exitWith {};

private _uiAbBut = (_ui displayCtrl 104);
private _uiReBut = (_ui displayCtrl 1010);
private _uiMaBut = (_ui displayCtrl 122);
private _uiCoBut = (_ui displayCtrl 2);

_uiAbBut ctrlEnable false;
_uiReBut ctrlEnable false;
_uiMaBut ctrlEnable false;
_uiCoBut ctrlEnable false;

if (isNil "lilc_events_interruptCounterHandler") then {
    lilc_events_interruptCounterHandler = scriptNull;
};

if !(isNull lilc_events_interruptCounterHandler) then {
    terminate lilc_events_interruptCounterHandler;
};

lilc_events_interruptCounterHandler = ([_ui] spawn {
    disableSerialization;
    params [
        ["_ui", displayNull, [displayNull]]
    ];

    private _uiAbBut = (_ui displayCtrl 104);
    private _time = (time + 10);
    while {
        _time >= time &&
        !isNull _ui
    } do {
        _uiAbBut ctrlSetText format[
            "Abbrechen in %1",
            ([(round (_time - time))] call BIS_fnc_secondsToString)
        ];
        sleep 0.05;
    };

    if (isNull _ui) exitWith {};
    [] call lilc_login_fnc_updatePlayerData;

    _uiAbBut ctrlSetText "Abbrechen";
    _uiAbBut ctrlEnable true;
});
