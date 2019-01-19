#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(uri_scheme) = "https";
GVAR(uri_authority) = "api.example.com:80";

FUNC(arrayReplaceNilWithNull) = {
    params ["_arr"];

    {
        if (isNil "_x") then {
            _arr set [_forEachIndex, objNull];
        } else {
            if (_x isEqualType []) then {
                _arr set [_forEachIndex, [_x] call FUNC(arrayReplaceNilWithNull)];
            };
        };
    } forEach _arr;
    _arr;
};

ADDON = true;
