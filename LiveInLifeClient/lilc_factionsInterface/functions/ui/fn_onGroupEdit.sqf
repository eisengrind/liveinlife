
try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    
    disableSerialization;
    private _ui = (findDisplay 1374);
    if (isNull _ui) throw false;

    _uiListGroupPlayers = (_ui displayCtrl 1376);
    _uiEditGroupName = (_ui displayCtrl 1377);
    _uiButtonComplete = (_ui displayCtrl 1378);
    _uiButtonEditGroup = (_ui displayCtrl 1379);
    _uiButtonAddPlayer = (_ui displayCtrl 1380);
    _uiButtonRemovePlayer = (_ui displayCtrl 1381);
    _uiButtonSetLeader = (_ui displayCtrl 1382);

    _uiListGroupPlayers ctrlEnable true;
    _uiEditGroupName ctrlEnable true;
    _uiButtonComplete ctrlEnable true;
    _uiButtonEditGroup ctrlEnable false;
    _uiButtonAddPlayer ctrlEnable true;
    _uiButtonRemovePlayer ctrlEnable true;
    _uiButtonSetLeader ctrlEnable true;
} catch {
    _exception;
};