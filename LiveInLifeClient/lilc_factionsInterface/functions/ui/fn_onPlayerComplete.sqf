
try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);

    disableSerialization;
    private _ui = (findDisplay 1385);
    if (isNull _ui) throw false;

    private _uiListPlayers = (_ui displayCtrl 1386);
    private _uiTextPlayerName = (_ui displayCtrl 1387);
    private _uiListPlayerEquipment = (_ui displayCtrl 1388);
    private _uiListPlayerVehicles = (_ui displayCtrl 1389);
    private _uiComboRank = (_ui displayCtrl 1390);
    private _uiButtonComplete = (_ui displayCtrl 1391);
    private _uiButtonEdit = (_ui displayCtrl 1392);
    private _uiListPlayerPermissions = (_ui displayCtrl 1397);

    _uiTextPlayerName ctrlEnable false;
    _uiListPlayerEquipment ctrlEnable false;
    _uiListPlayerVehicles ctrlEnable false;
    _uiComboRank ctrlEnable false;
    _uiButtonComplete ctrlEnable false;
    _uiButtonEdit ctrlEnable true;
    _uiListPlayerPermissions ctrlEnable false;

    private _index = lbCurSel _uiListPlayers;
    private _unit = (call compile format["%1;", (_uiListPlayers lbData _index)]);
    if (isNull _unit) throw false;

    private _rankID = (parseNumber (_uiComboRank lbData (lbCurSel _uiComboRank)));
    private _permissionList = [];
    private _equipmentList = [];
    private _vehicleList = [];

    for [{_i = 0}, {_i < ((lnbSize _uiListPlayerPermissions) select 0)}, {_i = _i + 1}] do {
        private _status = (parseNumber (_uiListPlayerPermissions lnbData [_i, 1]));

        if (_status == 1) then {
            private _configName = (_uiListPlayerPermissions lnbData [_i, 0]);
            _permissionList pushBack _configName;
        };
    };
    if (lilc_factionsInterface_allPermissions) then { _permissionList pushBack "*"; };

    for [{_i = 0}, {_i < ((lnbSize _uiListPlayerEquipment) select 0)}, {_i = _i + 1}] do {
        private _amount = (parseNumber (_uiListPlayerEquipment lnbData [_i, 2]));
        
        if (_amount > 0) then {
            _equipmentList pushBack [
                (_uiListPlayerEquipment lnbData [_i, 1]),
                _amount,
                (_uiListPlayerEquipment lnbData [_i, 0])
            ];
        };
    };

    for [{_i = 0}, {_i < ((lnbSize _uiListPlayerVehicles) select 0)}, {_i = _i + 1}] do {
        private _amount = (parseNumber (_uiListPlayerVehicles lnbData [_i, 2]));

        if (_amount > 0 || _amount == -1) then {
            _vehicleList pushBack [ 
                (_uiListPlayerVehicles lnbData [_i, 1]),
                _amount,
                (_uiListPlayerVehicles lnbData [_i, 0])
            ];
        };
    };

    [[_unit, _rankID, _permissionList, _equipmentList, _vehicleList], "lils_factionsInterface_fnc_setPlayerInfo"] call lilc_common_fnc_sendToServer;
} catch {
    _exception;
};
