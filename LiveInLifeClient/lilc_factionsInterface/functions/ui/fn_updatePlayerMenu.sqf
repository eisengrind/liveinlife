
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

    lbClear _uiListPlayers;
    lnbClear _uiListPlayerEquipment;
    lnbClear _uiListPlayerVehicles;
    lbClear _uiComboRank;

    _uiListPlayerEquipment lnbSetColumnsPos [0.05, 0.2, 0.83];
    _uiListPlayerVehicles lnbSetColumnsPos [0.05, 0.2, 0.83];
    _uiListPlayerPermissions lnbSetColumnsPos [0.2, 0.8];
    /*
    private _index = _uiListPlayerEquipment lnbAddRow ["image", "classname", "0"];
    _uiListPlayerEquipment lnbSetData [[_index, 1], "classname"];
    _uiListPlayerEquipment lnbSetData [[_index, 2], "0"];
    */

    {
        if (!isNull _x && isPlayer _x) then {
            private _nameInfo = [_x] call lilc_login_fnc_getNameInfo;
            private _index = _uiListPlayers lbAdd format["%1%2 %3", (if ((_nameInfo select 3) != "") then { format["%1. ", (_nameInfo select 3)]; } else { (_nameInfo select 3); }), (_nameInfo select 0), (_nameInfo select 1)];
            _uiListPlayers lbSetData [_index, (str _x)];
        };
    } foreach playableUnits;

    {
        // [ID, NAME, TAG, FACTIONID, PRIORITY]
        if ((_x select 3) == _factionID) then {
            private _index = _uiComboRank lbAdd format["%1# %2", (_x select 4), (_x select 1)];
            _uiComboRank lbSetData [_index, (str (_x select 0))];
        };
    } forEach lilc_factionsInterface_ranks;

    lbSort [_uiComboRank, "ASC"];
    lbSort [_uiListPlayers, "ASC"];
} catch {
    _exception;
};
