
disableSerialization;
private ["_currentCash", "_currentHealth", "_currentStatus", "_ui", "_uiTextMoney", "_uiTextHealth"];

["lilc_playerHUD", 0, 10, false] call lilc_ui_fnc_fadeInTitles;

_currentHealth = (damage player);
_currentCash = lilc_player_cash;
_currentStatus = parseNumber lilc_player_HUDEnabled;

_ui = uiNamespace getVariable ["lilc_playerHUD", displayNull];
_uiTextMoney = _ui displayCtrl 1037;
_uiTextMoney ctrlSetText format["$%1", _currentCash];

_playerHUDUpdate = {
	private ["_health", "_hunger", "_thirst", "_money"];
	
    disableSerialization;
	_ui = uiNamespace getVariable ["lilc_playerHUD", displayNull];
	if (isNull _ui) exitWith {};
	_uiProgressHealth = _ui displayCtrl 1036;
    _uiProgressHunger = _ui displayCtrl 1037;
    _uiProgressThirst = _ui displayCtrl 1038;
	_uiTextMoney = _ui displayCtrl 1039;
	
	_health = (1 - (damage player));
	_cash = lilc_player_cash;

	_uiProgressHealth progressSetPosition _health;
    _uiProgressHunger progressSetPosition (lilc_player_hunger / 100);
    _uiProgressThirst progressSetPosition (lilc_player_thirst / 100);
	
	_cash = [_cash, 3, ""] call lilc_common_fnc_numberToText;
	_uiTextMoney ctrlSetText format["%1 $", _cash];
};

call _playerHUDUpdate;

while {true} do {
    waitUntil { ((((_currentHealth != (damage player)) || (_currentCash != lilc_player_cash) && lilc_player_HUDEnabled) || (_currentStatus != (parseNumber lilc_player_HUDEnabled)))) };

    if (_currentStatus != (parseNumber lilc_player_HUDEnabled)) then {
        if (!lilc_player_HUDEnabled) then {
            [0, 10] call lilc_ui_fnc_fadeOutTitles;
        } else {
            ["lilc_playerHUD", 0, 10, false] call lilc_ui_fnc_fadeInTitles;
            call _playerHUDUpdate;
        };
    };

    if (lilc_player_HUDEnabled) then { call _playerHUDUpdate; };

    _currentHealth = (damage player);
    _currentCash = lilc_player_cash;
    _currentStatus = parseNumber lilc_player_HUDEnabled;
};
