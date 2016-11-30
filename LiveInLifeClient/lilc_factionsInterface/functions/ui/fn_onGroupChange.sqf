
private _index = param [0, -1, [0]];

try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    
    disableSerialization;
    private _ui = (findDisplay 1374);
    if (isNull _ui) throw false;

    private _uiListGroups = (_ui displayCtrl 1375);
    private _uiListGroupPlayers = (_ui displayCtrl 1376);
    private _uiEditGroupName = (_ui displayCtrl 1377);

    lbClear _uiListGroupPlayers;

    private _data = (_uiListGroups lbData _index);
    if (isNil "_data") throw false;
    
    private _group = call compile format["%1;", _data];
    if (isNull _group) throw false;

    {
        if (!isNull _x && isPlayer _x) then {
            private _nameInfo = [_x] call lilc_login_fnc_getNameInfo;
            _uiListGroupPlayers lbAdd format["%1%2 %3", (if ((_nameInfo select 3) != "") then { format["%1. ", (_nameInfo select 3)]; } else { (_nameInfo select 3); }), (_nameInfo select 0), (_nameInfo select 1)];
        };
    } forEach (units _group);

    lbSort [_uiListGroupPlayers, "ASC"];
} catch {
    _exception;
};
