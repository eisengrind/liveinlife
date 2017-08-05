
//6 viewdistance variables
/*lilc_settings_viewDistance_foot
lilc_settings_viewDistance_foot_objects
lilc_settings_viewDistance_wheeled
lilc_settings_viewDistance_wheeled_objects
lilc_settings_viewDistance_air
lilc_settings_viewDistnace_air_objects
*/

params [
    ["_viewDistanceType", "foot", [""]], //viewDistanceTypes: foot, wheeled, air
    ["_viewDistance", 0, [0]],
    ["_setVariable", true, [true]],
    ["_setDistance", true, [true]]
];

try
{
    if !(_viewDistanceType in ["foot", "wheeled", "air"]) throw false;
    if (_viewDistance < 0) throw false;

    private _maxViewDistance = ([(format["viewDistance_%1_max", _viewDistanceType]), "NUMBER", 0] call lilc_common_fnc_getSetting);
    private _minViewDistance = ([(format["viewDistance_%1_min", _viewDistanceType]), "NUMBER", 0] call lilc_common_fnc_getSetting);

    if (_viewDistance < _minViewDistance || _viewDistance > _maxViewDistance) throw false;

    if (_setVariable) then
    {
        missionNamespace setVariable [(format["lilc_settings_viewDistance_%1", _viewDistanceType]), _viewDistance];
    };

    if (_setDistance) then
    {
        setViewDistance _viewDistance;
    };
    
    throw true;    
}
catch
{
    _exception;
};
