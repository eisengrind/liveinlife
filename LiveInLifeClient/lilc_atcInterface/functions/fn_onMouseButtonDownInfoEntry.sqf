
disableSerialization;
params [
	["_control", controlNull, [controlNull]]
];

try
{
	if (isNil "lilc_atcInterface_currentPlaneControl") then
	{
		lilc_atcInterface_currentPlaneControl = -1;
	};

	private _ui = (findDisplay 1420);
	if (isNull _ui) throw false;
	
	private _uiGroupInformations = (_ui displayCtrl 2300);
	_uiGroupInformations ctrlShow true;

	private _vehicle = (_control getVariable ["lilc_control_vehicle", objNull]);
	private _vehicleConfig = ([(typeOf _vehicle)] call lilc_common_fnc_getClassnameConfig);
	private _vehicleHeight = (_control getVariable ["lilc_control_heightASL", 0]);
	private _vehiclePosition = (_control getVariable ["lilc_control_position", []]);
	private _vehicleTransponderCode = ([_vehicle] call lilc_transponder_fnc_getTransponderCode);

	(_uiGroupInformations controlsGroupCtrl 1006) ctrlSetText (_control getVariable ["lilc_control_callsign", ""]);
	(_uiGroupInformations controlsGroupCtrl 1007) ctrlSetText format["%1", getText(_vehicleConfig >> "displayName")];
	(_uiGroupInformations controlsGroupCtrl 1008) ctrlSetText format["%1° / <heading>", (_control getVariable ["lilc_control_direction", 0])];
	(_uiGroupInformations controlsGroupCtrl 1009) ctrlSetText format["%1 (%2)", _vehicleTransponderCode, ([_vehicleTransponderCode] call lilc_transponder_fnc_getTransponderCodeName)];
	(_uiGroupInformations controlsGroupCtrl 1010) ctrlSetText format["%1 ft", ([_vehicleHeight, 0, 4, 1] call BIS_fnc_convertUnits)];
	(_uiGroupInformations controlsGroupCtrl 1011) ctrlSetText format["%1 m", (round ((ASLToAGL [0, 0, _vehicleHeight]) select 2))];
	(_uiGroupInformations controlsGroupCtrl 1012) ctrlSetText format["%1 Hz", ([_vehicle, "driver_radio_settings"] call TFAR_fnc_getLrFrequency)];

	(_control controlsGroupCtrl 1007) ctrlSetTextColor [1, (107/255), (107/255), 1];
	(_control controlsGroupCtrl 1008) ctrlSetTextColor [1, (107/255), (107/255), 1];
	(_control controlsGroupCtrl 1009) ctrlSetTextColor [1, (107/255), (107/255), 1];

	lilc_atcInterface_currentPlaneControl = (ctrlIDC _control);
}
catch
{
	_exception;
};
