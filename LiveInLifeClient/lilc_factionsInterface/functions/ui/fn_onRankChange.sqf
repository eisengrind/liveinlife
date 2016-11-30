
private _index = param [0, -1, [0]];

try {
    if (_index <= -1) throw false;
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if (_index <= -1) throw false;
    
    disableSerialization;
    private _ui = (findDisplay 1400);
    if (isNull _ui) throw false;

    lilc_factionsInterface_allPermissions = false;
    private _uiListRanks = (_ui displayCtrl 1401);
    private _uiEditRanktag = (_ui displayCtrl 1402);
    private _uiEditRankname = (_ui displayCtrl 1403);
    private _uiEditPriority = (_ui displayCtrl 1404);
    private _uiComboInsignia = (_ui displayCtrl 1405);
    private _uiListRankEquipment = (_ui displayCtrl 1406);
    private _uiListRankVehicles = (_ui displayCtrl 1407);
    private _uiListRankPermissions = (_ui displayCtrl 1408);
    private _uiButtonComplete = (_ui displayCtrl 1415);
    private _uiButtonEdit = (_ui displayCtrl 1416);

    _uiEditRanktag ctrlShow true;
    _uiEditRankname ctrlShow true;
    _uiEditPriority ctrlShow true;
    _uiComboInsignia ctrlShow true;
    _uiListRankEquipment ctrlShow true;
    _uiListRankVehicles ctrlShow true;
    _uiListRankPermissions ctrlShow true;
    _uiButtonComplete ctrlShow true;
    _uiButtonEdit ctrlShow true;

    _uiEditRanktag ctrlEnable false;
    _uiEditRankname ctrlEnable false;
    _uiEditPriority ctrlEnable false;
    _uiComboInsignia ctrlEnable false;
    _uiListRankEquipment ctrlEnable false;
    _uiListRankVehicles ctrlEnable false;
    _uiListRankPermissions ctrlEnable false;
    _uiButtonComplete ctrlEnable false;
    _uiButtonEdit ctrlEnable true;

    private _rankID = (parseNumber (_uiListRanks lbData _index));
    _rankInfo = ([(_rankID)] call lilc_factionsInterface_fnc_getRankInfo);

    _uiEditRankname ctrlSetText (_rankInfo select 1);
    _uiEditRanktag ctrlSetText (_rankInfo select 2);
    _uiEditPriority ctrlSetText (str (_rankInfo select 4));

    _uiComboInsignia lbSetCurSel -1;
    for [{_i = 0}, {_i < (lbSize _uiComboInsignia)}, {_i = _i + 1}] do {
        private _insignia = (_uiComboInsignia lbData _i);
        if (_insignia == (_rankInfo select 5)) exitWith { _uiComboInsignia lbSetCurSel _i; };
    };
    
    [[_unit, _rankID], "lils_factionsInterface_fnc_getRankInfo"] call lilc_common_fnc_sendToServer;
} catch {
    _exception;
};
