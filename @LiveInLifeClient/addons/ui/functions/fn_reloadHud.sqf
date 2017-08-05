
disableSerialization;

try {
    private _ui = (uiNamespace getVariable ["lilc_playerHUD", displayNull]);
    if (isNull _ui) throw false;

    private _uiPictureBlood = (_ui displayCtrl 1036);
    private _uiPictureHunger = (_ui displayCtrl 1037);
    private _uiPictureThirst = (_ui displayCtrl 1038);
    private _uiTextCash = (_ui displayCtrl 1039);

    _getColor = {
        private _color = [];
        _color = (switch (true) do {
            case (_this <= 0.1): { [(224/255), (26/255), 0, lilc_ui_hudTransparency]; };
            case (_this <= 0.2): { [(224/255), (63/255), 0, lilc_ui_hudTransparency]; };
            case (_this <= 0.3): { [(224/255), (95/255), 0, lilc_ui_hudTransparency]; };
            case (_this <= 0.4): { [(224/255), (148/255), 0, lilc_ui_hudTransparency]; };
            case (_this <= 0.5): { [(224/255), (179/255), 0, lilc_ui_hudTransparency]; };
            case (_this <= 0.6): { [(224/255), (206/255), 0, lilc_ui_hudTransparency]; };
            case (_this <= 0.7): { [(190/255), (224/255), 0, lilc_ui_hudTransparency]; };
            case (_this <= 0.8): { [(137/255), (224/255), 0, lilc_ui_hudTransparency]; };
            case (_this <= 0.9): { [(95/255), (224/255), 0, lilc_ui_hudTransparency]; };
            case (_this <= 1): { [(47/255), (224/255), 0, lilc_ui_hudTransparency]; };
        });
        _color;
    };

    _uiTextCash ctrlSetText format["%1 $", ([lilc_ui_hudCurrentCash, 3, " "] call lilc_common_fnc_numberToText)];
    private _bloodColor = (1 - (damage player)) call _getColor;
    private _hungerColor = (lilc_player_hunger * 0.01) call _getColor;
    private _thirstColor = (lilc_player_thirst * 0.01) call _getColor;

    if (((damage player) != lilc_ui_hudCurrentHealth) || (lilc_player_hunger != lilc_ui_hudCurrentHunger) || (lilc_player_thirst != lilc_ui_hudCurrentThirst)) then {
        if ((damage player) != lilc_ui_hudCurrentHealth && (damage player) < lilc_ui_hudCurrentHealth) then { _uiPictureBlood ctrlSetTextColor [1, 1, 1, lilc_ui_hudTransparency]; };
        if (lilc_player_hunger != lilc_ui_hudCurrentHunger && lilc_player_hunger < lilc_ui_hudCurrentHunger) then { _uiPictureHunger ctrlSetTextColor [1, 1, 1, lilc_ui_hudTransparency]; };
        if (lilc_player_thirst != lilc_ui_hudCurrentThirst && lilc_player_thirst < lilc_ui_hudCurrentThirst) then { _uiPictureThirst ctrlSetTextColor [1, 1, 1, lilc_ui_hudTransparency]; };
        sleep 0.58;
    };

    _uiPictureBlood ctrlSetTextColor _bloodColor;
    _uiPictureHunger ctrlSetTextColor _hungerColor;
    _uiPictureThirst ctrlSetTextColor _thirstColor;
} catch {
    _exception;
};
