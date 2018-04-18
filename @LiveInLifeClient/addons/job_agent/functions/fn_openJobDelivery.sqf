
params [
    ["_agent", "", [""]],
    ["_location", "", [""]]
];

if (_agent == "") exitWith {};
if (_location == "") exitWith {};

if !(createDialog "lilc_job_agent_select") exitWith {};
disableserialization;
(findDisplay 2049) setVariable ["lilc_job_agent_agent", _agent];

lbClear 2100;
{
    private _cfg = missionConfigFile >> "CfgJobAgents" >> _agent >> "jobs" >> (_x select 0);
    if !(isNull _cfg) then {
        if (_location in getArray(_cfg >> "locations")) then {
            private _i = lbAdd [2100, getText(_cfg >> "displayName")];
            lbSetData [2100, _i, (_x select 0)];
        };
    };
} forEach lilc_job_agent_activeTasks;
