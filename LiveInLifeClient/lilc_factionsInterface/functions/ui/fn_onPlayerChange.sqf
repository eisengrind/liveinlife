
private _index = param [0, -1, [0]];

try {
    if (_index <= -1) throw false;
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);
    if (_index <= -1) throw false;
    
    disableSerialization;
    private _ui = (findDisplay 1385);
    if (isNull _ui) throw false;

    lilc_factionsInterface_allPermissions = false;
    private _uiListPlayers = (_ui displayCtrl 1386);
    private _uiTextPlayerName = (_ui displayCtrl 1387);
    private _uiComboRank = (_ui displayCtrl 1390);
    
    _uiComboRank lbSetCurSel -1;
    private _unit = (call compile format["%1;", (_uiListPlayers lbData _index)]);
    if (isNull _unit || !isPlayer _unit) throw false;

    private _nameInfo = ([_unit] call lilc_login_fnc_getNameInfo);
    _uiTextPlayerName ctrlSetText format["%1 %2", (_nameInfo select 0), (_nameInfo select 1)];

    private _rankID = (_unit getVariable ["lilc_factionRankID", 0]);
    for [{_i = 0}, {_i < (lbSize _uiComboRank)}, {_i = _i + 1}] do {
        if ((parseNumber (_uiComboRank lbData _i)) == _rankID) exitWith {
            _uiComboRank lbSetCurSel _i;
        };
    };

    [[_unit, player], "lils_factionsInterface_fnc_getPlayerInfo"] call lilc_common_fnc_sendToServer;
} catch {
    _exception;
};
