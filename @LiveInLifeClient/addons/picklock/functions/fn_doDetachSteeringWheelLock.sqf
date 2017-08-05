
try
{
	if (isNil "lilc_picklock_doDetachSteeringWheel_task") then
	{
		lilc_picklock_doDetachSteeringWheel_task = scriptNull;
	};
	if !(isNull lilc_picklock_doDetachSteeringWheel_task) throw false;

	lilc_picklock_doDetachSteeringWheel_task = (_this spawn {
		params [
			["_vehicle", objNull, [objNull]]
		];

		try
		{
			if (isNull _vehicle) throw false;
			if !([_vehicle, ["LandVehicle"]] call lilc_common_fnc_isKindOf) throw false;

			private _steeringWheelLockActive = (_vehicle getVariable ["lilc_picklock_steeringWheelLock", 0]);
			if (_steeringWheelLockActive <= 0) then
			{
				["Dieses Fahrzeug besitzt keine Lenkradsperre.", "ERROR"] call lilc_ui_fnc_hint;
				throw false;
			};
			
			if !(createDialog "lilc_progressBar") throw false;
			
			disableSerialization;
			private _ui = (findDisplay 1320);
			private _uiProgressBar = (_ui displayCtrl 1321);
			private _uiProgressBarText = (_ui displayCtrl 1322);

			private _timeout = 10;
			private _time = (time + _timeout);

			player playMoveNow "Acts_carFixingWheel";

			while
			{
				(_time > time)
			}
			do
			{
				if (isNull _ui) exitWith {};
				if ((animationState player) != "Acts_carFixingWheel") then
				{
					player playMoveNow "Acts_carFixingWheel";
				};
				if !([player] call lilc_common_fnc_isAlive) exitWith {};

				_timeDiff = (_timeout - (_time - time));
				_uiProgressBar progressSetPosition (_timeDiff / _timeout);
				_uiProgressBarText ctrlSetStructuredText parseText format["Lenkradsperre wird abmontiert... (%1%2)", (round ((_timeDiff / _timeout) * 100)), "%"];

				sleep 0.1;
			};

			player playMoveNow "AmovPercMstpSnonWnonDnon";
			closeDialog 0;

			if (isNull _ui) then
			{
				["Die Aktion wurde abgebrochen.", "ERROR"] call lilc_ui_fnc_hint;
				throw false;
			};

			if !([player, "lilci_steeringWheelLock_F", 0, false, true] call lilc_inventory_fnc_add) then
			{
				["Die Lenkradsperre kontte nicht hinzugefügt werden"] call lilc_ui_fnc_hint;
				throw false;
			};

			_vehicle setVariable ["lilc_picklock_steeringWheelLock", 0, true];

			["Die Lenkradsperre wurde abmontiert."] call lilc_ui_fnc_hint;

			throw true;
		}
		catch
		{
			_exception;
		};
	});
}
catch
{
	_exception;
};
