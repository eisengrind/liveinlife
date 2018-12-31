#include "..\script_component.hpp"

params ["_name", "_args"];

_args params ["_ctrl"];

switch (_name) do {
    case QGVAR(input_complete): {
        private _ctrlUnderline = (ctrlParent _ctrl) displayCtrl (_ctrl getVariable [QGVAR(input_line_idc), 0]);
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
