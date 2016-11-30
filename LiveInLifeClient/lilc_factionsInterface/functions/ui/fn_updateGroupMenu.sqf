
try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if !(dialog) throw false;

    disableSerialization;
    private _ui = (findDisplay 1374);
    if (isNull _ui) throw false;

    private _uiListGroups = (_ui displayCtrl 1375);
    private _uiListGroupPlayers = (_ui displayCtrl 1376);
    private _uiEditGroupName = (_ui displayCtrl 1377);
    private _uiButtonComplete = (_ui displayCtrl 1378);
    private _uiButtonEditGroup = (_ui displayCtrl 1379);
    private _uiButtonAddPlayer = (_ui displayCtrl 1380);
    private _uiButtonRemovePlayer = (_ui displayCtrl 1381);
    private _uiButtonSetLeader = (_ui displayCtrl 1382);

    lbClear _uiListGroups;
    _uiListGroupPlayers ctrlEnable false;

    _uiEditGroupName ctrlEnable false;
    _uiButtonComplete ctrlEnable false;
    _uiButtonEditGroup ctrlEnable true;
    _uiButtonAddPlayer ctrlEnable false;
    _uiButtonRemovePlayer ctrlEnable false;
    _uiButtonSetLeader ctrlEnable false;

    {
        if ((_x getVariable ["lilc_factionID", -1]) == _factionID && !(_x getVariable ["lilc_factionMainGroup", false])) then {
            private _index = _uiListGroups lbAdd format["%1 (%2)", (_x getVariable ["lilc_factionGroupName", "Ohne Name"]), (groupID _x)];
            _uiListGroups lbSetData [_index, (str _x)];
        };
    } forEach allGroups;

    lbSort [_uiListGroups, "ASC"];
} catch {
    _exception;
};
