
try
{
	private _recipeIndex = (lbCurSel 1500);
	if (_recipeIndex <= -1) throw false;

	private _recipeName = (lbData [1500, (lbCurSel 1500)]);
	private _recipeConfig = ([_recipeName] call lilc_crafting_fnc_getRecipeConfig);
	if (isNull _recipeConfig) throw false;
	if !([_recipeName] call lilc_crafting_fnc_isRecipeCraftable) throw false;

	private _position = getArray(_recipeConfig >> "position");
	private _radius = 5;
	
	if ((count _position) == 2) then
	{
		_radius = (_position select 1);
	};

	private _vehicleConfig = ([(_position select 0)] call lilc_common_fnc_getClassnameConfig);

	if !(isNull _vehicleConfig) then
	{
		private _nearestObjects = (nearestObjects [player, [(_position select 0)], _radius, true]);
		if ((count _nearestObjects) <= 0) throw false;
	}
	else
	{
		if (((([(_position select 1)] call lilc_common_fnc_getDynamicPosition) select 0) distance (vehicle player)) > _radius) throw false;
	};

	private _requiredItems = ("true" configClasses (_recipeConfig >> "require"));
	private _resultedItems = ("true" configClasses (_recipeConfig >> "result"));
	private _recipeAmount = ([(ctrlText 1401)] call lilc_common_fnc_textToNumber);
	private _recipeTime = getNumber(_recipeConfig >> "time");
	private _recipeDisplayName = getText(_recipeConfig >> "displayName");

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
				if (([(configName _x), [player, (vehicle player)]] call lilc_inventory_fnc_itemCount) < getNumber(_x >> "amount")) then
				{
					["Du hast nicht genügend Items", "ERROR"] call lilc_ui_fnc_hint;
					throw false;
				};
			} forEach _requiredItems;

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
				for "_i" from 0 to ((getNumber(_x >> "amount")) - 1) do
				{
					//apply chance
					if (((random 1) max 0.0001) <= (["chance", "NUMBER", 1, _x] call lilc_common_fnc_getSetting)) then
					{
						if (isNull (configFile >> "CfgVehicles" >> (configName _x))) then
						{
							if !([[player, (vehicle player)], (configName _x)] call lilc_inventory_fnc_remove) then
							{
								["Du hast nicht genügend Items", "ERROR"] call lilc_ui_fnc_hint;
								throw false;
							};
						}
						else
						{
							["vehicles cannot be removed currently", "lilc_crafting"] call lilc_common_fnc_debugLog;
						};
					};
				};
			} forEach _requiredItems;

			{
				for "_i" from 0 to ((getNumber(_x >> "amount")) - 1) do
				{
					//apply chance
					if ((random 1) <= (["chance", "NUMBER", 1, _x] call lilc_common_fnc_getSetting)) then
					{
						if (isNull (configFile >> "CfgVehicles" >> (configName _x))) then
						{
							if ((vehicle player) != player) then
							{
								if !([(vehicle player), (configName _x), -1, false] call lilc_inventory_fnc_addVehicle) then
								{
									if !([player, (configName _x), -1, false, false] call lilc_inventory_fnc_add) then
									{
										["Du hast nicht genügend Platz! Das Crafting wurde abgebrochen.", "ERROR"] call lilc_ui_fnc_hint;
										throw false;
									};
								};
							}
							else
							{
								if !([player, (configName _x), -1, false, false] call lilc_inventory_fnc_add) then
								{
									["Du hast nicht genügend Platz! Das Crafting wurde abgebrochen.", "ERROR"] call lilc_ui_fnc_hint;
									throw false;
								};
							};
						}
						else
						{
							[[player, (configName _x), player, false], "lils_vehicles_fnc_new"] call lilc_common_fnc_sendToServer;
						};
					};
				};
			} forEach _resultedItems;

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
