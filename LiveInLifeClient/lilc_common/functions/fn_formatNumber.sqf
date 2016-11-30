
params [
    ["_number", 0, ["", 0]],
    ["_length", 0, [0]]
];
if ((typeName _number) == (typeName 0)) then { _number = format["%1", _number]; };
if (_length == 0) exitWith { "0"; };

_count = count _number;
if (_length <= _count) exitWith { _number; };
_number = toArray _number;
reverse _number;

for "_i" from 1 to (_length - _count) do {
    _number pushBack 48;
};
reverse _number;
toString _number;
