
disableSerialization;
params [
    "_control",
    "_index"
];
systemChat str _this;

private _data = _control lbData _index;
private _value = _control lbValue _index;

ctrlShow [1600, (if (_value == 1) then { false; } else { true; })];

[(findDisplay 2048) getVariable ["lilc_job_agent_jobAgent", ""], _data] call lilc_job_agent_fnc_updateJobOffer;
