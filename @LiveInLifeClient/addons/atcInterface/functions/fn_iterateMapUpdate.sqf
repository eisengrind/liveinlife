
try
{
	if !([player] call lilc_common_fnc_isAlive) throw false;

	disableSerialization;
	private _ui = (findDisplay 1420);
	private _uiMap = (_ui displayCtrl 1000);
	private _uiGroupInformations = (_ui displayCtrl 2300);
	private _uiGroupInformationsTextCallsign = (_uiGroupInformations controlsGroupCtrl 1006);
	private _uiGroupInformationsTextType = (_uiGroupInformations controlsGroupCtrl 1007);
	private _uiGroupInformationsTextHeading = (_uiGroupInformations controlsGroupCtrl 1008);
	private _uiGroupInformationsTextTransponder = (_uiGroupInformations controlsGroupCtrl 1009);
	private _uiGroupInformationsTextHeightASL = (_uiGroupInformations controlsGroupCtrl 1010);
	private _uiGroupInformationsTextHeightATL = (_uiGroupInformations controlsGroupCtrl 1011);
	private _uiGroupInformationsTextFrequency = (_uiGroupInformations controlsGroupCtrl 1012);
	_uiGroupInformations ctrlShow false;

	lilc_atcInterface_controls = [];
	private _markers = [];
	
	while
	{
		true
	}
	do
	{
		if (isNull _ui) throw false;
		if !([player] call lilc_common_fnc_isAlive) throw false;

		private _currentVehicles = (allMissionObjects "AllVehicles") select
		{
			private _vehicle = _x;
			(isEngineOn _vehicle) &&
			!(
				((getPosATL _vehicle) select 2) < 45 &&
				!(_vehicle getVariable ["lilc_transponder_status", false]) &&
				(({ (_vehicle inArea _x) } count lilc_atcInterface_airports) <= 0)
			) &&
			(_vehicle isKindOf "Air")
		};

		{
			private _control = _x;

			try
			{
				{
					if ((20000 + (_x getVariable ["lilc_uniqueObjectID", (parseNumber (((_x call BIS_fnc_netId) splitString ":") select 1))])) == (ctrlIDC _control)) throw true;
				} forEach _currentVehicles;
				throw false;
			}
			catch
			{
				if !(_exception) then
				{
					ctrlDelete _control;
				};
			};
		} forEach lilc_atcInterface_controls;

		{
			private _vehicle = _x;
			private _vehicleID = (_vehicle getVariable ["lilc_vehicleID", 0]);
			private _vehicleCallSign = (_vehicle getVariable ["lilc_garage_callsign", "Unbekannte Kennung"]);
			private _vehicleFactionID = (_vehicle getVariable ["lilc_factionID", 0]);
			private _vehicleAccountID = (_vehicle getVariable ["lilc_accountID", 0]);
			private _vehicleUniqueID = (_vehicle getVariable ["lilc_uniqueObjectID", (parseNumber (((_vehicle call BIS_fnc_netId) splitString ":") select 1))]);
			private _vehiclePosition = (position _vehicle);
			private _vehicleDir = (round (getDir _vehicle));
			private _vehicleHeightASL = ((getPosASL _vehicle) select 2);

			if ((20000 + _vehicleUniqueID) in (lilc_atcInterface_controls apply {(ctrlIDC _x)})) then
			{
				private _control = ((lilc_atcInterface_controls select { ((ctrlIDC _x) == (20000 + _vehicleUniqueID)) }) select 0);
				_control setVariable ["lilc_control_position", _vehiclePosition];
				_control setVariable ["lilc_control_vehicle", _vehicle];
				_control setVariable ["lilc_control_direction", _vehicleDir];
				_control setVariable ["lilc_control_heightASL", _vehicleHeightASL];
				_control setVariable ["lilc_control_callsign", _vehicleCallSign];

				(_control controlsGroupCtrl 1007) ctrlSetText _vehicleCallSign;
				(_control controlsGroupCtrl 1008) ctrlSetText (format["%1° /", _vehicleDir/*, ([_vehicleDir] call BIS_fnc_)*/]);
				(_control controlsGroupCtrl 1009) ctrlSetText format["%1 ft", ([((getPosASL _x) select 2), 0, 4, 2] call BIS_fnc_convertUnits)];
			}
			else
			{
				private _control = (_ui ctrlCreate ["lilcm_atcInterface_InfoEntry", (20000 + _vehicleUniqueID)]);
				_control setVariable ["lilc_control_position", _vehiclePosition];
				_control setVariable ["lilc_control_vehicle", _vehicle];
				_control setVariable ["lilc_control_direction", _vehicleDir];
				_control setVariable ["lilc_control_heightASL", _vehicleHeightASL];
				_control setVariable ["lilc_control_callsign", _vehicleCallSign];
				_control ctrlSetPosition (_uiMap ctrlMapWorldToScreen _vehiclePosition);
				_control ctrlCommit 0;

				(_control controlsGroupCtrl 1007) ctrlSetText _vehicleCallSign;
				(_control controlsGroupCtrl 1008) ctrlSetText (format["%1° /", _vehicleDir/*, ([_vehicleDir] call BIS_fnc_)*/]);
				(_control controlsGroupCtrl 1009) ctrlSetText ([((getPosASL _x) select 2), 0, 4, 2] call BIS_fnc_convertUnits);
				lilc_atcInterface_controls pushBack _control;
			};
		} forEach _currentVehicles;

		if (lilc_atcInterface_currentPlaneControl != -1) then
		{
			private _control = (_ui displayCtrl lilc_atcInterface_currentPlaneControl);
			private _vehicle = (_control getVariable ["lilc_control_vehicle", objNull]);
			private _vehicleConfig = ([(typeOf _vehicle)] call lilc_common_fnc_getClassnameConfig);
			private _vehicleHeight = (_control getVariable ["lilc_control_heightASL", 0]);
			private _vehiclePosition = (_control getVariable ["lilc_control_position", []]);
			private _vehicleTransponderCode = ([_vehicle] call lilc_transponder_fnc_getTransponderCode);

			private _vehicleConfig = ([(typeOf _vehicle)] call lilc_common_fnc_getClassnameConfig);

			_uiGroupInformationsTextCallsign ctrlSetText (_control getVariable ["lilc_control_callsign", "Unbekannte Kennung"]);
			_uiGroupInformationsTextType ctrlSetText format["%1", getText(_vehicleConfig >> "displayName")];
			_uiGroupInformationsTextHeading ctrlSetText format["%1° / <heading>", (_control getVariable ["lilc_control_direction", 0])];
			_uiGroupInformationsTextTransponder ctrlSetText format["%1 (%2)", _vehicleTransponderCode, ([_vehicleTransponderCode] call lilc_transponder_fnc_getTransponderCodeName)];
			_uiGroupInformationsTextHeightASL ctrlSetText format["%1 ft", ([_vehicleHeight, 0, 4, 1] call BIS_fnc_convertUnits)];
			_uiGroupInformationsTextHeightATL ctrlSetText format["%1 m", (round ((ASLToAGL [0, 0, _vehicleHeight]) select 2))];
			_uiGroupInformationsTextFrequency ctrlSetText format["%1 Hz", ([_vehicle, "driver_radio_settings"] call TFAR_fnc_getLrFrequency)];
		};

		sleep 0.4;
	};
}
catch
{
	_exception;
};
