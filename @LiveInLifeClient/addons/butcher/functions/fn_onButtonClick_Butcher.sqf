
disableSerialization;

try
{
	private _ui = (findDisplay 1300);
	if (isNull _ui) throw false;

	private _uiListVehicles = (_ui displayCtrl 1501);
	private _vehicle = (_uiListVehicles lbData (lbCurSel _uiListVehicles));
	if (_vehicle == "") throw false;

	_vehicle = (_vehicle call BIS_fnc_objectFromNetId);
	if (isNull _vehicle) throw false;
	if !(alive _vehicle) then
	{
		["Das Fahrzeug ist nicht mehr vorhanden.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	private _butcherConfig = ([(_ui getVariable ["lilc_butcher_butcherName", ""])] call lilc_butcher_fnc_getButcherConfig);
	if (isNull _butcherConfig) throw false;

	private _classname = (typeOf _vehicle);
	private _butcherVehicleConfig = (_butcherConfig >> "vehicles" >> _classname);
	if (isNull _butcherVehicleConfig) then
	{
		["Dieses Fahrzeug kann hier nicht auseinander genommen werden.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	private _actionTimeout = getNumber(_butcherVehicleConfig >> "timeout");
	private _time = time;

	closeDialog 1300;
	lilc_action_interrupted = false;
	if !(createDialog "lilc_progressBar") throw false;
	
	private _ui = (findDisplay 1320);
	private _uiProgressBar = (_ui displayCtrl 1321);
	private _uiProgressBarText = (_ui displayCtrl 1322);
	private _soundTimeout = (time + 5);
	player say3D "lilc_crafting";

	while
	{
		
		(_time + _actionTimeout) >= time
	}
	do
	{
		if ((animationState player) != "Acts_carFixingWheel" && (vehicle player) == player) then
		{
			player playMoveNow "Acts_carFixingWheel";
		};
		if (_soundTimeout < time) then
		{
			_soundTimeout = (time + _recipeTime);
			player say3D "lilc_crafting";
		};
		if !([player] call lilc_common_fnc_isAlive) throw false;
		if (lilc_action_interrupted) exitWith {};

		_uiProgressBar progressSetPosition ((time - _time) / _actionTimeout);
		_uiProgressBarText ctrlSetStructuredText parseText format["Schlachte Fahrzeug aus... (%1%2)", (round (((time - _time) / _actionTimeout) * 100)), "%"];
		sleep 0.1;
	};

	if (lilc_action_interrupted) then
	{
		["Die Aktion wurde abgebrochen.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	if (isNull _vehicle || !alive _vehicle) then
	{
		["Das Fahrzeug existiert nicht mehr", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	{
		private _classname = (_x select 0);
		private _amount = (_x select 1);
		private _chance = (_x select 2);

		for "_i" from 1 to _amount do
		{
			if ((random 1) <= _chance) then
			{
				[player, _classname, 0, false, true] call lilc_inventory_fnc_add;
			};
		};
	} forEach (getArray (_butcherVehicleConfig >> "results"));

	closeDialog 0;

	["Das Fahrzeug wurde erfolgreich auseinander genommen."] call lilc_ui_fnc_hint;
	[[player, _vehicle], "lils_vehicles_fnc_delete"] call lilc_common_fnc_sendToServer;

	throw true;
}
catch
{
	player say3D "";
	player playMoveNow "AmovPercMstpSnonWnonDnon";
	lilc_action_interrupted = false;
	_exception;
};
