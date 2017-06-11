
try
{
	if !([player] call lilc_common_fnc_isAlive) throw false;
	if !(createDialog "lilcm_crafting") throw false;

	ctrlShow [1003, false];
	ctrlShow [1200, false];
	ctrlShow [1100, false];
	ctrlShow [1201, false];
	ctrlShow [1014, false];
	ctrlShow [1202, false];

	call lilc_crafting_fnc_updateMenuRecipes;

}
catch
{
	_exception;
};
