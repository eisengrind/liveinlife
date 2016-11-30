
params [
    ["_unit", ObjNull, [ObjNull]]
];
if (isNull _unit) exitWith {};

if ((currentWeapon _unit) != "") then {
    lilc_player_tmpWeapon = currentWeapon _unit;
    player action ["SwitchWeapon", player, player, 100];
    player switchCamera cameraView;
} else {
    if (lilc_player_tmpWeapon in [(primaryWeapon _unit), (secondaryWeapon _unit), (handgunWeapon _unit)]) then {
        player selectWeapon lilc_player_tmpWeapon;
        lilc_player_tmpWeapon = "";
    };
};
