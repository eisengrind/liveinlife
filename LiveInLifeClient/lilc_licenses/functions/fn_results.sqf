
params [
	["_type", -1, [0]],
	["_data", nil]
];

try
{
	if (_type <= -1) throw false;
	
	switch (_type) do
	{
		case 0:
		{
			["Lizenz erfolgreich verteilt."] call lilc_ui_fnc_hint;
		};

		case 1:
		{
			["Du hast eine Lizenz erhalten."] call lilc_ui_fnc_hint;
		};
		
		case 2:
		{
			["Die Lizenz konnte nicht verteilt werden.", "ERROR"] call lilc_ui_fnc_hint;
		};
	};
}
catch
{
	_exception;
};
