
params [
	["_vehicle", objNull, [objNull]]
];

if !([_vehicle] call lilc_repair_fnc_canRepairVehicleEasy) exitWith {};
if ((count crew _vehicle) > 0) exitWith
{
	["Es sitzen noch Personen im Fahrzeug.", "ERROR"] call lilc_ui_fnc_hint;
};
if ((["Toolkit"] call lilc_inventory_fnc_itemCount) <= 0) exitWith
{
	["Du besitzt kein Toolkit!", "ERROR"] call lilc_ui_fnc_hint;
};

lilc_action_active = true;

try
{
	if !(createDialog "lilc_progressBar") throw false;

	private _ui = (findDisplay 1320);
	private _uiProgressBar = (_ui displayCtrl 1321);
	private _uiProgressBarText = (_ui displayCtrl 1322);

	private _time = time;
	private _timeout = lilc_repair_vehicle_timeout;
	lilc_action_interrupted = false;

	while
	{
		(_time + _timeout) > time
	}
	do
	{
		
		if (lilc_action_interrupted) exitWith {};
		if ((vehicle player) != player) exitWith {};
		if ((animationState player) != "Acts_carFixingWheel") then
		{
			player playMoveNow "Acts_carFixingWheel";
		};

		private _t = ((time - _time) / _timeout);
		_uiProgressBar progressSetPosition _t;
		_uiProgressBarText ctrlSetStructuredText parseText format["Fahrzeug wird repariert (%1%2)", (round (_t * 100)), "%"];
	};

	if (lilc_action_interrupted) then
	{
		["Die Reperatur wurde abgebrochen.", "ERROR"] call lilc_ui_fnc_hint;
		player switchMove "";
		lilc_action_interrupted = false;
		throw false;
	};
	if ((vehicle player) != player) then
	{
		["Die Reperatur wurde abgebrochen.", "ERROR"] call lilc_ui_fnc_hint;
		lilc_action_interrupted = false;
		throw false;
	};

	if !([player, "Toolkit"] call lilc_inventory_fnc_remove) then
	{
		player switchMove "";
		lilc_action_interrupted = false;
		["Die Reperatur wurde abgebrochen.", "ERROR"] call lilc_ui_fnc_hint;
		throw false;
	};

	player switchMove "";
	lilc_action_interrupted = false;
	["Das Fahrzeug wurde erfolgreich repariert."] call lilc_ui_fnc_hint;
	_vehicle setDamage 0;
	closeDialog 1320;
}
catch
{
	_exception;
};

lilc_action_active = false;
