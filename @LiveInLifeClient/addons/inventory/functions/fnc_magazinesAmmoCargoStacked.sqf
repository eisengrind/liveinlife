#include "..\script_component.hpp"

params [
    ["_vehicle", objNull, [objNull]]
];

//in format [["item", ammoCount], ...n]
private _magazines = magazinesAmmoCargo _vehicle;

private _stackedMagazines = [[], []];

for "_mI" from 0 to (count _magazines) - 1 do {
    private _classname = _magazines select _mI select 0;
    private _ammoCount = _magazines select _mI select 1;

    private _foundStackIndex = (_stackedMagazines select 0) find _classname;
    if (_foundStackIndex <= -1) then {
        _stackedMagazines select 0 pushBack _classname;
        _stackedMagazines select 1 pushBack [_ammoCount, 1];
    } else {
        private _exists = false;
        for "_sMI" from 0 to (count (_stackedMagazines select 1 select _foundStackIndex)) - 1 step 2 do {
            private _ammoCountStacked = _stackedMagazines select 1 select _foundStackIndex select _sMI;
            if (_ammoCountStacked == _ammoCount) then {
                _stackedMagazines select 1 select _foundStackIndex set[
                    _sMI + 1,
                    (_stackedMagazines select 1 select _foundStackIndex select (_sMI + 1)) + 1
                ];
                _exists = true;
            };
        };

        if !(_exists) then {
            _stackedMagazines select 1 select _foundStackIndex append [_ammoCount, 1];
        };
    };
};

_stackedMagazines;
