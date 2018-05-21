/*
*/

params [
    ["_parameters", nil],
    ["_functionName", "", [""]]
];

if (isNil "_functionName") exitWith { false; };
if (_functionName == "") exitWith { false; };

private _hcs = [];
_hcs = (entities "HeadlessClient_F") select {
    !isNull _x;
};

try {
    if ((count _hcs) > 0) then {
        private _hc = objNull;
        private _tmp = (_hcs select 0) getVariable ["lils_headless_fps", 60];
        {
            if ((_x getVariable ["lils_headless_fps", 60]) >= _tmp) then {
                _hc = _x;
            };
        } forEach _hcs;

        if (isNull _hc) throw 2;
        throw _hc;
    } else {
        throw 2;
    };
} catch {
    [_parameters, _functionName, _exception] call lilc_common_fnc_send;
};
