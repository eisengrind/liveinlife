
disableSerialization;
params [
    "_control",
    "_index"
];

private _jobAgent = (findDisplay 2049) getVariable ["lilc_job_agent_agent", ""];
private _jobAgentCfg = (missionConfigFile >> "CfgJobAgents" >> _jobAgent);
if (isNull _jobAgentCfg) exitWith {};

private _jobName = _control lbData _index;
if (_jobname == "") exitWith {};
if (({
    (_x select 0) == _jobName;
} count lilc_job_agent_activeTasks) <= 0) exitWith {};

private _jobConfig = (_jobAgentCfg >> "jobs" >> _jobName);
if (isNull _jobConfig) exitWith {};

{
    private _name = _x select 0;
    private _amount = _x select 1;
    private _i = _forEachIndex;
    {
        if ((_x select 0) == _name) exitWith {
            if ((count lilc_job_agent_activeTasks select _forEachIndex select 1) > _i) then {
                _amount = lilc_job_agent_activeTasks select _forEachIndex select 1 select _i;
            } else {
                lilc_job_agent_activeTasks select _forEachIndex select 1 pushBack _amount;
            };
        };
    } forEach lilc_job_agent_activeTasks;

    private _itemConfig = [_name] call lilc_common_fnc_getClassnameConfig;

    if (_amount > 0) then {
        private _i = lbAdd [1500, format["%1x %2", _amount, getText(_itemConfig >> "displayName")]];
        lbSetData [1500, _i, _name];
        lbSetValue [1500, _i, _amount];
        lbSetPicture [1500, _i, getText(_itemConfig >> "picture")];
    };
} forEach getArray(_jobConfig >> "items");
