
/*
    Filename:
        fn_showButtons.sqf
    Author:
        Vincent Heins
    Description:
        Shows given button idcs.
    Param(s):
        (_this select 0) : buttonIDC's to show : <SCALAR/INT>
    Result(s):
        true = success: false != true : <BOOL>
*/

private _buttonIDCs = [_this] param [0, [], [[], 0]];

try {
    if (isNull (findDisplay 1510)) throw false;
    if (_buttonIDCs isEqualType 0) then { _buttonIDCs = [_buttonIDCs]; };
    
    private _availableButtons = [
        [1514, 1530, 1522],
        [1515, 1531, 1523],
        [1516, 1532, 1524],
        [1517, 1533, 1525],
        [1518, 1534, 1526],
        [1519, 1535, 1527],
        [1520, 1536, 1528],
        [1521, 1537, 1529]
    ];
    
    {
        private _buttons = _x;
        private _buttonNumber = (_forEachIndex + 1);

        try {
            { if (_x == _buttonNumber) throw true; } forEach _buttonIDCs;
            throw false;
        } catch {
            if (_exception) then {
                { if !(ctrlVisible _x) then { ctrlShow [_x, true]; }; } forEach _buttons;
            } else {
                { if (ctrlVisible _x) then { ctrlShow [_x, false]; }; } forEach _buttons;
            };
        };
    } forEach _availableButtons;
	
	throw true;
} catch {
    _exception;
};
