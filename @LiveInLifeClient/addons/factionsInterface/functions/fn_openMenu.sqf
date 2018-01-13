
try {
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if (_factionID <= -1) throw false;
    if !(["factionsInterface.dashboard"] call lilc_permissions_fnc_have) throw false;

    if !(createDialog "lilcm_factionsInterface") throw false;

    disableSerialization;
    private _ui = (findDisplay 1370);
    if (isNull _ui) throw false;
    
    private _uiPlayerListPermissions = (_ui displayCtrl 1384);
    private _uiPlayerListWeapons = (_ui displayCtrl 1386);
    private _uiPlayerListVehicles = (_ui displayCtrl 1387);
    
    private _uiRankListPermissions = (_ui displayCtrl 1396);
    private _uiRankListWeapons = (_ui displayCtrl 1398);
    private _uiRankListVehicles = (_ui displayCtrl 1399);

    _uiPlayerListPermissions lnbSetColumnsPos [0, 0.84];
    _uiPlayerListWeapons lnbSetColumnsPos [0, 0.12, 0.84];
    _uiPlayerListVehicles lnbSetColumnsPos [0, 0.12, 0.84];

    _uiRankListPermissions lnbSetColumnsPos [0.06, 0.84];
    _uiRankListWeapons lnbSetColumnsPos [0, 0.12, 0.84];
    _uiRankListVehicles lnbSetColumnsPos [0, 0.12, 0.84];

    lbClear _uiPlayerListPermissions;
    lbClear _uiPlayerListWeapons;
    lbClear _uiPlayerListVehicles;
    lbClear _uiRankListPermissions;
    lbClear _uiRankListWeapons;
    lbClear _uiRankListVehicles;

    ["dashboard"] call lilc_factionsInterface_fnc_selectMenu;
} catch {
    _exception;
};
