
/*
    Filename:
        fn_earPlugs.sqf
    Author:
        Vincent Heins
    Description:
        Function to insert or remove earPlugs.
    Params:
        -
    Result:
        -
*/

if ((["lilci_earPlugs_F", player] call lilc_inventory_fnc_itemCount) <= 0) exitWith
{
    ["Du besitzt keine Ohrenstöpsel.", "ERROR"] call lilc_ui_fnc_hint; //STR_lilc_actions_ScriptText_noEarplugs
};

if (lilc_player_earPlugsStatus) then {
    lilc_player_earPlugsStatus = false;
    1 fadeSound 1;
} else {
    lilc_player_earPlugsStatus = true;
    1 fadeSound 0.2;
};
