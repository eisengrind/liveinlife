#include "..\script_component.hpp"

#define ABORT_BUTTON ((findDisplay 49) displayCtrl 104)

params ["_display"];

if !(isNil QGVAR(interruptHandle)) exitWith {};

(_display displayCtrl 104) ctrlEnable false;
(_display displayCtrl 1010) ctrlEnable false;
(_display displayCtrl 122) ctrlEnable false;
(_display displayCtrl 2) ctrlEnable false;

GVAR(abortTime) = time + 10;

(_display displayCtrl 104) ctrlSetText format[
    "Abbrechen in %1",
    [round (GVAR(abortTime) - time)] call BIS_fnc_secondsToString
];

GVAR(interruptHandle) = [{
    ABORT_BUTTON ctrlSetText format[
        "Abbrechen in %1",
        [round (GVAR(abortTime) - time)] call BIS_fnc_secondsToString
    ];

    if (time >= GVAR(abortTime)) exitWith {
        ((findDisplay 40))
        [QGVAR(abortTimeDone), nil] call CBA_fnc_localEvent;
        [GVAR(interruptHandle)] call CBA_fnc_removePerFrameHandler;
        GVAR(interruptHandle) = nil;
        ABORT_BUTTON ctrlSetText "Abbrechen";
        ABORT_BUTTON ctrlEnable true;
    };
}, nil, 0.5] call CBA_fnc_addPerFrameHandler;
