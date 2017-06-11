
disableSerialization;

if (isNil "lilc_finished") exitWith {};
if !(lilc_finished) exitWith {};
if !(isMultiplayer) exitWith {};

waitUntil { (!isNull (findDisplay 49)) };
private _ui = (findDisplay 49);

_ctrlAbortButton = _ui displayCtrl 104;
_ctrlSaveButton = _ui displayCtrl 103;
_ctrlRespawnButton = _ui displayCtrl 1010;
_ctrlManualButton = _ui displayCtrl 122;
_ctrlContinueButton = _ui displayCtrl 2;

_ctrlAbortButton ctrlEnable false;
_ctrlRespawnButton ctrlEnable false;
_ctrlManualButton ctrlEnable false;
_ctrlContinueButton ctrlEnable false;

if (isNil "lilc_events_save_timeout") then { lilc_events_save_timeout = 0; };
_ctrlSaveButton ctrlSetText "Spielstand speichern";
if (lilc_events_save_timeout <= time) then {
    _ctrlSaveButton ctrlSetEventHandler ["ButtonDown", 'ctrlEnable [103, false]; ctrlSetText[103, "Spielstand gespeichert."]; lilc_events_save_timeout = (time + (4 * 60)); [] spawn { call lilc_login_fnc_updatePlayerData; };'];
    _ctrlSaveButton ctrlEnable true;
    _ctrlSaveButton ctrlSetTooltip 'Spielstand speichern.';
} else {
    _ctrlSaveButton ctrlEnable false;
};

for [{_i = 10}, {_i > 0}, {_i = _i - 1}] do {
    if (isNull (findDisplay 49)) exitWith {};
    _ctrlAbortButton ctrlSetText format["Abbrechen in %1", _i];
    sleep 1;
};
if (isNull (findDisplay 49)) exitWith {};

call lilc_login_fnc_updatePlayerData;
_ctrlAbortButton ctrlSetText "Abbrechen";
_ctrlAbortButton ctrlEnable true;
