
disableSerialization;
params [
    ["_ui", displayNull, [displayNull]]
];

if (isNil "lilc_finished") exitWith {};
if !(lilc_finished) exitWith {};
if !(isMultiplayer) exitWith {};

//unshow default abort button
private _uiAbBut = (_ui displayCtrl 104);
_uiAbBut ctrlShow false;

//unshow default save button
private _uiSaBut = (_ui displayCtrl 103);
_uiSaBut ctrlShow false;

private _uiAbButN = (_ui ctrlCreate ["RscButtonMenu", 5555]);
_uiAbButN ctrlSetPosition ctrlPosition _uiAbBut;
_uiAbButN ctrlCommit 0;

private _uiSaButN = (_ui ctrlCreate ["RscButtonMenu", 5556]);
_uiSaButN ctrlSetPosition ctrlPosition _uiSaBut;
_uiSaButN ctrlCommit 0;

private _uiReBut = (_ui displayCtrl 1010);
private _uiMaBut = (_ui displayCtrl 122);
private _uiCoBut = (_ui displayCtrl 2);

_uiAbButN ctrlEnable false;
_uiReBut ctrlEnable false;
_uiMaBut ctrlEnable false;
_uiCoBut ctrlEnable false;

private _sT = (missionNamespace getVariable ["lilc_events_save_timeout", 0]);

_uiSaButN ctrlSetText "Spielstand speichern";

if (_sT <= time) then
{
    _uiSaButN ctrlRemoveAllEventHandlers "ButtonDown";
    _uiSaButN ctrlAddEventHandler [
        "ButtonDown",
        {
            disableSerialization;
            private _uiSaButN = ((findDisplay 49) displayCtrl 5556);
            _uiSaButN ctrlEnable false;
            _uiSaButN ctrlSetText "Spielstand gespeichert";
            lilc_events_save_timeout = (time + (4 * 60));
            call lilc_login_fnc_updatePlayerData;
        }
    ];
    _uiSaButN ctrlEnable true;
    _uiSaButN ctrlSetTooltip "Speichere deinen Spielstand ab.";
}
else
{
    _uiSaButN ctrlEnable false;
    _uiSaButN ctrlSetText format[
        "Speichern möglich in %1",
        ([(_sT - time)] call lilc_common_fnc_formatSeconds)
    ];
};

if (isNil "lilc_events_interruptCounterHandler") then
{
    lilc_events_interruptCounterHandler = scriptNull;
};

if !(isNull lilc_events_interruptCounterHandler) then
{
    terminate lilc_events_interruptCounterHandler;
};

lilc_events_interruptCounterHandler = ([_ui] spawn {
    disableSerialization;
    params [
        ["_ui", displayNull, [displayNull]]
    ];

    private _uiAbButN = (_ui displayCtrl 5555);
    _uiAbButN ctrlEnable false;

    private _time = (time + 10);
    while
    {
        _time >= time &&
        !isNull _ui
    }
    do
    {
        _uiAbButN ctrlSetText format[
            "Abbrechen in %1",
            ([(round (_time - time))] call lilc_common_fnc_formatSeconds)
        ];
        sleep 0.05;
    };

    if (isNull _ui) exitWith {};

    call lilc_login_fnc_updatePlayerData;

    _uiAbButN ctrlSetText "Abbrechen";
    _uiAbButN ctrlEnable true;
    _uiAbButN ctrlRemoveAllEventHandlers "ButtonDown";
    _uiAbButN ctrlAddEventHandler [
        "ButtonDown",
        {
            [] spawn lilc_login_fnc_init;
            (findDisplay 49) closeDisplay 1;
        }
    ];
});
