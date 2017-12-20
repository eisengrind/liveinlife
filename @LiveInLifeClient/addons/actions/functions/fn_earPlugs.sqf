
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

if (isNil "lilc_actions_earPlugsStatus") then
{
    lilc_actions_earPlugsStatus = 0;
};

switch (lilc_actions_earPlugsStatus) do
{
    case 0:
    {
        1 fadeSound 0.8;
        lilc_actions_earPlugsStatus = 1;
        hint "Ohrenstöpsel: 80%";
    };
    
    case 1:
    {
        1 fadeSound 0.6;
        lilc_actions_earPlugsStatus = 2;
        hint "Ohrenstöpsel: 60%";
    };

    case 2:
    {
        1 fadeSound 0.4;
        lilc_actions_earPlugsStatus = 3;
        hint "Ohrenstöpsel: 40%";
    };

    case 3:
    {
        1 fadeSound 0.2;
        lilc_actions_earPlugsStatus = 4;
        hint "Ohrenstöpsel: 20%";
    };

    case 4:
    {
        1 fadeSound 1;
        lilc_actions_earPlugsStatus = 0;
        hint "Ohrenstöpsel: 100%";
    };
};
