#include "..\script_component.hpp"

params ["_name", "_args"];

_args params ["_ctrl", "_code"];

terminate (_ctrl getVariable [QGVAR(handle), scriptNull]);
