
[_this] params [
    ["_bankAccount", [], [[]]]
];

if ((count _bankAccount) > 0) then {
    ["main"] call lilc_atm_fnc_selectMenu;
} else {
    ["main_failed"] call lilc_atm_fnc_selectMenu;
};
