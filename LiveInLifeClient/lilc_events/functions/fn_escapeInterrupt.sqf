
disableSerialization;
while {true} do {
    private ["_uiControl", "_ctrlAbortButton", "_ctrlRespawnButton", "_ctrlContinueButton", "_ctrlManualButton", "_time"];
    waitUntil { (!isNull (findDisplay 49)) };
    
    _uiControl = (findDisplay 49);
    _ctrlAbortButton = _uiControl displayCtrl 104;
    _ctrlRespawnButton = _uiControl displayCtrl 1010;
    _ctrlManualButton = _uiControl displayCtrl 122;
    _ctrlContinueButton = _uiControl displayCtrl 2;

    _ctrlAbortButton ctrlEnable false;
    _ctrlRespawnButton ctrlEnable false;
    _ctrlManualButton ctrlEnable false;
    _ctrlContinueButton ctrlEnable false;

    _time = time + 10;
  	while { (!((_time - time) <= 0)) && (!isNull (findDisplay 49)) } do {
        _ctrlAbortButton ctrlSetText format["Abbrechen in %1", (round (_time - time))];
        _ctrlAbortButton ctrlCommit 0;
        sleep 1;
    };

    if (!isNull (findDisplay 49)) then {
        call lilc_login_fnc_savePlayerData;
        _ctrlAbortButton ctrlSetText "Abbrechen";
        _ctrlAbortButton ctrlCommit 0;
        _ctrlAbortButton ctrlEnable true;
    };

    waitUntil {isNull (findDisplay 49)};
};
