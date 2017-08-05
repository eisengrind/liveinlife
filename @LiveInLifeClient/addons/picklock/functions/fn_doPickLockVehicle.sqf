
try
{
	if (isNil "lilc_picklock_doPickLockVehicle_task") then
	{
		lilc_picklock_doPickLockVehicle_task = scriptNull;
	};
	if !(isNull lilc_picklock_doPickLockVehicle_task) throw false;

	lilc_picklock_doPickLockVehicle_task = (_this spawn {
		params [
			["_vehicle", objNull, [objNull]],
			["_item", "", [""]],
			["_eventTime", [], [[], 0]],
			["_eventChance", 0, [0]]
		];

		private _eventHandlerIndex = ((findDisplay 46) displayAddEventHandler [
			"KeyDown",
			{
				if ((_this select 1) in ((actionKeys "MoveBack") + (actionKeys "MoveForward") + (actionKeys  "MoveFastForward") + (actionKeys "TurnLeft") + (actionKeys "TurnRight") + (actionKeys "GetOver"))) then
				{
					lilc_action_interrupted = true;
				};
				false;
			}
		]);

		lilc_action_interrupted = false;
		try
		{
			private _itemConfig = ([_item] call lilc_common_fnc_getClassnameConfig);
			if (isNull _itemConfig) throw false;

			private _randomEventTime = (random _eventTime);
			private _randomEventChance = (random 1);

			private _startTime = (time + _randomEventTime);

			player playMoveNow "Acts_carFixingWheel";

			while
			{
				(_startTime > time)
			}
			do
			{
				if (lilc_action_interrupted) exitWith {};
				if ((animationState player) != "Acts_carFixingWheel") then
				{
					player playMoveNow "Acts_carFixingWheel";
				};

				titleText["Breche Fahrzeug auf...", "PLAIN", 2];

				sleep 0.1;
			};

			titleText["", "PLAIN", 0.01];
			player playMoveNow "AmovPercMstpSnonWnonDnon";

			if (lilc_action_interrupted) then
			{
				["Aktion wurde abgebrochen.", "ERROR"] call lilc_ui_fnc_hint;
				throw false;
			};

			if (_randomEventChance <= _eventChance) then
			{
				["Fahrzeug wurde aufgebrochen."] call lilc_ui_fnc_hint;
				
				[_vehicle, 0] call lilc_vehicles_fnc_lock;
				_vehicle setVariable ["lilc_picklock_picklocked", (player getVariable ["lilc_accountID", 0]), true];
			}
			else
			{
				[(format["Dein/e %1 ist kaputt gegangen.", getText(_itemConfig >> "displayName")]), "ERROR"] call lilc_ui_fnc_hint;
				[player, _item] call lilc_inventory_fnc_remove;
			};

			if ((["lilci_disposableGloves_F", player] call lilc_inventory_fnc_itemCount) > 0) then
			{
				if ((random 1) < 0.05) then
				{
					["Deine Handschuhe sind kaputt gegangen.", "WARNING"] call lilc_ui_fnc_hint;
					[player, "lilci_disposableGloves_F"] call lilc_inventory_fnc_remove;
					[_vehicle, "lilcp_fingerprint", (player getVariable ["lilc_accountID", 0])] call lilc_proofs_fnc_addProof;
				};
			}
			else
			{
				[_vehicle, "lilcp_fingerprint", (player getVariable ["lilc_accountID", 0])] call lilc_proofs_fnc_addProof;
			};

			if ((headgear player) != "") then
			{
				if ((random 1) < 0.1) then
				{
					[_vehicle, "lilcp_hair", (player getVariable ["lilc_accountID", 0])] call lilc_proofs_fnc_addProof;
				};
			}
			else
			{
				if ((random 1) < 0.6) then
				{
					[_vehicle, "lilcp_hair", (player getVariable ["lilc_accountID", 0])] call lilc_proofs_fnc_addProof;
				};
			};

			throw true;
		}
		catch
		{
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", _eventHandlerIndex];
			lilc_action_interrupted = false;
			_exception;
		};
	});
}
catch
{
	_exception;
};
