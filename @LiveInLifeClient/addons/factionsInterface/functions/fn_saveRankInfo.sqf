
try {
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if (_factionID <= -1) throw false;
    if !(["factionsInterface.rank.edit"] call lilc_permissions_fnc_have) throw false;

    disableSerialization;
    private _ui = (findDisplay 1370);
    if (isNull _ui) throw false;

    private _uiListPermissions = (_ui displayCtrl 1396);
    private _uiListWeapons = (_ui displayCtrl 1398);
    private _uiListVehicles = (_ui displayCtrl 1399);

    private _tag = (ctrlText 1392);
    private _name = (ctrlText 1394);
    private _insignia = (lbData [1406, (lbCurSel 1406)]);
    private _paycheck = (lbValue [1404, (lbCurSel 1404)]);

    if (_tag == "") then {
        hint "Du musst einen Tag angeben.";
        throw false;
    };

    if (_name == "") then {
        hint "Du musst einen Namen angeben.";
        throw false;
    };

    if (_paycheck < -1) then {
        hint "Diesen Paycheck gibt es nicht (existiert nicht im array-index).";
        throw false;
    };
    
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
    systemChat str [player, lilc_factionsInterface_currentRankID, _tag, _name, _insignia, _paycheck, _permissions, _equipment, _vehicles];
    [[player, lilc_factionsInterface_currentRankID, _tag, _name, _insignia, _paycheck, _permissions, _equipment, _vehicles], "lils_factionsInterface_fnc_saveRankInfo"] call lilc_common_fnc_sendToServer;
    
    ctrlEnable [1401, false];
    ctrlEnable [1402, false];
    sleep 1;
    ctrlEnable [1401, true];
    ctrlEnable [1402, true];
    ["dashboard"] call lilc_factionsInterface_fnc_selectMenu;
    throw true;
} catch {
    _exception;
};
