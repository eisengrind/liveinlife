#include "..\script_component.hpp"

params [
    "_name",
    "_args"
];

_args params [
    "_ctrl"
];

switch (_name) do {
    case QGVAR(transfer): {
        DISPLAY_GARAGE_BUTTON_TRANSFER ctrlEnable false;
        DISPLAY_GARAGE_BUTTON_REVEAL ctrlEnable false;
        DISPLAY_GARAGE_COMBO_PLAYERS ctrlEnable false;
        DISPLAY_GARAGE_LIST_VEHICLES ctrlEnable false;

        TARGET_ENDPOINT_CBA_EVENT(QGVAR(transferVehicle),[ARR_3(player,DISPLAY_GARAGE_COMBO_PLAYERS lbData lbCurSel DISPLAY_GARAGE_COMBO_PLAYERS,DISPLAY_GARAGE_LIST_VEHICLES lbData lbCurSel DISPLAY_GARAGE_LIST_VEHICLES)]);
    };
    case QGVAR(reveal): {
        DISPLAY_GARAGE_BUTTON_TRANSFER ctrlEnable false;
        DISPLAY_GARAGE_BUTTON_REVEAL ctrlEnable false;
        DISPLAY_GARAGE_COMBO_PLAYERS ctrlEnable false;
        DISPLAY_GARAGE_LIST_VEHICLES ctrlEnable false;

        TARGET_ENDPOINT_CBA_EVENT(QGVAR(revealVehicle),[ARR_2(player,DISPLAY_GARAGE_LIST_VEHICLES lbData lbCurSel DISPLAY_GARAGE_LIST_VEHICLES)]);
    };
};
