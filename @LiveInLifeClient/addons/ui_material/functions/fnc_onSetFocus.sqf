#include "..\script_component.hpp"

params ["_name", "_args"];

_args params ["_ctrl"];

switch (_name) do {
    case QGVAR(input): {
        private _ctrlUnderline = _ctrl getVariable [QGVAR(underline_ctrl), controlNull];
        private _pos = ctrlPosition _ctrlUnderline;
        _ctrlUnderline ctrlSetPosition [
            _pos select 0,
            _pos select 1,
            _pos select 2,
            pixelH * 3
        ];
        _ctrlUnderline ctrlSetBackgroundColor [RGBA_PRIMARY_COLOR];
        _ctrlUnderline ctrlCommit 0.1;
    };
};
