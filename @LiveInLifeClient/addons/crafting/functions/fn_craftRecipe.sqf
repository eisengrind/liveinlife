
try
{
	private _recipeIndex = (lbCurSel 1500);
	if (_recipeIndex <= -1) throw false;

	private _d = (call compile (lbData [1500, (lbCurSel 1500)]));

	private _lCfg = (missionConfigFile >> "CfgRecipes" >> (_d select 0));
	if (isNull _lCfg) throw false;

	private _rCfg = (_lCfg >> "recipes" >> (_d select 1));
	if (isNull _rCfg) throw false;

	if !([_lCfg, _rCfg] call lilc_crafting_fnc_isRecipeCraftable) throw false;

	private _tools = getArray(_rCfg >> "tools"); //_requiredTools
	private _reqs = getArray(_rCfg >> "requirements"); //_requiredItems
	private _res = getArray(_rCfg >> "results"); //_resultedItems
	private _recipeAmount = ([(ctrlText 1401)] call lilc_common_fnc_textToNumber);
	private _recipeTime = getNumber(_rCfg >> "time");
	private _recipeDisplayName = getText(_rCfg >> "displayName");

	if (_recipeAmount <= 0) throw false;
	lilc_action_interrupted = false;

	try
	{
		disableSerialization;
		if !(createDialog "lilc_progressBar") throw false;

		private _ui = (findDisplay 1320);
		private _uiProgressBar = (_ui displayCtrl 1321);
		private _uiProgressBarText = (_ui displayCtrl 1322);

		private _currentVehicle = (vehicle player);
		private _soundTimeout = (time + 5);
		player say3D "lilc_crafting";

		for "_i" from 0 to (_recipeAmount - 1) do
		{
			private _currentTime = (time + _recipeTime);

			{
				if !([(_x select 0), (_x select 2)] call lilc_inventory_fnc_canRemoveMagCount) then
				{
					["Du hast kein benutzbares Werkzeug mehr.", "ERROR"] call lilc_ui_fnc_hint;
					throw false;
				};
			} forEach _tools;

			{
				if (([(_x select 0), [player, (vehicle player)]] call lilc_inventory_fnc_itemCount) < (_x select 1)) then
				{
					["Du hast nicht genügend Items.", "ERROR"] call lilc_ui_fnc_hint;
					throw false;
				};
			} forEach _reqs;

			while
			{
				(_currentTime > time)
			}
			do
			{
				if (_currentVehicle != (vehicle player)) then
				{
					["Du bist nicht mehr im selben Fahrzeug oder bist ausgestiegen."] call lilc_ui_fnc_hint;
					throw false;
				};

				if (_soundTimeout < time) then
				{
					_soundTimeout = (time + _recipeTime);
					player say3D "lilc_crafting";
				};

				if ((animationState player) != "Acts_carFixingWheel" && (vehicle player) == player) then
				{
					player playMoveNow "Acts_carFixingWheel";
				};

				if !([player] call lilc_common_fnc_isAlive) throw false;
				if (lilc_action_interrupted) then
				{
					["Das Crafting wurde abgebrochen!", "ERROR"] call lilc_ui_fnc_hint;
					throw false;
				};

				private _process = (1 - (((_currentTime - time) max 0) / _recipeTime));

				_uiProgressBarText ctrlSetStructuredText parseText format["%1/%2 %3 (%4%5)", (_i + 1), _recipeAmount, _recipeDisplayName, (round (_process * 100)), "%"];
				_uiProgressBar progressSetPosition _process;

				sleep 0.01;
			};

			{
				private _c = (_x select 0);

				if !([_c, (round ((_x select 1) * (1 min (_x select 2) max 0)))] call lilc_inventory_fnc_removeMagCount) then
				{
					["Du hast kein benutzbares Werkzeug mehr.", "ERROR"] call lilc_ui_fnc_hint;
					throw false;
				};
			} forEach _tools;

			{
				private _c = (_x select 0);
				for "_i" from 1 to (_x select 1) do
				{
					if ((random 1) <= (_x select 2)) then
					{
						if (isNull (configFile >> "CfgVehicles" >> _c)) then
						{
							if !([[player, (vehicle player)], _c] call lilc_inventory_fnc_remove) then
							{
								["Du hast nicht genügend Items", "ERROR"] call lilc_ui_fnc_hint;
								throw false;
							};
						}
						else
						{
							["Vehicle removing is currently disabled!", "lilc_crafting"] call lilc_common_fnc_debugLog;
						};
					};
				};
			} forEach _reqs;

			{
				private _c = (_x select 0);

				for "_i" from 1 to (_x select 1) do
				{
					if ((random 1) <= (_x select 2)) then
					{
						if (isNull (configFile >> "CfgVehicles" >> _c)) then
						{
							if ((vehicle player) != player) then
							{
								if !([(vehicle player), _c, -1, false] call lilc_inventory_fnc_addVehicle) then
								{
									if !([player, _c, -1, false, false] call lilc_inventory_fnc_add) then
									{
										["Du hast nicht genügend Platz! Das Crafting wurde abgebrochen.", "ERROR"] call lilc_ui_fnc_hint;
										throw false;
									};
								};
							}
							else
							{
								if !([player, _c, -1, false, false] call lilc_inventory_fnc_add) then
								{
									["Du hast nicht genügend Platz! Das Crafting wurde abgebrochen.", "ERROR"] call lilc_ui_fnc_hint;
									throw false;
								};
							};
						}
						else
						{
							[[player, _c, player, false], "lils_vehicles_fnc_new"] call lilc_common_fnc_sendToServer;
						};
					};
				};
			} forEach _res;

			player say3D "";
			player playMoveNow "AmovPercMstpSnonWnonDnon";

			[(format["Item/Fahrzeug erfolgreich gecrafted!"])] call lilc_ui_fnc_hint;
		};
	}
	catch
	{
		_exception;
	};

	closeDialog 1320;
	lilc_action_interrupted = false;
}
catch
{
	_exception;
};
