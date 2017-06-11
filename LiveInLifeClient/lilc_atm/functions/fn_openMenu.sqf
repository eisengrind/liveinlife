
/*
    Filename:
        fn_openMenu.sqf
    Author:
        Vincent Heins
    Description:
        Creates the ATM-menu of a specif bank and bankaccount.
    Param(s):
        (_this select 0) : bank name as configName defined in CfgBanks : <STRING>
    Result(s):
        true = success; false != true : <BOOL>
*/

private _bankName = param [0, "", [""]];

try {
    private _bankConfig = ([_bankName] call lilc_bank_fnc_getBankConfig);
    systemChat str _bankConfig;
    if (isNull _bankConfig) throw false;

    createDialog "lilc_atm_menu";
    
    disableSerialization;
    private _ui = (findDisplay 1510);
    if (isNull _ui) throw false;
    
    private _uiBackground = (_ui displayCtrl 1511);
    private _background = getText(_bankConfig >> "background");
    if (_background != "") then { _uiBackground ctrlSetText _background; };

    lilc_atm_currentBankName = _bankName;
    lilc_atm_currentBankAccount = -1;

    if ([_bankName] call lilc_bank_fnc_haveBankName) then {
        private _bankAccount = ([_bankName] call lilc_bank_fnc_getAccountByBankName);
        if ([_bankAccount] call lilc_bank_fnc_isAccountFormat);
        lilc_atm_currentBankAccount = (_bankAccount select 4);
        ["main"] call lilc_atm_fnc_selectMenu;
    } else {
        ["create"] call lilc_atm_fnc_selectMenu;
    };
	
	throw true;
} catch {
    _exception;
};
