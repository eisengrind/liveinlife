
try
{
	disableSerialization;
	if !(isNull (findDisplay 1024)) throw false;
	if !(createDialog "lilcm_login") throw false;

	(findDisplay 1024) displayAddEventHandler ["KeyDown", { if ((_this select 1) == 1) then { true; } else { false; }; }];
	["mainMenu"] call lilc_login_fnc_selectMenu;
	throw true;
}
catch
{
	_exception;
};
