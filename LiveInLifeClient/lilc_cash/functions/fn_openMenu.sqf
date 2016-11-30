
private _unit = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    lilc_cash_receivingUnit = _unit;

    createDialog "lilc_giveCash";
    call lilc_cash_fnc_updateMenu;
} catch {
    _exception;
};
