
//ITEM -> [<classname>, <amount>, <cost>, <color>]

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
    if (_shopName == "" && _factionID > -1) then {//TODO: Change to %2
        private _equipment = ([(format["SELECT EQUIPMENT FROM FACTION_PLAYER_DATA WHERE ACCOUNTID = '%1' AND STEAM64ID = '%2'", (_unit getVariable ["lilc_accountID", 0]), (getPlayerUID _unit)])] call lils_database_fnc_fetchObjects);

        if ((count _equipment) <= 0) throw false;
        _equipment = ([((_equipment select 0) select 0)] call lils_common_fnc_arrayDecode);
        
        {
            private _isIn = ([_factionID, (_x select 0), (_x select 1)] call lilc_common_fnc_inFactionEquipment);
            systemChat str _isIn;
            systemChat str ([(_x select 0)] call lilc_shops_fnc_isOtherItem);
            if ([(_x select 0)] call lilc_shops_fnc_isOtherItem && (_isIn > -1)) then {
                //private _itemCost = (((([_factionID] call lilc_common_fnc_getFactionConfig) select 6) select _isIn) select 1);
                _items pushBack [(_x select 0), -1, /*_itemCost*/0, (_x select 1)];
            };
        } forEach _equipment;
    };/* else {
        private _economyItems = ([_shopName] call lils_economy_fnc_getShopItems);
        {
            if ([(_x select 0)] call lilc_shops_fnc_isOtherItem) then {
                _items pushBack [(_x select 0), -1, (_x select 2), (_x select 3)];
            };
        } forEach _economyItems;
    };*/
    
    [[_items], "lilc_shops_fnc_setBuyItems", _unit] call lilc_common_fnc_send;
} catch {
    _exception;
};
