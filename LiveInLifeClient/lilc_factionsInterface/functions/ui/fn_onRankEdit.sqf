
try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    
    disableSerialization;
    private _ui = (findDisplay 1400);
    if (isNull _ui) throw false;

    private _uiEditRanktag = (_ui displayCtrl 1402);
    private _uiEditRankname = (_ui displayCtrl 1403);
    private _uiEditPriority = (_ui displayCtrl 1404);
    private _uiComboInsignia = (_ui displayCtrl 1405);
    private _uiListRankEquipment = (_ui displayCtrl 1406);
    private _uiListRankVehicles = (_ui displayCtrl 1407);
    private _uiListRankPermissions = (_ui displayCtrl 1408);
    private _uiButtonComplete = (_ui displayCtrl 1415);
    private _uiButtonEdit = (_ui displayCtrl 1416);

    _uiEditRanktag ctrlEnable true;
    _uiEditRankname ctrlEnable true;
    _uiEditPriority ctrlEnable true;
    _uiComboInsignia ctrlEnable true;
    _uiListRankEquipment ctrlEnable true;
    _uiListRankVehicles ctrlEnable true;
    _uiListRankPermissions ctrlEnable true;
    _uiButtonComplete ctrlEnable true;
    _uiButtonEdit ctrlEnable false;

    throw true;
} catch {
    _exception;
};
