
if (isNil "lilc_ui_hudRefresh_handle") then { lilc_ui_hudRefresh_handle = scriptNull; };
if !(isNull lilc_ui_hudRefresh_handle) exitWith {};

["lilc_ui_hud", "lilc_playerHUD", 0, false] call lilc_ui_fnc_fadeInTitles;

lilc_ui_hudRefresh_handle = ([] spawn {
    /*
    private _currentHealth = (damage player);
    private _currentCash = lilc_player_cash;
    private _currentHunger = lilc_player_hunger;
    private _currentThirst = lilc_player_thirst;

    disableSerialization;
    private _ui = (uiNamespace getVariable ['lilc_playerHUD', displayNull]);
    if (isNull _ui) exitWith {};

    private _uiPictureBlood = (_ui displayCtrl 1036);
    private _uiPictureHunger = (_ui displayCtrl 1037);
    private _uiPictureThirst = (_ui displayCtrl 1038);
    private _uiTextCash = (_ui displayCtrl 1039);
    private _uiTextOtherCash = (_ui displayCtrl 1040);

    _uiPictureBlood ctrlSetFade _currentHealth;
    _uiPictureBlood ctrlCommit 0.5;
    _uiPictureHunger ctrlSetFade (1 - (_currentHunger / 100));
    _uiPictureHunger ctrlCommit 0.5;
    
    _uiPictureThirst ctrlSetFade (1 - (_currentThirst / 100));
    _uiPictureThirst ctrlCommit 0.5;
    _uiTextCash ctrlSetText format["%1 $", ([_currentCash, 3, " "] call lilc_common_fnc_numberToText)];

    while { true } do {
        waitUntil { (_currentHealth != (damage player)) || (_currentCash != lilc_player_cash) || (_currentHunger != lilc_player_hunger) || (_currentThirst != lilc_player_thirst) };

        _currentHealth = (damage player);
        _currentCash = lilc_player_cash;
        _currentHunger = lilc_player_hunger;
        _currentThirst = lilc_player_thirst;
        
        _uiPictureBlood ctrlSetFade _currentHealth;
        _uiPictureBlood ctrlCommit 0.5;
        _uiPictureHunger ctrlSetFade (1 - (_currentHunger / 100));
        _uiPictureHunger ctrlCommit 0.5;
        _uiPictureThirst ctrlSetFade (1 - (_currentThirst / 100));
        _uiPictureThirst ctrlCommit 0.5;
        _uiTextCash ctrlSetText format["%1 $", ([_currentCash, 3, " "] call lilc_common_fnc_numberToText)];
    };
    */
});
