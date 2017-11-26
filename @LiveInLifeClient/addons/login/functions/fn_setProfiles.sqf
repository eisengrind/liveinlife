
private _result = param [0, [], [[], false]];

if ((typeName false) == (typeName _result)) exitWith { endMission "END6"; };
lilc_login_profiles = _result;

if (lilc_login_createProfile) then
{
	["mainMenu"] call lilc_login_fnc_selectMenu;
	lilc_login_createProfile = false;
};
