
private _agentIndex = lbCurSel 2100;
if (_agentIndex <= -1) exitWith {};

private _jobName = lbData [2100, _agentIndex];
private _jobConfig = missionConfigFile >> "CfgJobAgents" >> ((findDisplay 2049) getVariable ["lilc_job_agent_agent", ""]) >> "jobs" >> _job;
if (isNull _jobConfig) exitWith {};

private _jobIndex = -1;
for "_i" from 0 to (count lilc_job_agent_activeTasks) - 1 do {
    if (_jobName == (lilc_job_agent_activeTasks select _i select 0)) exitWith {
        _jobIndex = _i;
    };
};
if (_jobIndex <= -1) exitWith {};

private _items = getArray(_jobConfig >> "items");

private _cI = lbCurSel 1500;
if (_cI <= -1) exitWith {};

private _classname = lbData [1500, _cI];
private _itemConfig = [_classname] call lilc_common_fnc_getClassnameConfig;
if (isNull _itemConfig) exitWith {};

private _amountIndex = -1;
for "_i" from 0 to (count _items) - 1 do {
    if ((_items select _i select 0) == _classname) exitWith {
        _amountIndex = _i;
    };
};
if (_amountIndex <= -1) exitWith {};

private _amount = lilc_job_agent_activeTasks select _jobIndex select 1 select _amountIndex;
if (_amount <= 0) exitWith {
    lbSetCurSel [2100, _agentIndex];
};

if (ctrlEnabled 1600) exitWith {};
ctrlEnable [1600, false];

if !([player, _classname] call lilc_inventory_fnc_remove) exitWith {
    ["Du besitzt dieses Item nicht.", "ERROR"] call lilc_ui_fnc_hint;
    ctrlEnable [1600, true];
};

lilc_job_agent_activeTasks select _jobIndex select 1 set [_amountIndex, _amount - 1];
lbSetCurSel [2100, _agentIndex];

private _fin = true;
{
    if (_x > 0) exitWith {
        _fin = false;
    };
} forEach (lilc_job_agent_activeTasks select _jobIndex select 1);

if (_fin) then {
    closeDialog 0;
    [getNumber(_jobConfig >> "price")] call lilc_cash_fnc_add;
    lilc_job_agent_activeTasks deleteAt _jobIndex;
    lilc_job_agent_stage = lilc_job_agent_stage + 1;
};

ctrlEnable [1600, true];
