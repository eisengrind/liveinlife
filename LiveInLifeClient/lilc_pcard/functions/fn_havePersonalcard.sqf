
try {
    if ((count (call lilc_pcard_fnc_getPersonalcards)) <= 0) throw false;
    throw true;
} catch {
    _exception;
};
