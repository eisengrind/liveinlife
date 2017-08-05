
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
    sleep 0.6;
    createDialog "lilcm_shops_clothing";

    lilc_shops_clothing_uniformContent = ([player] call lilc_inventory_fnc_getUniformInventory);
    lilc_shops_clothing_vestContent = ([player] call lilc_inventory_fnc_getVestInventory);
    lilc_shops_clothing_backpackContent = ([player] call lilc_inventory_fnc_getBackpackInventory);

    lilc_shops_clothing_defaultUniform = (uniform player);
    lilc_shops_clothing_defaultVest = (vest player);
    lilc_shops_clothing_defaultBackpack = (backpack player);
    lilc_shops_clothing_defaultHeadgear = (headgear player);
    lilc_shops_clothing_defaultGlasses = (goggles player);

    {
        if !(isNull _x) then {
            clearWeaponCargoGlobal _x;
            clearMagazineCargoGlobal _x;
            clearItemCargoGlobal _x;
        };
    } forEach [(uniformContainer player), (vestContainer player), (backpackContainer player)];

    lilc_shops_clothing_escapeIndex = (findDisplay 1201) displayAddEventHandler ["KeyDown", { if ((_this select 1) == 1) then { true; } else { false; }; }];

    showCinemaBorder false;
    if (isNil "lilc_shops_clothing_camera") then { lilc_shops_clothing_camera = objNull; };
    if (isNull lilc_shops_clothing_camera) then {
        lilc_shops_clothing_camera = "camera" camCreate getPosASL player;
        lilc_shops_clothing_camera cameraEffect ["internal", "back"];
    };
    
    lilc_shops_clothing_lastClassname = "";
    lilc_shops_clothing_defaultPosition = ASLToAGL getPosASL player;
    lilc_shops_clothing_lastPosition = [0, 0, 0];
    lilc_shops_clothing_lastPosition set [2, 1.2];
    lilc_shops_clothing_camera camSetTarget (lilc_shops_clothing_lastPosition vectorAdd lilc_shops_clothing_defaultPosition);
    lilc_shops_clothing_camera camSetRelPos [1, 1, 1];
    lilc_shops_clothing_camera camCommit 0;

    [1] call lilc_ui_fnc_fadeOutBlack;
    call lilc_shops_fnc_updateClothingMenu;

} catch {
    _exception;
};
