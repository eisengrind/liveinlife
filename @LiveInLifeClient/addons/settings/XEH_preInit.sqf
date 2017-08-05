
private _enableDistance = (["viewDistance_foot_enableSetting", "BOOL", true] call lilc_common_fnc_getSetting);
if (_enableDistance) then
{
	private _minDistance = (["viewDistance_foot_min", "NUMBER", 0] call lilc_common_fnc_getSetting);
	private _maxDistance = (["viewDistance_foot_max", "NUMBER", 0] call lilc_common_fnc_getSetting);
	private _defaultDistance = (["viewDistance_foot_default", "NUMBER", 0] call lilc_common_fnc_getSetting);
	[
		"lilc_setting_settings_viewDistance_foot",
		"SLIDER",
		"Sichtweite (Zu Fuß)",
		"LiveInLife",
		[_minDistance, _maxDistance, _defaultDistance, 0],
		0,
		{
			["foot", _this, true, ((vehicle player) == player)] call lilc_settings_fnc_setViewDistance;
		}
	] call CBA_Settings_fnc_init;
};

private _enableDistance = (["viewDistance_foot_objects_enableSetting", "BOOL", true] call lilc_common_fnc_getSetting);
if (_enableDistance) then
{
	private _minDistance = (["viewDistance_foot_objects_min", "NUMBER", 0] call lilc_common_fnc_getSetting);
	private _maxDistance = (["viewDistance_foot_objects_max", "NUMBER", 0] call lilc_common_fnc_getSetting);
	private _defaultDistance = (["viewDistance_foot_objects_default", "NUMBER", 0] call lilc_common_fnc_getSetting);
	[
		"lilc_setting_settings_viewDistance_foot_objects",
		"SLIDER",
		"Objektsichtweite (Zu Fuß)",
		"LiveInLife",
		[_minDistance, _maxDistance, _defaultDistance, 0],
		0,
		{
			["foot", _this, true, ((vehicle player) == player)] call lilc_settings_fnc_setObjectViewDistance;
		}
	] call CBA_Settings_fnc_init;
};

private _enableDistance = (["viewDistance_wheeled_enableSetting", "BOOL", true] call lilc_common_fnc_getSetting);
if (_enableDistance) then
{
	private _minDistance = (["viewDistance_wheeled_min", "NUMBER", 0] call lilc_common_fnc_getSetting);
	private _maxDistance = (["viewDistance_wheeled_max", "NUMBER", 0] call lilc_common_fnc_getSetting);
	private _defaultDistance = (["viewDistance_wheeled_default", "NUMBER", 0] call lilc_common_fnc_getSetting);
	[
		"lilc_setting_settings_viewDistance_wheeled",
		"SLIDER",
		"Sichtweite (Fahrzeug)",
		"LiveInLife",
		[_minDistance, _maxDistance, _defaultDistance, 0],
		0,
		{
			["wheeled", _this, true, ((vehicle player) isKindOf "LandVehicle")] call lilc_settings_fnc_setViewDistance;
		}
	] call CBA_Settings_fnc_init;
};

private _enableDistance = (["viewDistance_wheeled_objects_enableSetting", "BOOL", true] call lilc_common_fnc_getSetting);
if (_enableDistance) then
{
	private _minDistance = (["viewDistance_wheeled_objects_min", "NUMBER", 0] call lilc_common_fnc_getSetting);
	private _maxDistance = (["viewDistance_wheeled_objects_max", "NUMBER", 0] call lilc_common_fnc_getSetting);
	private _defaultDistance = (["viewDistance_wheeled_objects_default", "NUMBER", 0] call lilc_common_fnc_getSetting);
	[
		"lilc_setting_settings_viewDistance_wheeled_objects",
		"SLIDER",
		"Objektsichtweite (Fahrzeug)",
		"LiveInLife",
		[_minDistance, _maxDistance, _defaultDistance, 0],
		0,
		{
			["wheeled", _this, true, ((vehicle player) isKindOf "LandVehicle")] call lilc_settings_fnc_setObjectViewDistance;
		}
	] call CBA_Settings_fnc_init;
};

private _enableDistance = (["viewDistance_air_enableSetting", "BOOL", true] call lilc_common_fnc_getSetting);
if (_enableDistance) then
{
	private _minDistance = (["viewDistance_air_min", "NUMBER", 0] call lilc_common_fnc_getSetting);
	private _maxDistance = (["viewDistance_air_max", "NUMBER", 0] call lilc_common_fnc_getSetting);
	private _defaultDistance = (["viewDistance_air_default", "NUMBER", 0] call lilc_common_fnc_getSetting);
	[
		"lilc_setting_settings_viewDistance_air",
		"SLIDER",
		"Sichtweite (Luftfahrzeug)",
		"LiveInLife",
		[_minDistance, _maxDistance, _defaultDistance, 0],
		0,
		{
			["air", _this, true, ((vehicle player) == player)] call lilc_settings_fnc_setViewDistance;
		}
	] call CBA_Settings_fnc_init;
};

private _enableDistance = (["viewDistance_air_objects_enableSetting", "BOOL", true] call lilc_common_fnc_getSetting);
if (_enableDistance) then
{
	private _minDistance = (["viewDistance_air_objects_min", "NUMBER", 0] call lilc_common_fnc_getSetting);
	private _maxDistance = (["viewDistance_air_objects_max", "NUMBER", 0] call lilc_common_fnc_getSetting);
	private _defaultDistance = (["viewDistance_air_objects_default", "NUMBER", 0] call lilc_common_fnc_getSetting);
	[
		"lilc_setting_settings_viewDistance_air_objects",
		"SLIDER",
		"Objektsichtweite (Luftfahrzeug)",
		"LiveInLife",
		[_minDistance, _maxDistance, _defaultDistance, 0],
		0,
		{
			["air", _this, true, ((vehicle player) == player)] call lilc_settings_fnc_setObjectViewDistance;
		}
	] call CBA_Settings_fnc_init;
};
