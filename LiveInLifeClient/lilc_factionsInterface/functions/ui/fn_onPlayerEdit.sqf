
try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    
    disableSerialization;
    private _ui = (findDisplay 1385);
    if (isNull _ui) throw false;

    private _uiTextPlayerName = (_ui displayCtrl 1387);
    private _uiListPlayerEquipment = (_ui displayCtrl 1388);
    private _uiListPlayerVehicles = (_ui displayCtrl 1389);
    private _uiComboRank = (_ui displayCtrl 1390);
    private _uiButtonComplete = (_ui displayCtrl 1391);
    private _uiButtonEdit = (_ui displayCtrl 1392);
    private _uiListPlayerPermissions = (_ui displayCtrl 1397);

    _uiTextPlayerName ctrlEnable true;
    _uiListPlayerEquipment ctrlEnable true;
    _uiListPlayerVehicles ctrlEnable true;
    _uiComboRank ctrlEnable true;
    _uiButtonComplete ctrlEnable true;
    _uiButtonEdit ctrlEnable false;
    _uiListPlayerPermissions ctrlEnable true;

    throw true;
} catch {
    _exception;
};