
try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    
    disableSerialization;
    private _ui = (findDisplay 1400);
    if (isNull _ui) throw false;

    private _uiListRanks = (_ui displayCtrl 1401);
    private _uiEditRanktag = (_ui displayCtrl 1402);
    private _uiEditRankname = (_ui displayCtrl 1403);
    private _uiComboPriority = (_ui displayCtrl 1404);
    private _uiComboInsignia = (_ui displayCtrl 1405);
    private _uiListRankEquipment = (_ui displayCtrl 1406);
    private _uiListRankVehicles = (_ui displayCtrl 1407);
    private _uiListRankPermissions = (_ui displayCtrl 1408);
    private _uiButtonComplete = (_ui displayCtrl 1415);
    private _uiButtonEdit = (_ui displayCtrl 1416);

    _uiEditRanktag ctrlShow false;
    _uiEditRankname ctrlShow false;
    _uiComboPriority ctrlShow false;
    _uiComboInsignia ctrlShow false;
    _uiListRankEquipment ctrlShow false;
    _uiListRankVehicles ctrlShow false;
    _uiListRankPermissions ctrlShow false;
    _uiButtonComplete ctrlShow false;
    _uiButtonEdit ctrlShow false;

    lnbClear _uiListRankEquipment;
    lnbClear _uiListRankVehicles;
    lnbClear _uiListRankPermissions;
    lbClear _uiListRanks;
    lbClear _uiComboInsignia;

    private _factionPaychecks = ([_factionID] call lilc_common_fnc_getFactionConfig);
    if ((count _factionPaychecks) > 0) then {
        {
            private _index = _uiComboPriority lbAdd format["%1", (_forEachIndex + 1)];
            _uiComboPriority lbSetData [_index, (str (_forEachIndex + 1))];
        } forEach _factionPaychecks;
    };

    {
        if ((_x select 3) == _factionID) then {
            private _index = _uiListRanks lbAdd format["#%1 %2 (%3)", (_x select 4), (_x select 1), (_x select 2)];
            _uiListRanks lbSetData [_index, (str (_x select 0))];
        };
    } forEach lilc_factionsInterface_ranks;

    {
        private _index = _uiComboInsignia lbAdd "";
        _uiComboInsignia lbSetPicture [_index, getText(_x >> "texture")];
        _uiComboInsignia lbSetData [_index, (configName _x)];
    } forEach (("true" configClasses (configFile >> "CfgUnitInsignia")) + ("true" configClasses (missionConfigFile >> "CfgUnitInsignia")));

    throw true;
} catch {
    _exception;
};
