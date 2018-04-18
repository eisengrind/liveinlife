
private _jobAgent = (findDisplay 2048) getVariable ["lilc_job_agent_jobAgent", ""];
if (_jobAgent == "") exitWith {};

private _cI = lbCurSel 1500;
if (_cI <= -1) exitWith {};

private _data = lbData [1500, _cI];
private _value = lbValue [1500, _cI];

if (_value == 1) exitWith {
    ["Du hast dieses Angebot bereits angenommen.", "ERROR"] call lilc_ui_fnc_hint;
};

private _values = [];
{
    _values pushBack (_x select 1);
} forEach getArray(missionConfigFile >> "CfgJobAgents" >> _jobAgent >> "jobs" >> _data >> "items");

lilc_job_agent_activeTasks pushBack [_data, _values];

ctrlShow [1600, false];
lbSetValue [1500, _cI, 1];
lbSetColor [1500, _cI, [(22/255), (224/255), (49/255), 1]];

["Du hast das Angebot angenommen."] call lilc_ui_fnc_hint;
