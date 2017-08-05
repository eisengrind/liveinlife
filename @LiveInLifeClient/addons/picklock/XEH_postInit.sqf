
lilc_picklock_engineIndex = -1;
player addEventHandler [
	"GetInMan",
	{
		private _vehicle = (param [2, objNull, [objNull]]);

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
			if ((random 1) < 0.6) then
			{
				[_vehicle, "lilcp_hair", (player getVariable ["lilc_accountID", 0])] call lilc_proofs_fnc_addProof;
			};
		};

		lilc_picklock_engineIndex = (_vehicle addEventHandler [
			"Engine",
			{
				params [
					["_vehicle", objNull, [objNull]],
					["_status", false, [false]]
				];

				if (!_status && ((_vehicle getVariable ["lilc_picklock_engineIgnitionPicklocked", 0]) > 0)) then
				{
					_vehicle setVariable ["lilc_picklock_engineIgnitionPicklocked", 0, true];
				};

				if (_status && ((_vehicle getVariable ["lilc_picklock_picklocked", 0]) > 0)) then
				{
					_vehicle engineOn false;
				};
			}
		]);
	}
];

player addEventHandler [
	"GetOutMan",
	{
		private _vehicle = (param [2, objNull, [objNull]]);

		_vehicle removeEventHandler [
			"Engine",
			lilc_picklock_engineIndex
		];

		if (!(isEngineOn _vehicle) && ((_vehicle getVariable ["lilc_picklock_engineIgnitionPicklocked", 0]) > 0)) then
		{
			_vehicle setVariable ["lilc_picklock_engineIgnitionPicklocked", 0, true];
		};
	}
];

[] spawn {
	if (is3DEN) exitWith {};
	waitUntil { !isNull (findDisplay 46) };
	lilc_picklock_controlIndex = ((findDisplay 46) displayAddEventHandler [
		"KeyDown",
		{
			private _vehicle = (vehicle player);
			if (_vehicle == player) exitWith {};

			private _keyCode = param [1, -1, [0]];

			private _vehicleIsPicklocked = (_vehicle getVariable ["lilc_picklock_picklocked", 0]);
			//false=no lock, true=lock enabled
			private _vehicleSteeringWheelLock = (_vehicle getVariable ["lilc_picklock_steeringWheelLock", 0]);

			//
			private _vehicleEngineIgnitionIsPicklocked = (_vehicle getVariable ["lilc_picklock_engineIgnitionPicklocked", 0]);

			private _result = false;
			switch (true) do
			{
				case (_vehicleEngineIgnitionIsPicklocked <= 0 && _vehicleIsPicklocked > 0 && _vehicleSteeringWheelLock > 0):
				{
					_result = (_keyCode in (
						(actionKeys "MoveForward") +
						(actionKeys "MoveBack") +
						(actionKeys "MoveFastForward") +
						(actionKeys "TurnRight") +
						(actionKeys "TurnLeft") +
						(actionKeys "CarBack") +
						(actionKeys "CarForward") +
						(actionKeys "CarFastForward") +
						(actionKeys "CarLeft") +
						(actionKeys "CarRight") +
						(actionKeys "MoveUp") +
						(actionKeys "MoveDown")
					));
				};

				case (_vehicleEngineIgnitionIsPicklocked <= 0 && _vehicleIsPicklocked > 0):
				{
					_result = (_keyCode in (
						(actionKeys "MoveForward") +
						(actionKeys "MoveBack") +
						(actionKeys "MoveFastForward") +
						(actionKeys "CarBack") +
						(actionKeys "CarForward") +
						(actionKeys "CarFastForward") +
						(actionKeys "MoveUp") +
						(actionKeys "MoveDown")
					));
				};

				case (_vehicleSteeringWheelLock > 0):
				{
					_result = (_keyCode in (
						(actionKeys "TurnRight") +
						(actionKeys "TurnLeft") +
						(actionKeys "CarLeft") +
						(actionKeys "CarRight")
					));
				};
			};

			_result;
		}
	]);
};
