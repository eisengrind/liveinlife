#include "..\script_component.hpp"

params ["_name", "_args"];

_args params [
    "_display"
];

switch (_name) do {
    case QGVAR(garage): {
        [] spawn {
            lbClear DISPLAY_GARAGE_COMBO_PLAYERS;
            {
                if ([_x] call EFUNC(common,isAlive)) then {
                    DISPLAY_GARAGE_COMBO_PLAYERS lbSetData [
                        DISPLAY_GARAGE_COMBO_PLAYERS lbAdd (if ([_x] call EFUNC(login,unitIsKnown)) then {
                            [_x, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName;
                        } else {
                            "Unbekannte Person";
                        }),
                        _x call BIS_fnc_netId
                    ];
                };
            } forEach ((player nearEntities ["Man", 6]) - [player]);
            lbSort [DISPLAY_GARAGE_COMBO_PLAYERS, "ASC"];

            [QGVAR(garageLoadVehicles)] call CBA_fnc_localEvent;
        };
    };
};
