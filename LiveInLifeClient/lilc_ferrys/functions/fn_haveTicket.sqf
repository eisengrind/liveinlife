
try {
    if ((["lilci_ferryTicket_F", player] call lilc_inventory_fnc_itemCount) > 0) throw true;
    throw false;
} catch {
    _exception;
};
