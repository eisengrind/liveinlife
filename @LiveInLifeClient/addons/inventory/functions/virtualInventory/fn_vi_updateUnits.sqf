
lbClear 1408;
{
	if (!isNull _x && isPlayer _x) then
	{
		private _index = (lbAdd [
			1408,
			(if ([_x] call lilc_login_fnc_unitIsKnown) then { ([_x, "<FIRSTNAME> <LASTNAME>"] call lilc_login_fnc_formatName); } else { "Unbekannte Person"; })
		]);
		lbSetValue [1408, _index, (_x getVariable ["lilc_accountID", 0])];
	};
} forEach ((player nearEntities ["Man", 6]) - [player]);
lbSort [1408, "ASC"];
