
_type = param [0, "", [""]];

try {
    if (isNil "_type") throw false;
    if (dialog) throw false;
    if !(isClass (missionConfigFile >> "CfgRecipes" >> _type)) throw false;
    createDialog "lilc_craftingMenu";

    disableSerialization;
    _ui = (findDisplay 1310);
    if (isNull (findDisplay 1310)) throw false;
    _uiTitleType = _ui displayCtrl 1317;
    _uiButtonCrafting = _ui displayCtrl 1315;
    _uiEditAmount = _ui displayCtrl 1316;
    _uiListNeeded = _ui displayCtrl 1312;

    _typeText = getText (missionConfigFile >> "CfgRecipes" >> _type >> "displayName");
    _uiTitleType ctrlSetText _typeText;
    _uiButtonCrafting ctrlEnable false;
    _uiEditAmount ctrlEnable false;

    _uiListNeeded lnbAddColumn 0.85;

    lilc_crafting_currentType = _type;
    call lilc_crafting_fnc_updateMenu;
} catch {
    _exception;
};
