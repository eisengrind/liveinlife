#include "..\script_component.hpp"

params ["_name", "_args"];

_args params ["_ctrl", "_code"];

_ctrl setVariable [QGVAR(handle), ([_ctrl] spawn {
    disableSerialization;
    params ["_ctrl"];

    _ctrl ctrlSetAngle [90, 0.5, 0.5];

    while { !isNull _ctrl } do {
        _ctrl ctrlSetAngle [290, 0.5, 0.5, false];
        _ctrl ctrlCommit 1;
        waitUntil { ctrlCommitted _ctrl; };

        _ctrl ctrlSetAngle [360, 0.5, 0.5, false];
        _ctrl ctrlCommit 0.2;
        waitUntil { ctrlCommitted _ctrl; };

        _ctrl ctrlSetAngle [0, 0.5, 0.5, false];
        _ctrl ctrlCommit 0;
        waitUntil { ctrlCommitted _ctrl; };

        _ctrl ctrlSetAngle [90, 0.5, 0.5, false];
        _ctrl ctrlCommit 0.2;
        waitUntil { ctrlCommitted _ctrl; };
    };
})];
