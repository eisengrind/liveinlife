
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_shopName", "", [""]]
];

try {
    private _factionID = (_unit getVariable ["lilc_factionID", -1]);
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if !(alive _unit) throw false;

    if (_shopName == "" && _factionID <= -1) throw false;

    _items = []; 
    if (_shopName == "" && _factionID > -1) then {
        private _result = [(format["SELECT EQUIPMENT FROM FACTION_PLAYER_DATA WHERE ACCOUNTID = '%1' AND STEAM64ID = '%2'", (_unit getVariable ["lilc_accountID", 0]), (getPlayerUID _unit)])] call lils_database_fnc_fetchObjects;
        
        if ((count _result) <= 0) throw false;
        _result = ([((_result select 0) select 0)] call lils_common_fnc_arrayDecode);

        {
            private _isIn = ([_factionID, (_x select 0), (_x select 1)] call lilc_factions_fnc_inFactionEquipment);
            if ([(_x select 0)] call lilc_shops_fnc_isUniformItem && (_isIn > -1)) then {
                _items pushBack [(_x select 0), -1, /*_itemCost*/0, (_x select 1)];
            };
        } forEach _result;
    };
    
    [[_items], "lilc_shops_fnc_setBuyUniforms", _unit] call lilc_common_fnc_send;
} catch {
    _exception;
};
