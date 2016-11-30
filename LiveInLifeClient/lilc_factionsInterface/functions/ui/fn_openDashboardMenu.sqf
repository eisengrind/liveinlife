
try {
    if !(call lilc_factionsInterface_fnc_haveInterface) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);

    createDialog "lilc_factionsInterface_dashboard";
    
    disableSerialization;
    private _ui = (findDisplay 1370);
    if (isNull _ui) throw false;
    
    private _uiListPlayers = _ui displayCtrl 1371;
    private _uiListRanks = _ui displayCtrl 1372;
    private _uiListGroups = _ui displayCtrl 1373;

    lbClear _uiListPlayers;
    lbClear _uiListRanks;
    lbClear _uiListGroups;

    {
        if (!isNull _x && isPlayer _x && (_x getVariable ["lilc_factionID", -1]) == _factionID) then {
            private _nameInfo = [_x] call lilc_login_fnc_getNameInfo;
            _uiListPlayers lbAdd format["%1%2 %3", (if ((_nameInfo select 3) != "") then { format["%1. ", (_nameInfo select 3)]; } else { (_nameInfo select 3); }), (_nameInfo select 0), (_nameInfo select 1)];
        };
    } forEach playableUnits;

    {
        if ((_x select 3) == _factionID) then {
            _uiListRanks lbAdd format["%1 (%2)", (_x select 1), (_x select 2)];
        };
    } forEach lilc_factionsInterface_ranks;

    {
        if ((_x getVariable ["lilc_factionID", -1]) == _factionID && !(_x getVariable ["lilc_factionMainGroup", false])) then {
            _uiListGroups lbAdd format["%1 (%2)", (_x getVariable ["lilc_factionGroupName", "Ohne Name"]), (groupID _x)];
        };
    } forEach allGroups;

    lbSort [_uiListPlayers, "ASC"];
    lbSort [_uiListRanks, "ASC"];
    lbSort [_uiListGroups, "ASC"];
} catch {
    _exception;
};
