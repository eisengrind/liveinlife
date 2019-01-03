#include "..\script_component.hpp"

params ["_name", "_args"];

_args params ["_display"];

[GVAR(interruptHandle)] call CBA_fnc_removePerFrameHandler;
GVAR(interruptHandle) = nil;
