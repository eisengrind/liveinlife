/*
    Author / Idea: Bryan "Tonic" Boardwine
    Modified: Vincent Heins
*/
_array = param [0, "", [""]];
if (_array == "") exitWith { []; };

_array = (toArray _array);

for "_i" from 0 to ((count _array) - 1) do {
    private ["_selection"];
    _selection = (_array select _i);
    if (_selection == 96) then {
        _array set [_i, 39];
    };
};

call compile format["%1", toString(_array)];
