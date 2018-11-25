#include "..\script_component.hpp"

[_this] params [
    ["_data", [], [[]]]
];

if (count _data != 2) exitWith { "{}"; };

private _res = "";

switch (_data select 0) do {
    case "array": {
        if (count (_data select 1) > 0) then {
            _res = "[";
            for "_i" from 0 to (count (_data select 1)) - 1 do {
                if (_i > 0) then {
                    _res = format["%1,", _res];
                };

                private _item = (_data select 1) select _i;

                switch (true) do {
                    case (_item isEqualType ""): {
                        _res = format["%1%2", _res, str _item];
                    };
                    case (_item isEqualType 0): {
                        _res = format["%1%2", _res, _item];
                    };
                    case (_item isEqualType []): {
                        _res = format["%1%2", _res, (_item call FUNC(toJSON))];
                    };
                    default {
                        _res = format["%1null", _res];
                    };
                };
            };
            _res = format["%1]", _res];
        } else {
            _res = "[]";
        };
    };
    case "object": {
        if (count (_data select 1) > 0) then {
            _res = "{";
            for "_i" from 0 to (count (_data select 1)) - 1 do {
                private _item = (_data select 1) select _i;

                if (_item isEqualType [] && count _item == 2 && (_item select 0) isEqualType "" && (_item select 0) != "") then {
                    if (_i > 0) then {
                        _res = format["%1,", _res];
                    };

                    _res = format["%1%2:", _res, str (_item select 0)];

                    switch (true) do {
                        case ((_item select 1) isEqualType ""): {
                            _res = format["%1%2", _res, str (_item select 1)];
                        };
                        case ((_item select 1) isEqualType 0): {
                            _res = format["%1%2", _res, _item select 1];
                        };
                        case ((_item select 1) isEqualType []): {
                            _res = format["%1%2", _res, (_item call FUNC(toJSON))];
                        };
                        default {
                            _res = format["%1null", _res];
                        };
                    };
                };
            };
            _res = format["%1}", _res];
        } else {
            _res = "{}";
        };
    };
};

_res;
