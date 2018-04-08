
params [
    ["_package", "", [""]],
    ["_message", "", [""]],
    ["_category", "", [""]]
];

if !(lilc_log_debug_enabled) exitWith {};

if (_category == "") then {
    if (!isDedicated && hasInterface) then {
        _category = "client";
    } else {
        _category = "server";
    };
};

[format["%1: %2", _package, _message], _category] call A3Log;
