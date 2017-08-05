/*
    Author / Idea: Bryan "Tonic" Boardwine
    Modified: Vincent Heins
*/

private _array = param [0, [], [[]]];
if ((count _array) <= 0) exitWith { (str str _array); };

_array = (toArray (str _array));
for "_i" from 0 to ((count _array) - 1) do {
    private ["_selection"];
    _selection = (_array select _i);
    if ((_i != 0 && _i != ((count _array) - 1))) then {
        if (_selection == 34) then {
            _array set [_i, 96];
        };
    };
};

(str toString _array);
