
disableSerialization;
try {
    if (lilc_action_active) throw false;
    lilc_action_active = true;
    if !(dialog) throw false;
    private _ui = (findDisplay 1310);
    if (isNull _ui) throw false;
    
    private _uiButtonCraft = _ui displayCtrl 1315;
    private _uiBlueprintList = _ui displayCtrl 1311;

    _uiButtonCraft ctrlEnable false;
    private _listBlueprintSelection = lbCurSel _uiBlueprintList;
    if (_listBlueprintSelection <= -1) throw false;

    _recipe = _uiBlueprintList lbData _listBlueprintSelection;
    if (isNil "_recipe") throw false;
    _recipeName = getText(missionConfigFile >> "CfgRecipes" >> lilc_crafting_currentType >> _recipe >> "displayName");
    _recipeTimeout = getNumber(missionConfigFile >> "CfgRecipes" >> lilc_crafting_currentType >> _recipe >> "timeout");

    closeDialog 1310;
    ["lilc_progressBar", 0.01, 100, false] call lilc_ui_fnc_fadeInTitles;
    sleep 0.01;

    _ui = uiNamespace getVariable ["lilc_progressBar", displayNull];
    if (isNull _ui) throw false;
    private _uiProgressBar = _ui displayCtrl 1321;
    private _uiProgressBarText = _ui displayCtrl 1322;

    private _sleep = 15 / 100;

    private _configNeeded = [];
    {
        _configNeeded pushBack [configName _x, getNumber(_x >> "amount"), getNumber(_x >> "magazineSize"), getNumber(_x >> "isVehicle")];
    } forEach ("true" configClasses (missionConfigFile >> "CfgRecipes" >> lilc_crafting_currentType >> _recipe >> "needed"));

    _configCrafted = [];
    {
        _configCrafted pushBack [configName _x, getNumber(_x >> "amount"), getNumber(_x >> "magazineSize"), getNumber(_x >> "isVehicle")];
    } forEach ("true" configClasses (missionConfigFile >> "CfgRecipes" >> lilc_crafting_currentType >> _recipe >> "crafted"));

    private _itemsNeeded = _configNeeded apply { (_x select 0) };
    private _itemsCrafted = _configCrafted apply { (_x select 0) };
    private _currentVehicle = (vehicle player);
    private _amount = lilc_crafting_currentAmount;

    for [{private _i = 0}, {_i < _amount}, {_i = _i + 1}] do {
        if (isNull ([[player, (vehicle player)], _itemsCrafted] call lilc_inventory_fnc_canAdd)) exitWith { lilc_action_interrupted = true; };
        if (([_itemsNeeded, [player, (vehicle player)]] call lilc_inventory_fnc_itemInInventory) <= 0) exitWith { lilc_action_interrupted = true; };

        _uiProgressBarText ctrlSetStructuredText parseText format["<t align='center' font='PuristaSemibold'>Crafting %1 (1%2)</t>", _recipeName, "%"];
        if ((vehicle player) == player) then {
            player playMoveNow "Acts_carFixingWheel";
            player addEventHandler ["AnimDone", { lilc_action_animDone = true; }];
        };

        private _currentProgress = 0.01;
        private _currentSoundTime = time;
        while {true} do {
            if (lilc_action_animDone) then {
                lilc_action_animDone = false;
                player playMoveNow "Acts_carFixingWheel";
                if ((vehicle player) == player) then {
                    player playMoveNow "Acts_carFixingWheel";
                    player addEventHandler ["AnimDone", { lilc_action_animDone = true; }];
                };
            };
            
            _currentProgress = _currentProgress + 0.01;
            _uiProgressBar progressSetPosition _currentProgress;
            if (_currentProgress > 1) exitWith {};
            if (_currentVehicle != vehicle player) exitWith {};
            
            _uiProgressBarText ctrlSetStructuredText parseText format["<t align='center' font='PuristaSemibold'>Crafting %1 (%2%3)</t>", _recipeName, (round (_currentProgress * 100)), "%"];
            if (lilc_action_interrupted) exitWith {};
            sleep _sleep;
        };
        if (_currentVehicle != vehicle player) exitWith { lilc_action_interrupted = true; };

        if (([_itemsNeeded, [player, (vehicle player)]] call lilc_inventory_fnc_itemInInventory) <= 0) exitWith { lilc_action_interrupted = true; };
        if (lilc_action_interrupted) exitWith {};

        try {
            {
                for [{private _amount = 0}, {_amount < (_x select 1)}, {_amount = _amount + 1}] do {
                    if !([[player, (vehicle player)], (_x select 0)] call lilc_inventory_fnc_remove) throw false;
                };
            } forEach _configNeeded;
            throw true;
        } catch {
            if (_exception) then {
                {
                    for [{private _amount = 0}, {_amount < (_x select 1)}, {_amount = _amount + 1}] do {
                        if ((_x select 3) <= 0) then {
                            private _vehicle = ([[player, vehicle player], (_x select 0)] call lilc_inventory_fnc_canAdd);
                            if (!isNull _vehicle) then {
                                [_vehicle, (_x select 0)] call lilc_inventory_fnc_add;
                            };
                        } else {
                            [[player, (_x select 0), player, false], "lils_vehicles_fnc_new"] call lilc_common_fnc_sendToServer;
                        };
                    };
                } forEach _configCrafted;
            };
        };
        
        if (lilc_action_interrupted) exitWith {};
    };
    
    [0.01, 100] call lilc_ui_fnc_fadeOutTitles;
    if ((vehicle player) == player) then {
        player switchMove "";
    };

    if (lilc_action_interrupted) then {
        hint "Das Crafting wurde abgebrochen!";
        throw false;
    };

    throw true;
} catch {
    lilc_action_active = false;
    _exception;
};

//if ((time - _currentSoundTime) >= 10) then { deleteVehicle _soundSource; _soundSource = createSoundSource ["lilc_crafting", position player, [], 0]; _soundSource attachTo [player, [0, 0, 0]]; };
