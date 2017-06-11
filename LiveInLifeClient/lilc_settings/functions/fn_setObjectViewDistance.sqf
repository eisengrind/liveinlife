
params [
    ["_viewDistanceType", "foot", [""]],
    ["_viewDistance", 0, [0]]
];

try
{
    if !(_viewDistanceType in ["foot", "wheeled", "air"]) throw false;
    if (_viewDistance < 0) throw false;

    private _maxViewDistance = ([(format["viewDistance_%1_objects_max", _viewDistanceType]), "NUMBER", 0] call lilc_common_fnc_getSetting);
    private _minViewDistance = ([(format["viewDistance_%1_objects_min", _viewDistanceType]), "NUMBER", 0] call lilc_common_fnc_getSetting);

    if (_viewDistance < _minViewDistance || _viewDistance > _maxViewDistance) throw false;

    if (_setVariable) then
    {
        missionNamespace setVariable [(format["lilc_settings_viewDistance_%1_objects", _viewDistanceType]), _viewDistance];
    };

    if (_setDistance) then
    {
        setObjectViewDistance _viewDistance;
    };
    throw true;    
}
catch
{
    _exception;
};
