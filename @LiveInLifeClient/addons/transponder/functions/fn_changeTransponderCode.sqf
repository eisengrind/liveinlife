
private _increase = param [0, true, [false]];

try {
    if (lilc_transponder_currentVehicle == player) throw false;

    private _codeIndex = lilc_transponder_currentIndex;
    private _codeCount = (count lilc_transponder_codes);

    if (_increase) then {
        if ((_codeIndex + 1) >= _codeCount) then {
            _codeIndex = 0;
        } else {
            _codeIndex = _codeIndex + 1;
        };
    } else {
        if ((_codeIndex - 1) < 0) then {
            _codeIndex = _codeCount;
        } else {
            _codeIndex = _codeIndex - 1;
        };
    };
    
    lilc_transponder_currentIndex = _codeIndex;
    lilc_transponder_currentCode = (lilc_transponder_codes select _codeIndex);
    ctrlSetText [1581, (lilc_transponder_codes select _codeIndex)];
} catch {
    _exception;
};
