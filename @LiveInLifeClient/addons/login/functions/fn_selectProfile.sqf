
scriptName "\x\lilc\addons\login\functions\selectProfile";

try
{
    disableSerialization;
    private _ui = (findDisplay 1024);
    private _uiGroupMainMenu = (_ui displayCtrl 2300);
    ((_uiGroupMainMenu controlsGroupCtrl 2300) controlsGroupCtrl 1002) ctrlEnable false;
    (_uiGroupMainMenu controlsGroupCtrl 1001) ctrlEnable false;
    (_uiGroupMainMenu controlsGroupCtrl 1000) ctrlEnable false;
    
    private _accountID = (_ui getVariable ["lilc_ui_data_currentProfile", 0]);
    if (_accountID <= 0) then
    {
        sleep 2;
        ((_uiGroupMainMenu controlsGroupCtrl 2300) controlsGroupCtrl 1002) ctrlEnable true;
        (_uiGroupMainMenu controlsGroupCtrl 1001) ctrlEnable true;
        (_uiGroupMainMenu controlsGroupCtrl 1000) ctrlEnable true;
        throw false;
    };

    [_accountID] call lilc_login_fnc_getJoinData;
    
    private _uiGroupProfileMenu = (_ui displayCtrl 2301);
    _uiGroupMainMenu ctrlSetFade 1;
    _uiGroupProfileMenu ctrlSetFade 1;
    _uiGroupMainMenu ctrlCommit 1;
    _uiGroupProfileMenu ctrlCommit 1;
    waitUntil { ctrlCommitted _uiGroupMainMenu && ctrlCommitted _uiGroupProfileMenu };
    throw true;
}
catch
{
    _exception;
};
