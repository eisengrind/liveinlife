
/*
    Filename:
        fn_holsterWeapon.sqf
    Author(Original):
		I think Tonic (LifeFramework).
    Author:
        Vincent Heins
    Description:
        This function holsters the weapon of the player...
    Params:
        -
    Result:
        <bool> : whether the current selected weapon was holstered or not
*/

try {
	if (isNull player) throw false;
	if !(isPlayer player) throw false;
	if ((vehicle player) != player) throw false;
	
	if (isNil "lilc_actions_tmpWeapon") then { lilc_actions_tmpWeapon = ""; };
	if ((currentWeapon player) != "" && lilc_actions_tmpWeapon == "") then {
		lilc_actions_tmpWeapon = (currentWeapon player);
		player action ["SwitchWeapon", player, player, 100];
		player switchCamera cameraView;
	} else {
		if (lilc_actions_tmpWeapon in [(primaryWeapon player), (secondaryWeapon player), (handgunWeapon player)]) then {
			player selectWeapon lilc_actions_tmpWeapon;
			lilc_actions_tmpWeapon = "";
		};
	};
	
	throw true;
} catch {
	_exception;
};
