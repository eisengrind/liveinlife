#include "..\script_component.hpp"

params [
    ["_locode", "", [""]]
];

localize format[LSTRING(locode_%1), _locode];
