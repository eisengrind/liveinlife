
try {
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if (_factionID <= -1) throw false;
    if !(["factionsInterface.player.edit"] call lilc_permissions_fnc_have) throw false;

    disableSerialization;
    private _ui = (findDisplay 1370);
    if (isNull _ui) throw false;

    private _uiListPermissions = (_ui displayCtrl 1384);
    private _uiListWeapons = (_ui displayCtrl 1386);
    private _uiListVehicles = (_ui displayCtrl 1387);

    private _selectedRank = 0;
    _selectedRank = (lbValue [1382, (lbCurSel 1382)]);
    
    private _permissions = [];
    for [{private _i = 0}, {_i < ((lnbSize _uiListPermissions) select 0)}, {_i = _i + 1}] do {
        private _permission = (_uiListPermissions lnbData [_i, 0]);
        private _status = (parseNumber (_uiListPermissions lnbData [_i, 1]));
        
        if (_status == 1) then {
            _permissions pushBack _permission;
        };
    };

    private _equipment = [];
    for [{private _i = 0}, {_i < ((lnbSize _uiListWeapons) select 0)}, {_i = _i + 1}] do {
        private _classname = (_uiListWeapons lnbData [_i, 0]);
        private _color = (_uiListWeapons lnbData [_i, 1]);
        private _status = (parseNumber (_uiListWeapons lnbData [_i, 2]));

        if (_status == 1) then {
            _equipment pushBack [_classname, _color];
        };
    };

    private _vehicles = [];
    for [{private _i = 0}, {_i < ((lnbSize _uiListVehicles) select 0)}, {_i = _i + 1}] do {
        private _classname = (_uiListVehicles lnbData [_i, 0]);
        private _color = (_uiListVehicles lnbData [_i, 1]);
        private _status = (parseNumber (_uiListVehicles lnbData [_i, 2]));

        if (_status == 1) then {
            _vehicles pushBack [_classname, _color];
        };
    };

    [[player, lilc_factionsInterface_currentAccountID, _selectedRank, _permissions, _equipment, _vehicles], "lils_factionsInterface_fnc_savePlayerInfo"] call lilc_common_fnc_sendToServer;
    
    ctrlEnable [1389, false];
    ctrlEnable [1390, false];
    sleep 1;
    ctrlEnable [1389, true];
    ctrlEnable [1390, true];
    ["dashboard"] call lilc_factionsInterface_fnc_selectMenu;
    throw true;
} catch {
    _exception;
};
