
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

    private _rankID = (parseNumber (_uiListRanks lbData (lbCurSel _uiListRanks)));
    private _rankName = (ctrlText _uiEditRankname);
    private _rankTag = (ctrlText _uiEditRanktag);
    private _rankPriority = (parseNumber (_uiComboPriority lbData (lbCurSel _uiComboPriority)));
    private _rankInsignia = (_uiComboInsignia lbData (lbCurSel _uiComboInsignia));
    
    _uiButtonComplete ctrlEnable false;

    private _permissionList = [];
    private _equipmentList = [];
    private _vehicleList = [];

    for [{_i = 0}, {_i < ((lnbSize _uiListRankPermissions) select 0)}, {_i = _i + 1}] do {
        private _status = (parseNumber (_uiListRankPermissions lnbData [_i, 1]));

        if (_status == 1) then {
            private _configName = (_uiListRankPermissions lnbData [_i, 0]);
            _permissionList pushBack _configName;
        };
    };
    if (lilc_factionsInterface_allPermissions) then { _permissionList pushBack "*"; };

    for [{_i = 0}, {_i < ((lnbSize _uiListRankEquipment) select 0)}, {_i = _i + 1}] do {
        private _amount = (parseNumber (_uiListRankEquipment lnbData [_i, 2]));
        
        if (_amount > 0) then {
            _equipmentList pushBack [
                (_uiListRankEquipment lnbData [_i, 1]),
                _amount,
                (_uiListRankEquipment lnbData [_i, 0])
            ];
        };
    };

    for [{_i = 0}, {_i < ((lnbSize _uiListRankVehicles) select 0)}, {_i = _i + 1}] do {
        private _amount = (parseNumber (_uiListRankVehicles lnbData [_i, 2]));

        if (_amount > 0 || _amount == -1) then {
            _vehicleList pushBack [ 
                (_uiListRankVehicles lnbData [_i, 1]),
                _amount,
                (_uiListRankVehicles lnbData [_i, 0])
            ];
        };
    };

    [[_rankID, _rankName, _rankTag, _rankPriority, _rankInsignia, _permissionList, _equipmentList, _vehicleList], "lils_factionsInterface_fnc_setPlayerInfo"] call lilc_common_fnc_sendToServer;
    _uiButtonEdit ctrlEnable true;
} catch {
    _exception;
};
