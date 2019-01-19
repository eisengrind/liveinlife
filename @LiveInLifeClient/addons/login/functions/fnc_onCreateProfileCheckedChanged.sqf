#include "..\script_component.hpp"

params ["_name", "_args"];

_args params ["_ctrl", "_checked"];

switch (_name) do {
    case "MaleCheckbox": {
        private _display = ctrlParent _ctrl;
        private _femaleCheckboxCtrl = (_display displayCtrl 2300) controlsGroupCtrl 2801;
        if (_checked == 1) then {
            _display setVariable [QGVAR(sex), 0];
            _femaleCheckboxCtrl cbSetChecked false;
        } else {
            _display setVariable [QGVAR(sex), 1];
            _femaleCheckboxCtrl cbSetChecked true;
        };
    };
    case "FemaleCheckbox": {
        private _display = ctrlParent _ctrl;
        private _maleCheckboxCtrl = (_display displayCtrl 2300) controlsGroupCtrl 2800;
        if (_checked == 1) then {
            _display setVariable [QGVAR(sex), 1];
            _maleCheckboxCtrl cbSetChecked false;
        } else {
            _display setVariable [QGVAR(sex), 0];
            _maleCheckboxCtrl cbSetChecked true;
        };
    };
};
