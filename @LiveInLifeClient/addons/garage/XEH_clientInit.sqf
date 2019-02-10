#include "script_component.hpp"

[QGVAR(garageLoadVehicles), {
    lbClear DISPLAY_GARAGE_LIST_VEHICLES;
    DISPLAY_GARAGE_LIST_VEHICLES lbAdd ("STR_lilc_garages_garage_loadingVehicles" call BIS_fnc_localize);

    0 spawn {
        private _req = [
            DISPLAY_GARAGE getVariable [QGVAR(garageAlias), ""]
        ] call EFUNC(api_garages,getGarageByAlias);

        if REQ_IS_OK(_req) then {
            private _body = REQ_GET_BODY(_req);

            private _garageID = [_body, "uuid"] call a3uf_json_fnc_get;

            private _vehicles = [];

            while { count (_body select 1) > 0; } do {
                private _req = [[
                    ["garage_id", _garageID],
                    ["offset", 0],
                    ["limit", 20],
                    ["parked", true],
                    ["destroyed", false]
                ]] call EFUNC(api_vehicles,getVehicles);

                if REQ_IS_OK(_req) then {
                    _body = REQ_GET_BODY(_req);

                    _vehicles append (_body select 1);
                } else {
                    _body = [nil, []];
                }
            };

            lbClear DISPLAY_GARAGE_LIST_VEHICLES;
            {
                private _vehicle = _x;
                private _cfg = (configFile >> "CfgVehicles" >> [_vehicle, "classname"] call a3uf_json_fnc_get);
                private _nick = [_vehicle, "nick"] call a3uf_json_fnc_get;

                private _index = DISPLAY_GARAGE_LIST_VEHICLES lbAdd (if (_nick == "") then {
                    getText(_cfg >> "displayName");
                } else {
                    _nick;
                });
                DISPLAY_GARAGE_LIST_VEHICLES lbSetData [_index, [_vehicle, "uuid"] call a3uf_json_fnc_get];
                DISPLAY_GARAGE_LIST_VEHICLES lbSetPicture [_index, getText(_cfg >> "picture")];
            } forEach _vehicles;
        };
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(transferFailed), {
    ["STR_lilc_garages_transferFailed"] call EFUNC(ui,hint);
    DISPLAY_GARAGE_BUTTON_TRANSFER ctrlEnable true;
    DISPLAY_GARAGE_BUTTON_REVEAL ctrlEnable true;
    DISPLAY_GARAGE_COMBO_PLAYERS ctrlEnable true;
    DISPLAY_GARAGE_LIST_VEHICLES ctrlEnable true;
}] call CBA_fnc_addEventHandler;

[QGVAR(revealFailed), {
    ["STR_lilc_garages_revealFailed"] call EFUNC(ui,hint);
    closeDialog 2020;
}] call CBA_fnc_addEventHandler;

[QGVAR(transferred), {
    ["STR_lilc_garages_transferred"] call EFUNC(ui,hint);
    [QGVAR(garageLoadVehicles)] call CBA_fnc_localEvent;

    DISPLAY_GARAGE_BUTTON_TRANSFER ctrlEnable true;
    DISPLAY_GARAGE_BUTTON_REVEAL ctrlEnable true;
    DISPLAY_GARAGE_COMBO_PLAYERS ctrlEnable true;
    DISPLAY_GARAGE_LIST_VEHICLES ctrlEnable true;
}] call CBA_fnc_addEventHandler;

[QGVAR(transferReceived), {
    ["STR_lilc_garages_transferReceived"] call EFUNC(ui,hint);
}]

[QGVAR(revealed), {
    ["STR_lilc_garages_revealed"] call EFUNC(ui,hint);
    closeDialog 2020;
}] call CBA_fnc_addEventHandler;
