
private _bankName = param [0, "", [""]];

try {
    private _bankConfig = ([_bankName] call lilc_bank_fnc_getBankConfig);
    if (isNull _bankConfig) throw 0;
    //TODO: insert check for bankaccount limitations...
    
    lilc_bank_lastAddedBankID = nil;
    [[player, _bankName], "lils_bank_fnc_createAccount"] call lilc_common_fnc_sendToServer;

    waitUntil { !isNil "lilc_bank_lastAddedBankID" };
    throw lilc_bank_lastAddedID;
} catch {
    _exception;
};
