//[player, lilc_shops_currentShopname]

params [
    ["_unit", ObjNull, [ObjNull]],
    ["_shopname", "", [""]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if !(alive _unit) throw false;

    private _factionID = (_unit getVariable ["lilc_factionID", -1]);
} catch {
    _exception;
};
