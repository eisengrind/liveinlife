
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

if ((["lilci_earPlugs_F", player] call lilc_inventory_fnc_itemCount) <= 0) exitWith { hint "Du besitzt keine Ohrstöpsel."; };

if (lilc_player_earPlugsStatus) then {
    lilc_player_earPlugsStatus = false;
    1 fadeSound 1;
} else {
    lilc_player_earPlugsStatus = true;
    1 fadeSound 0.2;
};
