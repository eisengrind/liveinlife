
params [
    ["_jobAgent", "", [""]]
];

private _jobAgentCfg = (missionConfigFile >> "CfgJobAgents" >> _jobAgent);
if (isNull _jobAgentCfg) exitWith {};

disableSerialization;
if !(createDialog "lilc_job_agent") exitWith {};

((findDisplay 2048) displayCtrl 1600) ctrlAddEventHandler ["ButtonClick", {call lilc_job_agent_fnc_onButtonClick_accept;}];
(findDisplay 2048) setVariable ["lilc_job_agent_jobAgent", _jobAgent];

ctrlSetText [1001, getText(_jobAgentCfg >> "displayName")];

lbClear 1500;
{
    private _cfg = (_jobAgentCfg >> "jobs" >> _x);
    private _i = lbAdd [1500, getText(_cfg >> "displayName")];
    lbSetColor [1500, _i, [(22/255), (224/255), (49/255), 1]];
    lbSetData [1500, _i, _x];
    lbSetValue [1500, _i, 1];
} forEach lilc_job_agent_activeTasks;

{
    if (getNumber(_x >> "stage") == lilc_job_agent_stage && !((configName _x) in lilc_job_agent_activeTasks)) then {
        private _i = lbAdd [1500, getText(_x >> "displayName")];
        lbSetData [1500, _i, configName _x];
        lbSetValue [1500, _i, 0];
    };
} forEach ("true" configClasses (_jobAgentCfg >> "jobs"));

lbSetCurSel [1500, 0];
private _data = lbData [1500, 0];
private _value = lbValue [1500, 1];

if (_value == 1) then {
    ctrlShow [1600, false];
};

systemChat str _data;
[_jobAgent, _data] call lilc_job_agent_fnc_updateJobOffer;
