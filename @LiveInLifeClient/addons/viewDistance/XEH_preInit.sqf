
private _enableDistance = (["viewDistance_foot_enableSetting", "BOOL", true] call lilc_common_fnc_getSetting);
if (_enableDistance) then
{
    private _minDistance = (["viewDistance_foot_min", "NUMBER", 0] call lilc_common_fnc_getSetting);
    private _maxDistance = (["viewDistance_foot_max", "NUMBER", 0] call lilc_common_fnc_getSetting);
    private _defaultDistance = (["viewDistance_foot_default", "NUMBER", 0] call lilc_common_fnc_getSetting);
    [
        "lilc_viewDistance_foot",
        "SLIDER",
        ("STR_lilc_viewDistance_SettingTitle_viewDistance_foot" call BIS_fnc_localize),
        "LiveInLife",
        [_minDistance, _maxDistance, _defaultDistance, 0],
        nil,
        {
            if (player isEqualTo (vehicle player)) then
            {
                setViewDistance _this;
            };
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
        "lilc_viewDistance_foot_objects",
        "SLIDER",
        ("STR_lilc_viewDistance_SettingTitle_viewDistance_foot_objects" call BIS_fnc_localize),
        "LiveInLife",
        [_minDistance, _maxDistance, _defaultDistance, 0],
        nil,
        {
            if (player isEqualTo (vehicle player)) then
            {
                setObjectViewDistance _this;
            };
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
        "lilc_viewDistance_wheeled",
        "SLIDER",
        ("STR_lilc_viewDistance_SettingTitle_viewDistance_wheeled" call BIS_fnc_localize),
        "LiveInLife",
        [_minDistance, _maxDistance, _defaultDistance, 0],
        nil,
        {
            if ((vehicle player) isKindOf "LandVehicle") then
            {
                setViewDistance _this;
            };
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
        "lilc_viewDistance_wheeled_objects",
        "SLIDER",
        ("STR_lilc_viewDistance_SettingTitle_viewDistance_wheeled_objects" call BIS_fnc_localize),
        "LiveInLife",
        [_minDistance, _maxDistance, _defaultDistance, 0],
        nil,
        {
            if ((vehicle player) isKindOf "LandVehicle") then
            {
                setObjectViewDistance _this;
            };
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
        "lilc_viewDistance_air",
        "SLIDER",
        ("STR_lilc_viewDistance_SettingTitle_viewDistance_air" call BIS_fnc_localize),
        "LiveInLife",
        [_minDistance, _maxDistance, _defaultDistance, 0],
        nil,
        {
            if ((vehicle player) isKindOf "Air") then
            {
                setViewDistance _this;
            };
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
        "lilc_viewDistance_air_objects",
        "SLIDER",
        ("STR_lilc_viewDistance_SettingTitle_viewDistance_air_objects" call BIS_fnc_localize),
        "LiveInLife",
        [_minDistance, _maxDistance, _defaultDistance, 0],
        nil,
        {
            if ((vehicle player) isKindOf "Air") then
            {
                setObjectViewDistance _this;
            };
        }
    ] call CBA_Settings_fnc_init;
};
