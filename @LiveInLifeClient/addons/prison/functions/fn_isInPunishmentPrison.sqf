
params [
	["_punishmentName", "", [""]]
];

try
{
	if (([_punishmentName] call lilc_prison_fnc_getCurrentPrison) == "") throw false;
	
	throw true;
}
catch
{
	_exception;
};
