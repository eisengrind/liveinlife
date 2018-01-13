
params [
    ["_classname", "", [""]],
    ["_category", "", [""]]
];

try {
    if (isNil "_classname") throw false;
    if (isNil "_category") throw false;

    if (_category == ([_classname] call lilc_shops_fnc_getCategory)) throw true;
    throw false;
} catch {
    _exception;
};
