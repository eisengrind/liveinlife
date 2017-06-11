
[
	"lilce_login_joinDataReceived",
	{
		params [
			["_packageName", "", [""]],
			["_packageData", []]
		];

		try
		{
			if (_packageName != "lilc_factionsInterface_availables") throw false;

			lilc_factionsInterface_items = [];
			lilc_factionsInterface_vehicles = [];

			if ((count _packageData) != 2) throw false;
			lilc_factionsInterface_vehicles = (_packageData select 0);
			lilc_factionsInterface_items = (_packageData select 1);
		}
		catch
		{
			_exception;
		};
	}
] call CBA_fnc_addEventHandler;
