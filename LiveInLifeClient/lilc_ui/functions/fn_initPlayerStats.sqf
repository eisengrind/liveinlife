disableSerialization;
private ["_currentStats", "_currentOpenTime", "_currentCharisma", "_currentEndurance", "_statsUpdate", "_statsShow"];

_statsUpdate = {
    disableSerialization;

    _uiStats = uiNamespace getVariable "stats";
    _ctrlProgressBar1 = (_uiStats displayCtrl 1043);
    _ctrlProgressBar2 = (_uiStats displayCtrl 1044);
    _ctrlProgressBar3 = (_uiStats displayCtrl 1045);
    _ctrlProgressBar4 = (_uiStats displayCtrl 1046);
    _ctrlProgressBar5 = (_uiStats displayCtrl 1047);
    
    _charisma = lilc_player_charisma / lilc_player_charismaMaximum;
    _ctrlProgressBar1 progressSetPosition _charisma;

    _maxPoints = 1;
    _maxPoints = getNumber(missionConfigFile >> "CfgEndurance" >> "maxPoints");
    _currentPoints = lilc_player_endurance / _maxPoints;
    _ctrlProgressBar2 progressSetPosition _currentPoints;

    _ctrlProgressBar3 ctrlShow false;
    _ctrlProgressBar4 ctrlShow false;
    _ctrlProgressBar5 ctrlShow false;
};

_statsShow = {
    disableSerialization;
    ["stats", 0, 11, false] call lilc_ui_fnc_fadeInTitles;

    _uiStats = uiNamespace getVariable "stats";
    (_uiStats displayCtrl 1049) ctrlSetText "Charisma";
    (_uiStats displayCtrl 1050) ctrlSetText "Ausdauer";
    (_uiStats displayCtrl 1051) ctrlSetText "";
    (_uiStats displayCtrl 1052) ctrlSetText "";
    (_uiStats displayCtrl 1053) ctrlSetText "";
};

_statsTimeout = -1;

while { lilc_tmpVar } do {
    _currentStats = lilc_player_statsEnabled;
    _currentCharisma = lilc_player_charisma;
    _currentEndurance = lilc_player_endurance;
    
    waitUntil { (!(_currentStats isEqualTo lilc_player_statsEnabled) || (_currentCharisma != lilc_player_charisma) || (_currentEndurance != lilc_player_endurance) || ((_statsTimeout - time) <= 0 && _statsTimeout != -1)) };
    
    if ((_statsTimeout - time) <= 0 && _statsTimeout != -1) then {
        if (lilc_player_statsEnabled) then {
            _statsTimeout = -1;
            [2, 11] call lilc_ui_fnc_fadeOutTitles;
            lilc_player_statsEnabled = false;
        };
        _statsTimeout = -1;
    } else {		
        if (lilc_player_statsEnabled) then {
            _statsTimeout = time + lilc_player_statsTimeout;
            call _statsShow;
            call _statsUpdate;
        } else {
            [0, 11] call lilc_ui_fnc_fadeOutTitles;
        };
    };
};
