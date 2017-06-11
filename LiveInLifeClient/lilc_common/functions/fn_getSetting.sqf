
/*
    Filename:
        fn_getSetting.sqf
    Author:
        Vincent Heins
    Description:
        This function gets a setting in the CfgMaster config file. It is recommended to use this function to get an specific property of CfgMaster without errors.
    Param(s):
        (_this select 0) : the property name : <STRING>
		(optional)(_this select 1) : a default value, if the property is not defined : <ANY>
	Result(s):
        the given data type : <ARRAY>, <STRING>, <SCALAR/INT/FLOAT>
*/

params [
    ["_settingName", "", [""]],
    ["_dataType", "STRING", [""]],
    ["_default", nil],
    ["_config", (missionConfigFile >> "CfgMaster"), [configNull]]
];

try
{
    if (isNull _config) throw _default;

    private _property = (_config >> _settingName);
    switch (_dataType) do
    {
        case "STRING":
        {
            if (isText _property) throw (getText _property);
        };

        case "NUMBER":
        {
            if (isNumber _property) throw (getNumber _property);
        };

        case "BOOL":
        {
            throw ([(getNumber _property)] call lilc_common_fnc_toBool);
        };

        case "ARRAY":
        {
            if (isArray _property) throw (getArray _property);
        };

        default
        {
            throw _default;
        };
    };

    throw _default;
}
catch
{
    _exception;
};
