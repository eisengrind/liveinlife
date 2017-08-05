
try {
    if (isNull (findDisplay 602)) throw [];

    private _index = (call lilc_inventory_fnc_getPlayerInventorySelection);
    if (_index <= -1) throw [];

    switch (_index) do {
        case 0: { throw [(lbData [633, (lbCurSel 633)]), (lbValue [633, (lbCurSel 633)])]; };
        case 1: { throw [(lbData [638, (lbCurSel 638)]), (lbValue [638, (lbCurSel 638)])]; };
        case 2: { throw [(lbData [619, (lbCurSel 619)]), (lbValue [619, (lbCurSel 619)])]; };
    };

    throw [];
} catch {
    _exception;
};
