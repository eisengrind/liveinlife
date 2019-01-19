#include "../script_component.hpp"

params ["_name", "_args"];

_args params ["_displayOrCtrl"];

switch (_name) do {
    case QGVAR(create_user): {
        (_displayOrCtrl displayCtrl 1400) ctrlSetText getPlayerUID player;
    };

    case "UsernameEdit": {
        _displayOrCtrl setVariable [QGVAR(input_line_idc), 1004];
    };

    case "PasswordEdit": {
        _displayOrCtrl setVariable [QGVAR(input_line_idc), 1007];
    };

    case "RepeatPasswordEdit": {
        _displayOrCtrl setVariable [QGVAR(input_line_idc), 1008];
    };
};
