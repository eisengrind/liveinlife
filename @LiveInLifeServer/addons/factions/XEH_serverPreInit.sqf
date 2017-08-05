
[
	"set_lil_factions_faction",
	{
		_dbCol = [
			"GROUP",
			true,
			false,
			{
				params [
					["_unit", objNull, [objNull]],
					["_value", -1, [0]]
				];

				if (_value <= -1) exitWith {};
				_unit setVariable ["lilc_factionID", _value, true];
				[_unit] call lils_factionsInterface_fnc_setFactionInfo;
			}
		];
		false;
	}
] call lils_login_fnc_addPackage;
