
try {
    if !(dialog) throw false;
    private _ui = (findDisplay 1310);
    if (isNull _ui) throw false;

    private _type = lilc_crafting_currentType;
    if (!isClass (missionConfigFile >> "CfgRecipes" >> _type)) throw false;

    private _uiListBlueprints = _ui displayCtrl 1311;
    private _uiListNeeded = _ui displayCtrl 1312;
    private _uiTextBlueprint = _ui displayCtrl 1313;
    private _uiTextDescription = _ui displayCtrl 1314;
    private _uiButtonCraft = _ui displayCtrl 1315;
    private _uiEditAmount = _ui displayCtrl 1316;

    lbClear _uiListBlueprints;
    {
        private _index = _uiListBlueprints lbAdd getText(_x >> "displayName");
        _uiListBlueprints lbSetData [_index, (configName _x)];
        _uiListBlueprints lbSetPicture [_index, getText(_x >> "picture")];
    } forEach ("true" configClasses (missionConfigFile >> "CfgRecipes" >> _type));
    lbSort [_uiListBlueprints, "ASC"];

    private _listBlueprintSelection = lbCurSel _uiListBlueprints;
    if (_listBlueprintSelection > -1) then {
        _selectionData = _uiListBlueprints lbData _listBlueprintSelection;
        _uiEditAmount ctrlEnable true;
        
        if (isText(missionConfigFile >> "CfgRecipes" >> _type >> _selectionData >> "displayName")) then {
            _uiTextBlueprint ctrlSetText getText(missionConfigFile >> "CfgRecipes" >> _type >> _selectionData >> "displayName");
        };

        if (isText(missionConfigFile >> "CfgRecipes" >> _type >> _selectionData >> "description")) then {
            _uiTextDescription ctrlSetText getText(missionConfigFile >> "CfgRecipes" >> _type >> _selectionData >> "description");
        };
        
        lilc_crafting_currentAmount = ([(ctrlText _uiEditAmount)] call lilc_common_fnc_textToNumber);
        if (lilc_crafting_currentAmount > 100) then {
            _uiEditAmount ctrlSetText "100";
            lilc_crafting_currentAmount = 100;
        };

        lnbClear _uiListNeeded;
        if (isClass(missionConfigFile >> "CfgRecipes" >> _type >> _selectionData >> "needed")) then {
            private _enough = true;
            {
                private _amount = if (lilc_crafting_currentAmount <= 0) then { (getNumber(_x >> "amount")); } else { lilc_crafting_currentAmount * (getNumber(_x >> "amount")); };
                private _displayName = [(configName _x)] call lilc_inventory_fnc_getItemInfo;
                if (isClass _displayName) then { _displayName = getText(_displayName >> "displayName"); };

                private _index = _uiListNeeded lnbAddRow [_displayName, format["%1x", _amount]];
                
                if (([(configName _x), [player, (vehicle player)]] call lilc_inventory_fnc_itemInInventory) < _amount) then {
                    _enough = false;
                    _uiListNeeded lnbSetColor [[_index, 0], [(237/255), (80/255), (80/255), 1]];
                    _uiListNeeded lnbSetColor [[_index, 1], [(237/255), (80/255), (80/255), 1]];
                };
            } forEach ("true" configClasses (missionConfigFile >> "CfgRecipes" >> _type >> _selectionData >> "needed"));

            if (lilc_crafting_currentAmount > 0 && lilc_crafting_currentAmount <= 100 && _enough) then {
                _uiButtonCraft ctrlEnable true;
            };
        };
    } else {
        _uiEditAmount ctrlEnable false;
        _uiButtonCraft ctrlEnable false;
        lbClear _uiListNeeded;
    };


} catch {
    _exception;
};
