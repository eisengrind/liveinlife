
/*
    Filename:
        fn_inUIArea.sqf
    Author:
        Vincent Heins
    Description:
        With this function you can do a pseudo check if a given position or area is an given area.
		This function is mainly intended to be used for UI check; but also can be used for world coordinate/area checks.
    Param(s):
        (_this select 0) : the position or the area to search for : <ARRAY(2)>, (optional)<ARRAY(4)>
		(_this select 1) : the area to search in : <ARRAY(4)>
    Result(s):
        -
*/

(_this select 0) params [
    ["_xSearched", 0, [0]],
    ["_ySearched", 0, [0]],
    ["_wSearched", 0, [0]],
    ["_hSearched", 0, [0]]
];

(_this select 1) params [
    ["_xArea", 0, [0]],
    ["_yArea", 0, [0]],
    ["_wArea", 0, [0]],
    ["_hArea", 0, [0]]
];

try {
    if (_wSearched <= -1 || _hSearched <= -1) throw false;
    if (_wArea <= 0 || _hArea <= 0) throw false;
    
    if (_wSearched == 0 && _hSearched == 0) then {
        if (
            _xSearched >= _xArea &&
            _ySearched >= _yArea &&
            _xSearched <= (_xArea + _wArea) &&
            _ySearched <= (_yArea + _hArea)
        ) throw true;
    } else {
        if (
            _xSearched >= _xArea &&
            _ySearched >= _yArea &&
            _xSearched <= (_xArea + _wArea) &&
            _ySearched <= (_yArea + _hArea) &&
            (_xSearched + _wSearched) <= (_xArea + _wArea) &&
            (_ySearched + _hSearched) <= (_yArea + _hArea)
        ) throw true;
    };

    throw false;
} catch {
    _exception;
};
