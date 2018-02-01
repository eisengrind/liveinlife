
params [
    ["_types", "", ["", []]]
];

if (_types isEqualType "") then
{
    _types = [_types];
};

[_types] call lilc_login_fnc_executeUpdatePackages;
