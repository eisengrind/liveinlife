
private _shopname = param [0, "", [""]];

try {
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if (isNull player) throw false;
    if (!alive player) throw false;
    if (!isPlayer player) throw false;

    lilc_shops_currentShopname = _shopname;
    private _shopConfig = [];
    if (lilc_shops_currentShopname == "" && _factionID > -1) then {
        private _factionConfig = ([_factionID] call lilc_common_fnc_getFactionConfig);
        _shopConfig = [(_factionConfig select 0), [_factionID]];
    } else {
        _shopConfig = ([lilc_shops_currentShopname] call lilc_shops_fnc_getShopConfig);
    };
    if !(_factionID in (_shopConfig select 1) && (count (_shopConfig select 1)) != 0) throw false;

    [0.5] call lilc_ui_fnc_fadeInBlack;
    sleep 0.5;
    createDialog "lilc_shops_buyUniformsMenu";

    lilc_shops_playerInventory = [player] call lilc_inventory_fnc_getInventory;

    if (isNull (findDisplay 1201)) throw false;
    lilc_shops_escapeIndex = (findDisplay 1201) displayAddEventHandler ["KeyDown", { if ((_this select 1) == 1) then { true; } else { false; }; }];

    showCinemaBorder false;
    lilc_shops_uniformCamera = ("camera" camCreate (player getRelPos [3, 0]));
    lilc_shops_uniformCamera cameraEffect ["internal","back"];

    ["Uniform", 0] call lilc_shops_fnc_setBuyUniformsCamera;

    sleep 0.5;
    [1] call lilc_ui_fnc_fadeOutBlack;
    call lilc_shops_fnc_updateBuyUniformsMenu;
} catch {
    _exception;
};
