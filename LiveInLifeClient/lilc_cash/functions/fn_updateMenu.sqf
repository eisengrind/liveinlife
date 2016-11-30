
disableSerialization; 

try {
    if !(dialog) throw false;
    
    private _ui = (findDisplay 1360);
    if (isNull _ui) throw false;

    private _uiEdit = _ui displayCtrl 1362;
    private _uiDescription = _ui displayCtrl 1361;
    private _uiButtonGive = _ui displayCtrl 1363;

    private _unitNameInfo = ([lilc_cash_receivingUnit] call lilc_login_fnc_getNameInfo);
    _uiDescription ctrlSetStructuredText parseText format["<t font='PuristaLight' size='0.75' shadow=0>Um %1 %2 Geld zu geben, gib nun etwas in dem unteren Feld an.</t>", (_unitNameInfo select 0), (_unitNameInfo select 1)];

    private _editText = ctrlText _uiEdit;
    if (_editText == "") then {
        _uiButtonGive ctrlEnable false;
    } else {
        private _balance = ([_editText] call lilc_common_fnc_textToNumber);
        
        if (([_balance] call lilc_cash_fnc_have) && _balance != 0) then {
            _uiButtonGive ctrlEnable true;
        } else {
            _uiButtonGive ctrlEnable false;
        };
    };
} catch {
    _exception;
};
