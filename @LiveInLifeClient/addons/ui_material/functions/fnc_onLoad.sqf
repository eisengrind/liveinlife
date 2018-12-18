#include "..\script_component.hpp"

params ["_name", "_args"];

_args params ["_ctrl"];

switch (_name) do {
    case QGVAR(input): {
        private _ctrlTitle = (ctrlParent _ctrl) ctrlCreate [QGVAR(input_title), -1];
        private _posTitle = ctrlPosition _ctrlTitle;

        _ctrlTitle ctrlSetStructuredText parseText ctrlText _ctrl;
        _ctrl ctrlSetText "";

        private _pos = ctrlPosition _ctrl;
        _ctrlTitle ctrlSetPosition [
            (_pos select 0) + 0.006,
            (_pos select 1) - 0.05,
            _pos select 2,
            _posTitle select 3
        ];
        _ctrlTitle ctrlCommit 0;

        private _ctrlUnderline = (ctrlParent _ctrl) ctrlCreate [QGVAR(input_underline), -1];
        _ctrlUnderline ctrlSetPosition [
            _pos select 0,
            (_pos select 1) + 0.07,
            _pos select 2,
            pixelH
        ];
        _ctrlUnderline ctrlCommit 0;
        _ctrl setVariable [QGVAR(underline_ctrl), _ctrlUnderline];
    };
};
