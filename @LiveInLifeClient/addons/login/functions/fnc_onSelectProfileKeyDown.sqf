#include "..\script_component.hpp"
#include "\A3\ui_f\hpp\defineDIKCodes.inc"

params ["_name", "_args"];

_args params ["_display", "_key", "_shift", "_ctrl", "_alt"];

private _return = true;

if (_key == DIK_ESCAPE) then {
    _return = false;
};

_return;
